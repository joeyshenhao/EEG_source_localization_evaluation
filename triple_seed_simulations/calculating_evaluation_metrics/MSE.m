% Mean Square Error, normalized by X_simu.
function result = MSE(X_est,X_simu)
    result = norm(X_est-X_simu,"fro")^2/norm(X_simu,'fro')^2;
end