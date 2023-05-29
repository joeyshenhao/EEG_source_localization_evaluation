function X = eLORETA_SH(Y,L)
% Author: Shen Hao
% Reproduced based on the NeuRIPS2021-paper github codes.

% Input: Y∈R(M*T) as the EEG recording, L∈R(M*N) as lead field matrix, 

% T = num of time samples
% M = num of electrodes
% N = num of EEG sources components

% Output: X∈R(N*T) as the EEG source components.

[M,N] = size(L);
nd = 1; % num of source orientations.
LF_eLORETA = reshape(L,M,nd,N/nd);
LF_eLORETA = permute(LF_eLORETA,[1 3 2]);
regu = 0.05; 
% regu as the regularization parameter for eLORETA, based on the
% NeuRIPS2021-paper github code.

%% Step 1 detrend EEG recordings
Y = Y';
[~, nc, nt] = size(Y); % nc = M; nt = # trials (here nt = 1)
for i=1:nc
    for j =1:nt
        Y(:,i,j) = detrend(Y(:,i,j));
    end
end

%% Step 2 eLORETA
Y_eLORETA = permute(Y,[2 1 3]);
    
A = mkfilt_eloreta_v2(double(LF_eLORETA),regu);
A = permute(A,[1 3 2]);
A = reshape(A,size(A,1),size(A,2)*size(A,3));
    
X = A' * Y_eLORETA;    
end