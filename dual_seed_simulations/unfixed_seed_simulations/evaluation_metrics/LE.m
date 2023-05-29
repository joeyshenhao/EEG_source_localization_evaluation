function result = LE(X_est,max_seed_idx)
% Seed Localization Error (LE).
    load('../HeadModel_000_sci.mat');  % [ALERT] Change this into new directory.
    
    q_est = diag(X_est*X_est.');
    max_q_est_idx = find(q_est==max(q_est));
    distance_vector = HeadModel.GridLoc(max_seed_idx,:)-HeadModel.GridLoc(max_q_est_idx,:);
    le = norm(distance_vector);  % unit:m                                          
    result = 1000*le; % unit:mm
end