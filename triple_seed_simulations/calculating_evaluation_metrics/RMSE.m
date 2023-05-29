function result = RMSE(X_est,X_simu)
    X_est_normalized = X_est/norm(X_est,"fro");
    X_simu_normalized = X_simu/norm(X_simu,"fro");
    result = norm(X_est_normalized-X_simu_normalized,"fro")^2;
end