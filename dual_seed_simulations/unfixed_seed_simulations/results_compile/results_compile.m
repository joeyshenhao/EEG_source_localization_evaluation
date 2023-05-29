tic;
list=[0 3 6 9 12];
% auc_compile=[];
mse_compile=[];
rmse_compile=[];
cdfabs_compile=[];
le_20hz_compile=[];le_45hz_compile=[];
sd1_20hz_compile=[];sd1_45hz_compile=[];
sd2_20hz_compile=[];sd2_45hz_compile=[];
sd_37_20hz_compile=[];sd_37_45hz_compile=[];
sd_90_20hz_compile=[];sd_90_45hz_compile=[];
sd_95_20hz_compile=[];sd_95_45hz_compile=[];

for ii=1:length(list)
    load([pwd,'/ssnr',num2str(list(ii)),'_Results_new.mat']);
%     auc_compile = cat(3,auc_compile,auc);
    cdfabs_compile = cat(3,cdfabs_compile,cdfabs);
    rmse_compile = cat(3,rmse_compile,rmse);
    mse_compile = cat(3,mse_compile,mse);
    le_20hz_compile = cat(3,le_20hz_compile,le_20hz);
    le_45hz_compile = cat(3,le_45hz_compile,le_45hz);
    sd1_20hz_compile = cat(3,sd1_20hz_compile,sd1_20hz);
    sd1_45hz_compile = cat(3,sd1_45hz_compile,sd1_45hz);
    sd2_20hz_compile = cat(3,sd2_20hz_compile,sd2_20hz);
    sd2_45hz_compile = cat(3,sd2_45hz_compile,sd2_45hz);
    sd_37_20hz_compile = cat(3,sd_37_20hz_compile,sd_37_20hz);
    sd_37_45hz_compile = cat(3,sd_37_45hz_compile,sd_37_45hz);
    sd_90_20hz_compile = cat(3,sd_90_20hz_compile,sd_90_20hz);
    sd_90_45hz_compile = cat(3,sd_90_45hz_compile,sd_90_45hz);
    sd_95_20hz_compile = cat(3,sd_95_20hz_compile,sd_95_20hz);
    sd_95_45hz_compile = cat(3,sd_95_45hz_compile,sd_95_45hz);
end
save('Results_compile_new.mat','rmse_compile','mse_compile','cdfabs_compile',...
    'le_20hz_compile','le_45hz_compile',...
     'sd1_20hz_compile','sd1_45hz_compile',...
     'sd2_20hz_compile','sd2_45hz_compile',...
     'sd_37_20hz_compile','sd_37_45hz_compile',...
     'sd_90_20hz_compile','sd_90_45hz_compile',...
     'sd_95_20hz_compile','sd_95_45hz_compile');
toc;