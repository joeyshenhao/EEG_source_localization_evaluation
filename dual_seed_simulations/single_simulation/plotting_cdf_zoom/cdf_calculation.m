load('/data/users/shenhao/000_sci_simu/[[]]2/Fixed_doneFiltering/Combined/SNR12_01+0.mat');

[YCDF,XCDF]=cdf_calculate(X_simu);cdf_simu=[XCDF,YCDF];
[YCDF,XCDF]=cdf_calculate(X_est_fulldugh);cdf_fulldugh=[XCDF,YCDF];
[YCDF,XCDF]=cdf_calculate(X_est_thindugh);cdf_thindugh=[XCDF,YCDF];
[YCDF,XCDF]=cdf_calculate(X_est_mackay);cdf_mackay=[XCDF,YCDF];
[YCDF,XCDF]=cdf_calculate(X_est_bstmn);cdf_bstmn=[XCDF,YCDF];
[YCDF,XCDF]=cdf_calculate(X_est_eloreta);cdf_eloreta=[XCDF,YCDF];
clearvars -except cdf_simu cdf_fulldugh cdf_thindugh cdf_eloreta cdf_bstmn cdf_mackay