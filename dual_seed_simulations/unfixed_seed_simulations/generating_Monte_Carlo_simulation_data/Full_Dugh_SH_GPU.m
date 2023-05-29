function [X] = Full_Dugh_SH_GPU(Y,L,varargin)
% Author: Hao Shen
% Written based on github codes of Ali Hashemi et al., NeurIPS 2021.
% Usage example: 
% [X] = Full_Dugh_SH(Y,L,'epsilon',1e-8,'max_iters',200);

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

%% varargin pairwise parameter input
if(mod(length(varargin),2)==1)
    error('Optional parameters should always go by pairs\n');
else
    for i=1:2:(length(varargin)-1)
        switch lower(varargin{i})	
            case 'epsilon'
                EPSILON = varargin{i+1}; 
            case 'max_iters'
                k_max = varargin{i+1};  
%             case 'print_figures'
%                 print_figures = varargin{i+1}; 
            otherwise
                error(['Unrecognized parameter: ''' varargin{i} '''']);
        end
    end
end
%% thinDugh begins
Phi = sparse(gpuArray([L,eye(M)]));
k = 0;
h_k = rand(N+M,1,'gpuArray');
Y = gpuArray(Y);

% Random Initialization for B (B_k=B_0)
tmp =  randn(T,'gpuArray');
B_k = tmp.'*tmp;
B_k = B_k + 0.01*eye(T,'gpuArray');
B_k = B_k/trace(B_k);
disp(['rank of B_0:',num2str(rank(B_k))]);
if all(eig(B_k)>0) && issymmetric(B_k)
    disp(['B_',num2str(k),' is a positive definite matrix.']);
end
clearvars tmp

X_old = zeros(N,T,'gpuArray');
keep_looping = true;
while(keep_looping)
    H_k = sparse(diag(h_k));
    Gamma_k = sparse(diag(h_k(1:N)));
    Sigma_y_k = full(Phi*H_k*Phi.');
    Sigma_y_k = (Sigma_y_k + Sigma_y_k.')/2;
    Sigma_y_k_inv = Sigma_y_k^-1;
    clearvars Sigma_y_k
    X_k = real(Gamma_k*L.'*Sigma_y_k_inv*Y);
    clearvars Gamma_k
    keep_looping = ~( (norm(X_old-X_k,'fro')<EPSILON && k>=1) || k==k_max-1 );
%     if print_figures && k>=1
%         X_itr_est_error(k) = (norm(X_k-X_old,'fro')/norm(X_old,'fro'))^2;
%         plot(X_itr_est_error);
%     end

    % Update B based on Eq.(7) of NeuRIPS2021-paper.
    M_time_k = 1/M*Y.'*Sigma_y_k_inv*Y;
    M_time_k = (M_time_k + M_time_k.')/2;
    disp(['k=',num2str(k)]);
    disp(['rank of M_time_k:',num2str(rank(M_time_k))]);
    B_k1 = B_k^0.5*(B_k^(-0.5)*M_time_k*B_k^(-0.5))^0.5*B_k^0.5;
    B_k1 = (B_k1 + B_k1.')/2;
    clearvars M_time_k

%     [Crutial Note by authors.] As rank(M_time_k) may not match
%     rank(B_k), imaginary components with no physiological indication
%     (flawed algorithm to begin with) would appear in B_k1. So to assure
%     the code would still proceed, we simply applied real() function to
%     X_k at every iteration, inspired by github codes of Ali Hashemi et
%     al., NeurIPS 2021.

    disp(['rank of B_k+1:',num2str(rank(B_k1))]);

    U = H_k*Phi.'*Sigma_y_k_inv;
    M_SN_k = U*(1/T*Y*B_k^-1*Y.')*U.';
    clearvars H_k U
    M_SN_k = (M_SN_k + M_SN_k.')/2;
    g_k = diag(M_SN_k);  
    clearvars M_SN_k
    % making sure M_SN_k is symmetric helps assure g_k are all positive.

    z_k = diag(Phi.'*Sigma_y_k_inv*Phi);
    h_k1 = complex(g_k./z_k).^0.5;
    clearvars g_k z_k Sigma_y_k_inv

    k = k+1;
    disp([num2str(k),'/',num2str(k_max),' iterations Done...  ',datestr(now,0)]); 
    % Indication Added by SH 

    B_k = B_k1;
    clearvars B_k1
    if all(eig(B_k)>0) && issymmetric(B_k)
        disp(['B_',num2str(k),' is a positive definite matrix.']);
    else
        disp(['B_',num2str(k),' is NOT a positive definite matrix.']);
    end
    h_k = h_k1;
    clearvars h_k1

    X_old = X_k;
end

X = gather(X_k);
end
