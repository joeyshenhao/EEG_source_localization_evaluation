function result = SD_percent(X_simu,X_est,seed_freq,percentage)
% Spatial Dispersion (SD) of activation zone where we designate
% energy>percentage*global_maxima_energy as "active".
    load('../HeadModel_000_sci.mat');  % [ALERT] Change this into new directory.

    q_est = diag(X_est*X_est.');
    sampling_freq = 200;
    [~,d] = bandpass(X_simu(1,:),[seed_freq-1 seed_freq+1],sampling_freq);
    X_filtered_simu = gather(filter(d,gpuArray(X_simu).').');
    q_simu = diag(X_filtered_simu*X_filtered_simu.');
    simu_activezone_indexes = find(q_simu>=percentage*max(q_simu)); 
    est_activezone_indexes = find(q_est>=percentage*max(q_est));
    sd_list = zeros(size(est_activezone_indexes,1),1);
    for uuu = 1:size(est_activezone_indexes,1)
        distance_vector = HeadModel.GridLoc(simu_activezone_indexes,:)-HeadModel.GridLoc(est_activezone_indexes(uuu),:);
        distance = zeros(size(distance_vector,1),1);
        for ttt = 1:size(distance_vector,1)
            distance(ttt)=norm(distance_vector(ttt,:));
        end
        dis = min(distance);  % unit:m
        sd_list(uuu) = dis^2*q_est(est_activezone_indexes(uuu));
    end
    result = 1000*sqrt(sum(sd_list)/sum(q_est(est_activezone_indexes)));  % unit:mm

end