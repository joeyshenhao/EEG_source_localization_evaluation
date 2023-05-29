tic;
files=dir([pwd,'/','SNR*.mat']);

for ii=1:length(files)
    disp(['1 Start...  ',datestr(now,0)]);
    load(files(ii).name);

    X_filtered_est_bstmn=zeros(size(X_simu,1),timepoints,max(size(signal_freq)));
    X_filtered_est_eloreta=zeros(size(X_simu,1),timepoints,max(size(signal_freq)));
    X_filtered_est_fulldugh=zeros(size(X_simu,1),timepoints,max(size(signal_freq)));
    X_filtered_est_mackay=zeros(size(X_simu,1),timepoints,max(size(signal_freq)));
    X_filtered_est_thindugh=zeros(size(X_simu,1),timepoints,max(size(signal_freq)));

    for l = 1:max(size(signal_freq))
        parfor o = 1:size(X_simu,1)
            
            X_filtered_est_bstmn(o,:,l) = bandpass(X_est_bstmn(o,:),...
                [signal_freq(l)-1,signal_freq(l)+1],sampling_freq);
            X_filtered_est_eloreta(o,:,l) = bandpass(X_est_eloreta(o,:),...
                [signal_freq(l)-1,signal_freq(l)+1],sampling_freq);
            X_filtered_est_fulldugh(o,:,l) = bandpass(X_est_fulldugh(o,:),...
                [signal_freq(l)-1,signal_freq(l)+1],sampling_freq);
             X_filtered_est_mackay(o,:,l) = bandpass(X_est_mackay(o,:),...
                [signal_freq(l)-1,signal_freq(l)+1],sampling_freq);
            X_filtered_est_thindugh(o,:,l) = bandpass(X_est_thindugh(o,:),...
                [signal_freq(l)-1,signal_freq(l)+1],sampling_freq);
        end

    end
    save(['f',files(ii).name(1:end-4),'f.mat'],'X_filtered_est_bstmn',...
            'X_filtered_est_eloreta','X_filtered_est_fulldugh',...
            'X_filtered_est_mackay','X_filtered_est_thindugh');
    disp(['1 Done...  ',datestr(now,0)]);
end

toc;