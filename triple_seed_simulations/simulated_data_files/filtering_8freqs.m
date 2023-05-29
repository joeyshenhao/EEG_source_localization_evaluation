files=dir([pwd,'/','SNR*.mat']);
seed_freq_list = [0.2 0.7 3 5 11 17 43 67];
for ii=1:length(files)
    disp(['1 Start...  ',datestr(now,0)]); 
    load(files(ii).name);
   
    for l = 1:length(seed_freq_list)
        [~,d] = bandpass(X_est_mackay(1,:),[seed_freq_list(l)-0.1 seed_freq_list(l)+0.1],sampling_freq);
        X_filtered_est_mackay(:,:,l) = gather(filter(d,gpuArray(X_est_mackay).').');
        X_filtered_est_thindugh(:,:,l) = gather(filter(d,gpuArray(X_est_thindugh).').');
        X_filtered_est_eloreta(:,:,l) = gather(filter(d,gpuArray(X_est_eloreta).').');
    end
    save(['f',files(ii).name(1:end-4),'_f.mat'],'X_filtered_est_mackay',...
            'X_filtered_est_thindugh',"X_filtered_est_eloreta");
    disp(['1 Done...  ',datestr(now,0)]); 

end