load('SNR12_01.mat');
load('../bst_mn_inversekernel.mat');  % [ALERT] Change this into new directory.

for ll = 1:30
    Y_simu_fulldugh = generate_Y_simu(L(2:end,:),X_simu,SNR_simu,'notBST_MN');
    Y_simu_bstmn = [-mean(Y_simu_fulldugh,1);Y_simu_fulldugh-mean(Y_simu_fulldugh,1)];
% BST-MN requires the input EEG is under average reference.

    X_est_bstmn = bst_mn_inversekernel.ImagingKernel*Y_simu_bstmn;
    X_est_eloreta = eLORETA_SH(Y_simu_fulldugh,L(2:end,:));
    X_est_fulldugh = Full_Dugh_SH_GPU_simp(Y_simu_fulldugh,L(2:end,:),...
        'epsilon',1e-9,'max_iters',1000);
    X_est_mackay = MacKay_SH(Y_simu_fulldugh,L(2:end,:),'source_dimension',1,...
        'epsilon',1e-10,'max_iters',1000,'print_figures',0);
    X_est_thindugh = ThinDugh_SH_GPU(Y_simu_fulldugh,L(2:end,:),...
        'temporal_update_mode','Toeplitz', ...
        'epsilon',1e-10,'max_iters',1000,'print_figures',0);

    save(strcat('SNR',num2str(SNR_simu),'_01+',num2str(ll),'.mat'),...
    'timepoints','sampling_freq','lambda','indx','signal_freq','maxamp',...
    'SNR_simu','X_simu','L','Y_simu_bstmn',"Y_simu_fulldugh",...
    "X_est_fulldugh","X_est_eloreta","X_est_bstmn","X_est_thindugh",...
    "X_est_mackay");
end