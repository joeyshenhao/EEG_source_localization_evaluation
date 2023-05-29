function [X,k] = ThinDugh_SH_GPU(Y,L,varargin)
% disp('ThinDugh starts...');
% tic;
% Author: Hao Shen Written based on github codes of Ali Hashemi et al.,
% NeurIPS 2021. Usage example: 
% [X] =ThinDugh_SH_GPU(Y,L,'temporal_update_mode','Toeplitz',...
%     'epsilon',1e-10,'max_iters',1000,'print_figures',0);

% Main Inputs: 
% Y(M*T) = preprocessed EEG recordings
% L(M*N) = Lead field matrix
% M = num of electrodes
% N = num of estimated sources (3x or 1x)
% T = num of time samples
% Output:
% X(N*T) = estimated EEG source activities/amplitudes
%% Define Main Parameters
[M,N] = size(L);
T = size(Y,2);
G = 2*T-1;
%% varargin pairwise parameter input
if(mod(length(varargin),2)==1)
    error('Optional parameters should always go by pairs\n');
else
    for i=1:2:(length(varargin)-1)
        switch lower(varargin{i})	
            case 'temporal_update_mode'
                temporal_update_mode = varargin{i+1};	
            case 'epsilon'
                EPSILON = varargin{i+1}; 
            case 'max_iters'
                k_max = varargin{i+1};  
            case 'print_figures'
                print_figures = varargin{i+1}; 
            otherwise
                error(['Unrecognized parameter: ''' varargin{i} '''']);
        end
    end
end
%% thinDugh begins
Phi = gpuArray([L,eye(M)]);
k = 0;
Y = gpuArray(Y);
h_k = rand(N+M,1,'gpuArray');
p_k = rand(G-1,1);
p_k = (p_k+flipud(p_k))/2;
p_k = gpuArray([rand(1);p_k]); 

X_old = zeros(N,T,'gpuArray');
keep_looping = true;
while(keep_looping)
%     disp('1 loop starts...')
    H_k = sparse(diag(h_k));
    Gamma_k = sparse(diag(h_k(1:N)));
    Sigma_y_k = full(Phi*H_k*Phi.');
    Sigma_y_k = (Sigma_y_k + Sigma_y_k.')/2;
    Sigma_y_k_inv = Sigma_y_k^-1;
    clearvars Sigma_y_k
    X_k = Gamma_k*L.'*Sigma_y_k_inv*Y;
    clearvars Gamma_k
    keep_looping = ~(norm(X_old-X_k,'fro')<EPSILON || k==k_max-1 );
    if print_figures && k>=1
        X_itr_est_error(k) = norm(X_k-X_old,'fro')/norm(X_old,'fro');
        plot(X_itr_est_error);
    end
    switch temporal_update_mode
        case 'Identity' 
            B_k = eye(T);
        case 'Toeplitz'
            M_time_k = 1/M*Y.'*Sigma_y_k_inv*Y;                                             
            P_k = sparse(diag(p_k));
            Q = 1/sqrt(G)*[eye(T),zeros(T,G-T)]*dftmtx(G);
            B_k = real(Q*P_k*Q');
            B_k = (B_k + B_k.')/2;
            % check if B_k is positive definite
%             if all(eig(B_k)>0) && issymmetric(B_k)
%             if all(eig(B_k)>0)
%             if issymmetric(B_k)
%                 disp(['B_',num2str(k),' is a positive definite matrix.']);
%             else
%                 disp(['B_',num2str(k),' is NOT a positive definite matrix.']);
%             end
            B_k_inv = B_k^-1;
            clearvars B_k
            q_k = real(diag(P_k*Q'*B_k_inv*M_time_k*B_k_inv*Q*P_k));
            clearvars M_time_k P_k
            r_k = real(diag(Q'*B_k_inv*Q));
            clearvars Q
            p_k1 = sqrt(q_k./r_k);
            clearvars q_k r_k
    end

    U = H_k*Phi.'*Sigma_y_k_inv;
    clearvars H_k
    M_SN_k = U*(1/T*Y*B_k_inv*Y.')*U.';
    clearvars U B_k_inv
    g_k = diag(M_SN_k);  
    clearvars M_SN_k
    z_k = diag(Phi.'*Sigma_y_k_inv*Phi);
    clearvars Sigma_y_k_inv
    h_k1 = (g_k./z_k).^0.5;
    clearvars g_k z_k

    k = k+1;
    if strcmp(temporal_update_mode,'Toeplitz')
        p_k = p_k1;
        clearvars p_k1
    end
    h_k = h_k1;
    clearvars h_k1

    X_old = X_k;
end

X = gather(X_k);

% toc;
end