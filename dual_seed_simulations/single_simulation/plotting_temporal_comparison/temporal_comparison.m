load('SNR12_29.mat');

X_norm_simu = X_simu(indx,:);
X_norm_est_fulldugh = X_est_fulldugh(indx,:);
X_norm_est_eloreta = X_est_eloreta(indx,:);
X_norm_est_bstmn = X_est_bstmn(indx,:);
X_norm_est_thindugh = X_est_thindugh(indx,:);
X_norm_est_mackay = X_est_mackay(indx,:);
clearvars -except X_norm_est_bstmn X_norm_est_eloreta X_norm_est_fulldugh X_norm_simu X_norm_est_thindugh X_norm_est_mackay
save('temporal_comparison_for_plotting.mat','X_norm_simu','X_norm_est_fulldugh',...
    'X_norm_est_eloreta','X_norm_est_bstmn','X_norm_est_thindugh','X_norm_est_mackay');