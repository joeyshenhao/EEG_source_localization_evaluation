t = tiledlayout(2,3,'TileSpacing','Compact');
legend_FontSize = 9;
title_FontSize = 11;
% label_FontSize = 11;
label_FontSize_y = 11;
load("Lobes_results_new.mat");
%% Fig 8
nexttile;
hold on;
axis on;
X = categorical({'Frontal','Occipital','Parietal','Temporal'});
X = reordercats(X,{'Frontal','Occipital','Parietal','Temporal'});
data_mean = le_mean;
data_std = le_std;
GO = bar(X,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
ngroups=4;nbars=5;
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
ylim([0,120]);
daspect([1 120/5 1]);
ylabel({'LE (mm)'},'FontSize',label_FontSize_y);
set(gca,'Layer','top');
%% Tile 2
nexttile;
hold on;
axis on;
data_mean = sd1_mean;
data_std = sd1_std;
GO = bar(X,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
ngroups=4;nbars=5;
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
ylim([0,120]);
daspect([1 120/5 1]);
ylabel({'SD (mm)'},'FontSize',label_FontSize_y);
title({'r = 3 mm'},'FontSize',title_FontSize);
set(gca,'Layer','top');
%% Tile 3
nexttile;
hold on;
axis on;
data_mean = sd2_mean;
data_std = sd2_std;
GO = bar(X,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
ngroups=4;nbars=5;
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
ylim([0,120]);
daspect([1 120/5 1]);
ylabel({'SD (mm)'},'FontSize',label_FontSize_y);
title({'r = 6 mm'},'FontSize',title_FontSize);
set(gca,'Layer','top');
%% Tile 4
nexttile;
hold on;
axis on;
data_mean = sd_37_mean;
data_std = sd_37_std;
GO = bar(X,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
ngroups=4;nbars=5;
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
ylim([0,120]);
daspect([1 120/5 1]);
ylabel({'SD (mm)'},'FontSize',label_FontSize_y);
title({'> 37% max energy'},'FontSize',title_FontSize);
set(gca,'Layer','top');
%% Tile 5
nexttile;
hold on;
axis on;
data_mean = sd_90_mean;
data_std = sd_90_std;
GO = bar(X,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
ngroups=4;nbars=5;
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
ylim([0,120]);
daspect([1 120/5 1]);
ylabel({'SD (mm)'},'FontSize',label_FontSize_y);
title({'> 90% max energy'},'FontSize',title_FontSize);
set(gca,'Layer','top');

%% Tile 6
nexttile;
hold on;
axis on;
data_mean = sd_95_mean;
data_std = sd_95_std;
GO = bar(X,data_mean,1,'EdgeColor','none');
% Calculate the number of groups and number of bars in each group
ngroups=4;nbars=5;
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
ylim([0,120]);
daspect([1 120/5 1]);
ylabel({'SD (mm)'},'FontSize',label_FontSize_y);
title({'> 95% max energy'},'FontSize',title_FontSize);
set(gca,'Layer','top');
legend([GO(1),GO(2),GO(3),GO(4),GO(5)],'Full Dugh','BST-MN','eLORETA','Thin Dugh','Mackay','Orientation','horizontal','FontSize',legend_FontSize);