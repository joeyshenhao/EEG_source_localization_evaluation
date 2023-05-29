le_mean=[];le_std=[];
sd1_mean=[];sd1_std=[];
sd2_mean=[];sd2_std=[];
sd_37_mean=[];sd_37_std=[];
sd_90_mean=[];sd_90_std=[];
sd_95_mean=[];sd_95_std=[];

le_mean=[le_mean;mean(le_F,1)];le_std=[le_std;std(le_F,0,1)/sqrt(30)];
sd1_mean=[sd1_mean;mean(sd1_F,1)];sd1_std=[sd1_std;std(sd1_F,0,1)/sqrt(30)];
sd2_mean=[sd2_mean;mean(sd2_F,1)];sd2_std=[sd2_std;std(sd2_F,0,1)/sqrt(30)];
sd_37_mean=[sd_37_mean;mean(sd_37_F,1)];sd_37_std=[sd_37_std;std(sd_37_F,0,1)/sqrt(30)];
sd_90_mean=[sd_90_mean;mean(sd_90_F,1)];sd_90_std=[sd_90_std;std(sd_90_F,0,1)/sqrt(30)];
sd_95_mean=[sd_95_mean;mean(sd_95_F,1)];sd_95_std=[sd_95_std;std(sd_95_F,0,1)/sqrt(30)];
clearvars -except sd_95_std sd_95_mean sd_90_std sd_90_mean sd_37_std sd_37_mean sd2_std sd2_mean sd1_std sd1_mean le_std le_mean

% 'F/O/P/T'
