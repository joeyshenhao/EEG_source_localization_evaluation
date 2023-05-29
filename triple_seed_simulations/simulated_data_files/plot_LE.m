t = tiledlayout(2,4,'TileSpacing','Compact');
legend_FontSize = 10;
label_FontSize = 11;
label_FontSize_y = 14;
title_FontSize = 11;
load('Results_compile_Deep.mat');
%% Tile 1
nexttile;
hold on;
axis on;
SNR = [0 3 6 9 12];
data_mean = reshape(mean(le_0_2hz_compile,1),3,5).';
data_std = reshape(std(le_0_2hz_compile,0,1),3,5).'/sqrt(30);
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

% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,100]);
daspect([1 100/15 1]);
hold off;
% xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
title({'0.2Hz'},'FontSize',title_FontSize);
ylabel({'LE (mm)'},'FontSize',label_FontSize_y);
set(gca,'Layer','top');

legend([GO(1),GO(2),GO(3)],'eLORETA','Thin Dugh','Mackay','Orientation','horizontal','FontSize',legend_FontSize);
%% Tile 2
nexttile;
hold on;
axis on;
SNR = [0 3 6 9 12];
data_mean = reshape(mean(le_0_7hz_compile,1),3,5).';
data_std = reshape(std(le_0_7hz_compile,0,1),3,5).'/sqrt(30);
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

% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
% set(gca,'YTick',0:10:50);
xlim([-1.5,13.5]);
ylim([0,100]);
daspect([1 100/15 1]);
hold off;
title({'0.7Hz'},'FontSize',title_FontSize);
set(gca,'Layer','top');

%% Tile 3
nexttile;
hold on;
axis on;
SNR = [0 3 6 9 12];
data_mean = reshape(mean(le_3hz_compile,1),3,5).';
data_std = reshape(std(le_3hz_compile,0,1),3,5).'/sqrt(30);
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

% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,50]);
daspect([1 50/15 1]);
hold off;
title({'3Hz'},'FontSize',title_FontSize);
set(gca,'Layer','top');

%% Tile 4
nexttile;
hold on;
axis on;
SNR = [0 3 6 9 12];
data_mean = reshape(mean(le_5hz_compile,1),3,5).';
data_std = reshape(std(le_5hz_compile,0,1),3,5).'/sqrt(30);
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

% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,20]);
daspect([1 20/15 1]);
hold off;
title({'5Hz'},'FontSize',title_FontSize);
set(gca,'Layer','top');

%% Tile 5
nexttile;
hold on;
axis on;
SNR = [0 3 6 9 12];
data_mean = reshape(mean(le_11hz_compile,1),3,5).';
data_std = reshape(std(le_11hz_compile,0,1),3,5).'/sqrt(30);
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

% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,80]);
daspect([1 80/15 1]);
hold off;
title({'11Hz'},'FontSize',title_FontSize);
ylabel({'LE (mm)'},'FontSize',label_FontSize_y);
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
set(gca,'Layer','top');
%% Tile 6
nexttile;
hold on;
axis on;
SNR = [0 3 6 9 12];
data_mean = reshape(mean(le_17hz_compile,1),3,5).';
data_std = reshape(std(le_17hz_compile,0,1),3,5).'/sqrt(30);
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

% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,60]);
daspect([1 60/15 1]);
hold off;
title({'17Hz'},'FontSize',title_FontSize);
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
set(gca,'Layer','top');
%% Tile 7
nexttile;
hold on;
axis on;
SNR = [0 3 6 9 12];
data_mean = reshape(mean(le_43hz_compile,1),3,5).';
data_std = reshape(std(le_43hz_compile,0,1),3,5).'/sqrt(30);
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

% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,30]);
daspect([1 30/15 1]);
hold off;
title({'43Hz'},'FontSize',title_FontSize);
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
set(gca,'Layer','top');
%% Tile 8
nexttile;
hold on;
axis on;
SNR = [0 3 6 9 12];
data_mean = reshape(mean(le_67hz_compile,1),3,5).';
data_std = reshape(std(le_67hz_compile,0,1),3,5).'/sqrt(30);
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

% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');

set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0,20]);
daspect([1 20/15 1]);
hold off;
title({'67Hz'},'FontSize',title_FontSize);
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
set(gca,'Layer','top');