t = tiledlayout(1,3,'TileSpacing','Compact');
legend_FontSize = 11;
label_FontSize = 11;
label_FontSize_y = 14;
load('Results_compile_new.mat');
%% Tile 1
nexttile;
hold on;
axis on;
SNR = [0 3 6 9 12];
data_mean = reshape(mean(mse_compile,1),5,5).';
data_std = reshape(std(mse_compile,0,1),5,5).'/sqrt(30);
GO = bar(SNR,data_mean,1,'EdgeColor','none');
set(gca,'YScale','log','YTick',[1,10,1e2,1e3,1e4,1e5]);
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(data_mean);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = GO(i).XEndPoints;
end
% Plot the errorbars
errorbar(x',data_mean,data_std,'k','linestyle','none');
GO(1).FaceColor = [240 230 228]/255;
GO(2).FaceColor = [206 181 185]/255;
GO(3).FaceColor = [174 191 206]/255;
GO(4).FaceColor = [152 161 177]/255;
GO(5).FaceColor = [179 106 111]/255;
% plot([-3:0.1:14],0.5*ones(1,size([-3:0.1:14],2)),'--');
set(gca,'XTick',0:3:12);
set(gca,'XTickLabel',{0,3,6,9,12});
xlim([-1.5,13.5]);
ylim([0.5,5e4]);
% set(gca,'YTick',[0.4:0.2:1]);
daspect([1 5e4/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
ylabel({'MSE'},'FontSize',label_FontSize_y);
set(gca,'Layer','top');
%% Tile 2
nexttile;
hold on;
axis on;
data_mean = reshape(mean(rmse_compile,1),5,5).';
data_std = reshape(std(rmse_compile,0,1),5,5).'/sqrt(30);
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
ylim([1.6,2.1]);
set(gca,'YTick',[1.6:0.1:2.1]);
daspect([1 0.5/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
ylabel({'RMSE'},'FontSize',label_FontSize);
set(gca,'Layer','top');

%% Tile 3
nexttile;
hold on;
axis on;
data_mean = reshape(mean(cdfabs_compile,1),5,5).';
data_std = reshape(std(cdfabs_compile,0,1),5,5).'/sqrt(30);
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
set(gca,'YScale','log','YTick',[1e-4,1e-3,1e-2,1e-1,1]);
xlim([-1.5,13.5]);
ylim([1e-4,1]);
daspect([1 1/15 1]);
hold off;
xlabel({'SNR_s_i_m_u (dB)'},'FontSize',label_FontSize);
ylabel({'DD'},'FontSize',label_FontSize);
set(gca,'Layer','top');
legend([GO(1),GO(2),GO(3),GO(4),GO(5)],'Full Dugh','BST-MN','eLORETA','Thin Dugh','Mackay','Orientation','horizontal','FontSize',legend_FontSize);