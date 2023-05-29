function result = SD(X_est,max_seed_idx,lambda,r)
% Spatial Dispersion (SD) of activation zone based on Euclidean distance to
% corresponding seed.
    load('../HeadModel_000_sci.mat');  % [ALERT] Change this into new directory.
    
    distance_vector = HeadModel.GridLoc-HeadModel.GridLoc(max_seed_idx,:);
    distance = zeros(size(X_est,1),1);
    for mmm = 1:size(X_est,1)
        distance(mmm)=norm(distance_vector(mmm,:));
    end
%     lol = 1;
    simu_activezone_indexes = find(distance<r*lambda); 
    
    P = size(simu_activezone_indexes,1);

    q_est = diag(X_est*X_est.');
    q_list = sort(q_est,'descend');
    est_activezone_indexes = find(q_est>=q_list(P));
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