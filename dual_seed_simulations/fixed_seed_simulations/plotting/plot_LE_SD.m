t = tiledlayout(3,1,'TileSpacing','Compact');
legend_FontSize = 9;
label_size = 10;
Title_FontSize = 10;
load('SNR_Results_new.mat');
%% Tile 5
nexttile;
hold on;
X = categorical({'20Hz','45Hz'});
X = reordercats(X,{'20Hz','45Hz'});
data_mean = [mean(le_20hz,1);mean(le_45hz,1)];
data_std = [sem(le_20hz);sem(le_45hz)];
GO = bar(X,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
nbars=5;ngroups=2;
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

hold off;

ylabel({'LE (mm)'},'FontSize',label_size);
set(gca,'Layer','top');

%% Tile 1
nexttile;
hold on;
X = categorical({'r=3mm','r=6mm','>37% max','>90% max','>95% max'});
X = reordercats(X,{'r=3mm','r=6mm','>37% max','>90% max','>95% max'});
data_mean = [mean(sd1_20hz,1);mean(sd2_20hz,1);mean(sd_37_20hz,1);mean(sd_90_20hz,1);mean(sd_95_20hz,1)];
data_std = [sem(sd1_20hz);sem(sd2_20hz);sem(sd_37_20hz);sem(sd_90_20hz);sem(sd_95_20hz)];
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

hold off;
title({'20Hz'},'FontSize',Title_FontSize);
ylabel({'SD (mm)'},'FontSize',label_size);
set(gca,'Layer','top');
%% Tile 2
nexttile;
hold on;
X = categorical({'r=3mm','r=6mm','>37% max','>90% max','>95% max'});
X = reordercats(X,{'r=3mm','r=6mm','>37% max','>90% max','>95% max'});
data_mean = [mean(sd1_45hz,1);mean(sd2_45hz,1);mean(sd_37_45hz,1);mean(sd_90_45hz,1);mean(sd_95_45hz,1)];
data_std = [sem(sd1_45hz);sem(sd2_45hz);sem(sd_37_45hz);sem(sd_90_45hz);sem(sd_95_45hz)];
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

ylim([0,25]);

hold off;
title({'45Hz'},'FontSize',Title_FontSize);
ylabel({'SD (mm)'},'FontSize',label_size);
set(gca,'Layer','top');
legend([GO(1),GO(2),GO(3),GO(4),GO(5)],'Full Dugh','BST-MN','eLORETA','Thin Dugh','Mackay','Orientation','horizontal','FontSize',legend_FontSize);
