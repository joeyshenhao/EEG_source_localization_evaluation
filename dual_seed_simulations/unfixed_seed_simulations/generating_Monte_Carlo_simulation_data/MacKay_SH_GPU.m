function [X,k] = MacKay_SH_GPU(Y,L,varargin)
tic;
% Author: Hao Shen Written based on github codes of Ali Hashemi et al.,
% NeurIPS 2021. 
% 
% Usage example: 
% [X] = MacKay_SH_GPU(Y,L,'source_dimension',1,...
%     'epsilon',1e-10,'max_iters',1000,'print_figures',0);
% 
% Main Inputs: 
% Y(M*T) = preprocessed EEG recordings 
% L(M*(dc*N)) = Leadfield matrix
% M = num of electrodes 
% N = num of estimated sources 
% dc = 3 or 1, AKA 'source_dimension' above 
% T = num of time samples
% A = Estimated gain matrix of noise, A=I if no prior knowledge.
% Output: 
% X(N*T) = estimated EEG source activities/amplitudes
%% Define Main Parameters
[M,N] = size(L);
T = size(Y,2);
A = eye(M);
%% varargin pairwise parameter input
if(mod(length(varargin),2)==1)
    error('Optional parameters should always go by pairs\n');
else
    for i=1:2:(length(varargin)-1)
        switch lower(varargin{i})	
            case 'source_dimension'
                dc = varargin{i+1};
            case 'noise_gain_matrix'
                A = varargin{i+1};
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
%% Recheck Main Parameters
N = N/dc;
if rem(N,1)~=0
    error('False dimension detected! Please recheck your inputs.');
end
%% thinDugh begins
Phi = gpuArray([L,A]);
k = 0;
h_k = rand(N+M,1,'gpuArray');
flag=0;

X_old = zeros(N,T,'gpuArray');
keep_looping = true;
while(keep_looping)
%     disp('1 loop starts...')
    H_k = sparse(diag([kron(h_k(1:N,:),ones(dc,1));h_k(N+1:end,:)]));
    Sigma_y_k = full(Phi*H_k*Phi.');
    Sigma_y_k = (Sigma_y_k + Sigma_y_k.')/2;
    Sigma_y_k_inv = Sigma_y_k^-1;
    clearvars Sigma_y_k
    X_k = H_k*Phi.'*Sigma_y_k_inv*Y;
    if numel(find(isnan(X_k)))~=0
        X = gather(X_old(1:dc*N,:));
        flag=1;
        break;
    end
    clearvars H_k
    keep_looping = ~(norm(X_old(1:dc*N,:)-X_k(1:dc*N,:),'fro')<EPSILON || k==k_max-1 );
    if print_figures && k>=1
        X_itr_est_error(k) = norm(X_k(1:dc*N,:)-X_old(1:dc*N,:),'fro')/norm(X_old(1:dc*N,:),'fro');
        plot(X_itr_est_error);
    end
    for j=1:(N+M)
        if j<=N
            h_k1(j,1)=1/T*norm(X_k((dc*(j-1)+1):dc*j,:),'fro')^2/(h_k(j)*trace(Phi(:,j).'*Sigma_y_k_inv*Phi(:,j)));
        else
            h_k1(j,1)=1/T*norm(X_k((dc*N+j-N),:),'fro')^2/(h_k(j)*trace(Phi(:,j).'*Sigma_y_k_inv*Phi(:,j)));
        end
    end
    clearvars Sigma_y_k_inv

    k = k+1;
    h_k = h_k1;
    clearvars h_k1

    X_old = X_k;
end

if flag~=1
    X = gather(X_k(1:dc*N,:));
end

toc;
end  