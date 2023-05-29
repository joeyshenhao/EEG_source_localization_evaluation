clear;
tic;
list=[0 3 6 9 12];

mse_compile=[]; rmse_compile=[]; cdfabs_compile=[];
le_0_2hz_compile=[]; le_0_7hz_compile=[]; le_3hz_compile=[]; le_5hz_compile=[];
le_11hz_compile=[]; le_17hz_compile=[]; le_43hz_compile=[]; le_67hz_compile=[];

sd_37_0_2hz_compile=[]; sd_37_0_7hz_compile=[]; sd_37_3hz_compile=[]; sd_37_5hz_compile=[];
sd_37_11hz_compile=[]; sd_37_17hz_compile=[]; sd_37_43hz_compile=[]; sd_37_67hz_compile=[];

sd_90_0_2hz_compile=[]; sd_90_0_7hz_compile=[]; sd_90_3hz_compile=[]; sd_90_5hz_compile=[];
sd_90_11hz_compile=[]; sd_90_17hz_compile=[]; sd_90_43hz_compile=[]; sd_90_67hz_compile=[];

sd_95_0_2hz_compile=[]; sd_95_0_7hz_compile=[]; sd_95_3hz_compile=[]; sd_95_5hz_compile=[];
sd_95_11hz_compile=[]; sd_95_17hz_compile=[]; sd_95_43hz_compile=[]; sd_95_67hz_compile=[];

for ii=1:length(list)
    load([pwd,'/snr',num2str(list(ii)),'_Results_Deep.mat']);
    cdfabs_compile = cat(3,cdfabs_compile,cdfabs);
    rmse_compile = cat(3,rmse_compile,rmse);
    mse_compile = cat(3,mse_compile,mse);

    le_0_2hz_compile=cat(3,le_0_2hz_compile,le_0_2hz); 
    le_0_7hz_compile=cat(3,le_0_7hz_compile,le_0_7hz); 
    le_3hz_compile=cat(3,le_3hz_compile,le_3hz); 
    le_5hz_compile=cat(3,le_5hz_compile,le_5hz);
    le_11hz_compile=cat(3,le_11hz_compile,le_11hz); 
    le_17hz_compile=cat(3,le_17hz_compile,le_17hz); 
    le_43hz_compile=cat(3,le_43hz_compile,le_43hz); 
    le_67hz_compile=cat(3,le_67hz_compile,le_67hz);

    sd_37_0_2hz_compile=cat(3,sd_37_0_2hz_compile,sd_37_0_2hz); 
    sd_37_0_7hz_compile=cat(3,sd_37_0_7hz_compile,sd_37_0_7hz); 
    sd_37_3hz_compile=cat(3,sd_37_3hz_compile,sd_37_3hz); 
    sd_37_5hz_compile=cat(3,sd_37_5hz_compile,sd_37_5hz);
    sd_37_11hz_compile=cat(3,sd_37_11hz_compile,sd_37_11hz); 
    sd_37_17hz_compile=cat(3,sd_37_17hz_compile,sd_37_17hz); 
    sd_37_43hz_compile=cat(3,sd_37_43hz_compile,sd_37_43hz); 
    sd_37_67hz_compile=cat(3,sd_37_67hz_compile,sd_37_67hz);

    sd_90_0_2hz_compile=cat(3,sd_90_0_2hz_compile,sd_90_0_2hz); 
    sd_90_0_7hz_compile=cat(3,sd_90_0_7hz_compile,sd_90_0_7hz); 
    sd_90_3hz_compile=cat(3,sd_90_3hz_compile,sd_90_3hz); 
    sd_90_5hz_compile=cat(3,sd_90_5hz_compile,sd_90_5hz);
    sd_90_11hz_compile=cat(3,sd_90_11hz_compile,sd_90_11hz); 
    sd_90_17hz_compile=cat(3,sd_90_17hz_compile,sd_90_17hz); 
    sd_90_43hz_compile=cat(3,sd_90_43hz_compile,sd_90_43hz); 
    sd_90_67hz_compile=cat(3,sd_90_67hz_compile,sd_90_67hz);

    sd_95_0_2hz_compile=cat(3,sd_95_0_2hz_compile,sd_95_0_2hz); 
    sd_95_0_7hz_compile=cat(3,sd_95_0_7hz_compile,sd_95_0_7hz); 
    sd_95_3hz_compile=cat(3,sd_95_3hz_compile,sd_95_3hz); 
    sd_95_5hz_compile=cat(3,sd_95_5hz_compile,sd_95_5hz);
    sd_95_11hz_compile=cat(3,sd_95_11hz_compile,sd_95_11hz); 
    sd_95_17hz_compile=cat(3,sd_95_17hz_compile,sd_95_17hz); 
    sd_95_43hz_compile=cat(3,sd_95_43hz_compile,sd_95_43hz); 
    sd_95_67hz_compile=cat(3,sd_95_67hz_compile,sd_95_67hz);
end
save('Results_compile_Deep.mat',...
    'rmse_compile','mse_compile','cdfabs_compile',...
    "sd_95_67hz_compile","sd_95_43hz_compile","sd_95_17hz_compile","sd_95_11hz_compile",...
    "sd_95_5hz_compile","sd_95_3hz_compile","sd_95_0_7hz_compile","sd_95_0_2hz_compile",...
    "sd_90_67hz_compile","sd_90_43hz_compile","sd_90_17hz_compile","sd_90_11hz_compile",...
    "sd_90_5hz_compile","sd_90_3hz_compile","sd_90_0_7hz_compile","sd_90_0_2hz_compile",...
    "sd_37_67hz_compile","sd_37_43hz_compile","sd_37_17hz_compile","sd_37_11hz_compile",...
    "sd_37_5hz_compile","sd_37_3hz_compile","sd_37_0_7hz_compile","sd_37_0_2hz_compile",...
    "le_67hz_compile","le_43hz_compile","le_17hz_compile","le_11hz_compile",...
    "le_5hz_compile","le_3hz_compile","le_0_7hz_compile","le_0_2hz_compile");
toc;