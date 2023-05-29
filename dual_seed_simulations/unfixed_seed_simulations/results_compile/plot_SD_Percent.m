t = tiledlayout(3,2,'TileSpacing','Compact');
% legend_FontSize = 8;
title_FontSize = 11;
label_FontSize = 11;
label_FontSize_y = 11;
load('Results_compile_new.mat');
%% Fig 6
nexttile;
hold on;
axis on;
SNR = [0 3 6 9 12];
data_mean = reshape(mean(sd_37_20hz_compile,1),5,5).';
data_std = reshape(std(sd_37_20hz_compile,0,1),5,5).'/sqrt(30);
GO = bar(SNR,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(data_mean);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = GO(i).XEndPoints;
end
GO(1).FaceColor = [240 230 228]/255;
GO(2).FaceColor = [206 181 185]/255;
GO(3).FaceColor = [174 191 206]/255;
GO(4).FaceColor = [152 161 177]/255;
GO(5).FaceColor = [179 106 111]/255;
% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,100]);
daspect([1 100/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
ylabel({'> 37% max energy','SD (mm)'},'FontSize',label_FontSize_y);
title({'20Hz'},'FontSize',title_FontSize);
set(gca,'Layer','top');
legend([GO(1),GO(2),GO(3),GO(4),GO(5)],'Full Dugh','BST-MN','eLORETA','Thin Dugh','Mackay','Orientation','horizontal');

%% Tile 2
nexttile;
hold on;
axis on;
data_mean = reshape(mean(sd_37_45hz_compile,1),5,5).';
data_std = reshape(std(sd_37_45hz_compile,0,1),5,5).'/sqrt(30);
GO = bar(SNR,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(data_mean);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = GO(i).XEndPoints;
end
GO(1).FaceColor = [240 230 228]/255;
GO(2).FaceColor = [206 181 185]/255;
GO(3).FaceColor = [174 191 206]/255;
GO(4).FaceColor = [152 161 177]/255;
GO(5).FaceColor = [179 106 111]/255;
% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,120]);
daspect([1 120/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
ylabel({'SD (mm)'},'FontSize',label_FontSize_y);
title({'45Hz'},'FontSize',title_FontSize);
set(gca,'Layer','top');

%% Tile 3
nexttile;
hold on;
axis on;
data_mean = reshape(mean(sd_90_20hz_compile,1),5,5).';
data_std = reshape(std(sd_90_20hz_compile,0,1),5,5).'/sqrt(30);
GO = bar(SNR,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(data_mean);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = GO(i).XEndPoints;
end
GO(1).FaceColor = [240 230 228]/255;
GO(2).FaceColor = [206 181 185]/255;
GO(3).FaceColor = [174 191 206]/255;
GO(4).FaceColor = [152 161 177]/255;
GO(5).FaceColor = [179 106 111]/255;
% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,100]);
daspect([1 100/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
ylabel({'> 90% max energy','SD (mm)'},'FontSize',label_FontSize_y);
title({'20Hz'},'FontSize',title_FontSize);
set(gca,'Layer','top');

%% Tile 4
nexttile;
hold on;
axis on;
data_mean = reshape(mean(sd_90_45hz_compile,1),5,5).';
data_std = reshape(std(sd_90_45hz_compile,0,1),5,5).'/sqrt(30);
GO = bar(SNR,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(data_mean);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = GO(i).XEndPoints;
end
GO(1).FaceColor = [240 230 228]/255;
GO(2).FaceColor = [206 181 185]/255;
GO(3).FaceColor = [174 191 206]/255;
GO(4).FaceColor = [152 161 177]/255;
GO(5).FaceColor = [179 106 111]/255;
% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,120]);
daspect([1 120/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
ylabel({'SD (mm)'},'FontSize',label_FontSize_y);
title({'45Hz'},'FontSize',title_FontSize);
set(gca,'Layer','top');

%% Tile 5
nexttile;
hold on;
axis on;
data_mean = reshape(mean(sd_95_20hz_compile,1),5,5).';
data_std = reshape(std(sd_95_20hz_compile,0,1),5,5).'/sqrt(30);
GO = bar(SNR,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(data_mean);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = GO(i).XEndPoints;
end
GO(1).FaceColor = [240 230 228]/255;
GO(2).FaceColor = [206 181 185]/255;
GO(3).FaceColor = [174 191 206]/255;
GO(4).FaceColor = [152 161 177]/255;
GO(5).FaceColor = [179 106 111]/255;
% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,100]);
daspect([1 100/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
ylabel({'> 95% max energy','SD (mm)'},'FontSize',label_FontSize_y);
title({'20Hz'},'FontSize',title_FontSize);
set(gca,'Layer','top');

%% Tile 6
nexttile;
hold on;
axis on;
data_mean = reshape(mean(sd_95_45hz_compile,1),5,5).';
data_std = reshape(std(sd_95_45hz_compile,0,1),5,5).'/sqrt(30);
GO = bar(SNR,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(data_mean);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = GO(i).XEndPoints;
end
GO(1).FaceColor = [240 230 228]/255;
GO(2).FaceColor = [206 181 185]/255;
GO(3).FaceColor = [174 191 206]/255;
GO(4).FaceColor = [152 161 177]/255;
GO(5).FaceColor = [179 106 111]/255;
% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,120]);
daspect([1 120/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
ylabel({'SD (mm)'},'FontSize',label_FontSize_y);
title({'45Hz'},'FontSize',title_FontSize);
set(gca,'Layer','top');