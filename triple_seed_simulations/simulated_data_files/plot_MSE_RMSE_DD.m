t = tiledlayout(2,3,'TileSpacing','Compact');
legend_FontSize = 11;
label_FontSize = 11;
label_FontSize_y = 14;
SNR = [0 3 6 9 12];
%% Tile 1
load('Results_compile_Deep.mat');
nexttile;
hold on;
axis on;
data_mean = reshape(mean(rmse_compile,1),3,5).';
data_std = reshape(std(rmse_compile,0,1),3,5).'/sqrt(30);
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
ylim([1.7,2]);
set(gca,'YTick',[1.6:0.1:2.1]);
daspect([1 0.3/15 1]);
hold off;
ylabel({'RMSE'},'FontSize',label_FontSize_y);
set(gca,'Layer','top');
title({'Deep'},'FontSize',label_FontSize);

%% Tile 2
load('Results_compile_Middle.mat');
nexttile;
hold on;
axis on;
data_mean = reshape(mean(rmse_compile,1),3,5).';
data_std = reshape(std(rmse_compile,0,1),3,5).'/sqrt(30);
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
ylim([1.6,2]);
set(gca,'YTick',[1.6:0.1:2.1]);
daspect([1 0.4/15 1]);
hold off;
set(gca,'Layer','top');
title({'Middle'},'FontSize',label_FontSize);

%% Tile 3
load('Results_compile_Superficial.mat');
nexttile;
hold on;
axis on;
data_mean = reshape(mean(rmse_compile,1),3,5).';
data_std = reshape(std(rmse_compile,0,1),3,5).'/sqrt(30);
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
ylim([1.4,1.9]);
set(gca,'YTick',[1.4:0.1:1.9]);
daspect([1 0.5/15 1]);
hold off;

set(gca,'Layer','top');
title({'Superficial'},'FontSize',label_FontSize);
%% Tile 4
load('Results_compile_Deep.mat');
nexttile;
hold on;
axis on;
data_mean = reshape(mean(cdfabs_compile,1),3,5).';
data_std = reshape(std(cdfabs_compile,0,1),3,5).'/sqrt(30);
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
set(gca,'YScale','log','YTick',[1e-4,1e-3,1e-2,1e-1,1]);
xlim([-1.5,13.5]);
ylim([1e-5,1]);
daspect([1 1/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
ylabel({'DD'},'FontSize',label_FontSize_y);
set(gca,'Layer','top');

legend([GO(1),GO(2),GO(3)],'eLORETA','Thin Dugh','Mackay','Orientation','horizontal','FontSize',legend_FontSize);

%% Tile 5
load('Results_compile_Middle.mat');
nexttile;
hold on;
axis on;
data_mean = reshape(mean(cdfabs_compile,1),3,5).';
data_std = reshape(std(cdfabs_compile,0,1),3,5).'/sqrt(30);
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
set(gca,'YScale','log','YTick',[1e-4,1e-3,1e-2,1e-1,1]);
xlim([-1.5,13.5]);
ylim([1e-5,1]);
daspect([1 1/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
set(gca,'Layer','top');

%% Tile 6
load('Results_compile_Superficial.mat');
nexttile;
hold on;
axis on;
data_mean = reshape(mean(cdfabs_compile,1),3,5).';
data_std = reshape(std(cdfabs_compile,0,1),3,5).'/sqrt(30);
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
set(gca,'YScale','log','YTick',[1e-4,1e-3,1e-2,1e-1,1]);
xlim([-1.5,13.5]);
ylim([1e-5,1]);
daspect([1 1/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
set(gca,'Layer','top');