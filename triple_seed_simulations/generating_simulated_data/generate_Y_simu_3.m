function [Y_simu] = generate_Y_simu_3(L,X_simu,SNR,method)
% generate Y_simu(unit: V).
% L unit: V/(A.m)
% X_simu unit: A.m
% SNR = 0-12
    Y_signal = L*X_simu;
    Y_noise = pinknoise(size(Y_signal,2),size(Y_signal,1)).';
    Y_simu = Y_signal + 0.1^(SNR/20)*norm(Y_signal,'fro')/norm(Y_noise,'fro')*Y_noise;
if strcmp(method,'BST_MN')==1
    Y_simu = Y_simu - mean(Y_simu,1);
end

end