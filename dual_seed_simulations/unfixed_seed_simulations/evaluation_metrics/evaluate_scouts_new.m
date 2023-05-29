function evaluate_scouts_new(label)
% e.g. label = 'Frontal','Occipital','Parietal','Temporal'
% evaluate_scouts('Frontal');
tic;
files=dir([pwd,'/','SNR*.mat']);
load([pwd,'/','ssnr_Results_new.mat']);
load([pwd,'/','scout_000sci_',label,'.mat']);
le_scout = [];
sd1_scout = [];
sd2_scout = [];
sd_37_scout = [];
sd_90_scout = [];
sd_95_scout = [];

for jj=1:length(files)
    load(files(jj).name);
    if ~isempty(find(Scouts.Vertices==indx(1), 1))
        le_scout = [le_scout;le_20hz(jj,:)];
        sd1_scout= [sd1_scout;sd1_20hz(jj,:)];
        sd2_scout= [sd2_scout;sd2_20hz(jj,:)];
        sd_37_scout= [sd_37_scout;sd_37_20hz(jj,:)];
        sd_90_scout= [sd_90_scout;sd_90_20hz(jj,:)];
        sd_95_scout= [sd_95_scout;sd_95_20hz(jj,:)];
    end
    if ~isempty(find(Scouts.Vertices==indx(2), 1))
        le_scout = [le_scout;le_45hz(jj,:)];
        sd1_scout= [sd1_scout;sd1_45hz(jj,:)];
        sd2_scout= [sd2_scout;sd2_45hz(jj,:)];
        sd_37_scout= [sd_37_scout;sd_37_45hz(jj,:)];
        sd_90_scout= [sd_90_scout;sd_90_45hz(jj,:)];
        sd_95_scout= [sd_95_scout;sd_95_45hz(jj,:)];
    end
end
save(['rns_result_',label,'_new.mat'],'le_scout','sd1_scout','sd2_scout',...
    'sd_37_scout','sd_90_scout','sd_95_scout');

toc;
end