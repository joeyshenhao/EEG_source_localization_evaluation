function gpu3_0(SNR_simu,NUM,Category)
% Category='Deep','Middle','Superficial'

% tic;
load('../HeadModel_000_sci.mat');  % [ALERT] Change this into new directory.

timepoints=6*140;
sampling_freq=140;
lambda=0.003;

lowband=[0.2;0.7;3;5];
highband=[11;17;43;67];

if randn>=0
    seed_freq=[lowband,highband];
    seed_amp=[20e-9*ones(4,1),10e-9*ones(4,1),[20e-9;20e-9;10e-9;10e-9]];
else
    seed_freq=[highband,lowband];
    seed_amp=[10e-9*ones(4,1),20e-9*ones(4,1),[20e-9;20e-9;10e-9;10e-9]];
end
freq_list_add = [lowband(randperm(length(lowband),2));highband(randperm(length(highband),2))];
seed_freq=[seed_freq,freq_list_add];
% seed_freq=[[0.2;0.7;3;5],[11;17;43;67],[0.2;0.7;43;67]];
% seed_amp=[20e-9*ones(4,1),10e-9*ones(4,1),[20e-9;20e-9;10e-9;10e-9]];

L = Gain_constrained;
[X_simu,seed_indx] = generate_X_simu_multi(HeadModel.GridLoc,timepoints,sampling_freq,lambda,seed_freq,seed_amp,Category);
Y_simu_eloreta = generate_Y_simu_3(L(2:end,:),X_simu,SNR_simu,'notBST_MN');

X_est_eloreta = eLORETA_SH(Y_simu_eloreta,L(2:end,:));
X_est_mackay = MacKay_SH(Y_simu_eloreta,L(2:end,:),'source_dimension',1,...
        'epsilon',1e-10,'max_iters',1000,'print_figures',0);
X_est_thindugh = ThinDugh_SH_GPU(Y_simu_eloreta,L(2:end,:),...
        'temporal_update_mode','Toeplitz', ...
        'epsilon',1e-10,'max_iters',1000,'print_figures',0);

save(strcat('SNR',num2str(SNR_simu),'_',num2str(NUM),'_',Category,'.mat'),...
    'timepoints','sampling_freq','lambda','seed_indx','seed_freq','seed_amp',...
    'SNR_simu','X_simu','L',...
    'Y_simu_eloreta',"X_est_eloreta","X_est_mackay","X_est_thindugh");
% fprintf(strcat(files(ii).name,'  done...',datestr(now,0),'\n'));
% toc;
end