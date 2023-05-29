load('cdfs.mat');
label_fontsize = 14;
label_fontsize_y = 16;
legend_FontSize = 12;
Line_Width = 1.5;

hold on;
axis on;
plot(cdf_simu(:,1),cdf_simu(:,2),'LineWidth',Line_Width,'LineStyle','--','Color','k');
plot(cdf_fulldugh(:,1),cdf_fulldugh(:,2),'LineWidth',Line_Width);                                          
plot(cdf_thindugh(:,1),cdf_thindugh(:,2),'LineWidth',Line_Width);
plot(cdf_mackay(:,1),cdf_mackay(:,2),'LineWidth',Line_Width);
plot(cdf_bstmn(:,1),cdf_bstmn(:,2),'LineWidth',Line_Width);
plot(cdf_eloreta(:,1),cdf_eloreta(:,2),'LineWidth',Line_Width);

xlim([0,1]);
ylim([0,1]);
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1]);
daspect([1 1 1]);
hold off;
xlabel({'Normalized source energy'},'FontSize',label_fontsize);
ylabel({'cdf'},'FontSize',label_fontsize_y);
xlim([-0.05 1.05]);
ylim([0 1.05]);


axes('Position',[.35 .22 .4 .6/9*8]);
box on;
hold on;
h{1}=plot(cdf_simu(:,1),cdf_simu(:,2),'LineWidth',Line_Width,'LineStyle','--','Color','k');
h{2}=plot(cdf_fulldugh(:,1),cdf_fulldugh(:,2),'LineWidth',Line_Width);                                          
h{3}=plot(cdf_thindugh(:,1),cdf_thindugh(:,2),'LineWidth',Line_Width);
h{4}=plot(cdf_mackay(:,1),cdf_mackay(:,2),'LineWidth',Line_Width);
h{5}=plot(cdf_bstmn(:,1),cdf_bstmn(:,2),'LineWidth',Line_Width);
h{6}=plot(cdf_eloreta(:,1),cdf_eloreta(:,2),'LineWidth',Line_Width);
hold off
box off
hl = legend([h{1};h{2};h{3};h{4};h{5};h{6}],'Original','Full Dugh','Thin Dugh','Mackay','BST-MN','eLORETA','Orientation','vertical');
hl.FontSize = legend_FontSize;
set(gca,'Layer','top');