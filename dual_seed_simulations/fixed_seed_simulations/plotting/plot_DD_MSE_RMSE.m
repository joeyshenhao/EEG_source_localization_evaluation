t = tiledlayout(1,3,'TileSpacing','Compact');

legend_FontSize = 11;
label_fontsize = 14;
load('SNR_Results_new.mat');
%% Tile 1 - DD
nexttile;
hold on;
X = 1:2;
data_mean = [mean(cdfabs,1);ones(1,5)];
data_std = [sem(cdfabs);ones(1,5)];
GO = bar(X,data_mean,1,'EdgeColor','none');
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
set(gca,'YScale','log');
set(gca,'XTick',[]);
set(gca,'YTick',[1e-5,1e-4,1e-3,1e-2,1e-1]);
xlim([0.5 1.5]);
ylim([1e-5,1e-1]);
daspect([1 1e-1 1]);
hold off;
ylabel({'DD'},'FontSize',label_fontsize);
set(gca,'Layer','top');
%% Tile 2 - MSE
nexttile;
hold on;
X = 1:2;
data_mean = [mean(mse,1);ones(1,5)];
data_std = [sem(mse);ones(1,5)];
GO = bar(X,data_mean,1,'EdgeColor','none');
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
set(gca,'XTick',[]);
xlim([0.5 1.5]);
ylim([0,15]);
daspect([1 15 1]);
hold off;  
ylabel({'MSE'},'FontSize',label_fontsize);  
set(gca,'Layer','top');
%% Tile 3 - RMSE
nexttile;
hold on;
X = 1:2;
data_mean = [mean(rmse,1);ones(1,5)];
data_std = [sem(rmse);ones(1,5)];
GO = bar(X,data_mean,1,'EdgeColor','none');
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
set(gca,'XTick',[]);
xlim([0.5 1.5]);
ylim([1.5,2]);
daspect([1 0.5 1]);
hold off;
ylabel({'RMSE'},'FontSize',label_fontsize);
set(gca,'Layer','top');
legend([GO(1),GO(2),GO(3),GO(4),GO(5)],'Full Dugh','BST-MN','eLORETA','Thin Dugh','Mackay','Orientation','horizontal','FontSize',legend_FontSize);
