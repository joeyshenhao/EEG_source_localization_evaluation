% For plotting original and estimated activities of 20Hz seed:
figure(1);
row_num = 1;

% % For plotting original and estimated activities of 45Hz seed:
% figure(2);
% row_num = 2;

load('temporal_comparison_for_plotting.mat');
step =50;
hold on;
axis on;
TT=200;
subplot(6,1,1);
h{1}=plot(1:TT,X_norm_simu(row_num,1:TT),'-',"Color",'black','LineWidth',1.5);
set(gca,'XTick',[0:step:TT]); xlim([0,TT]);
subplot(6,1,2);
h{2}=plot(1:TT,X_norm_est_fulldugh(row_num,1:TT),"Color",[0 0.4470 0.7410],'LineWidth',1.5);
set(gca,'XTick',[0:step:TT]); xlim([0,TT]);
subplot(6,1,3);
h{3}=plot(1:TT,X_norm_est_thindugh(row_num,1:TT),"Color",[0.8500 0.3250 0.0980],'LineWidth',1.5);
set(gca,'XTick',[0:step:TT]); xlim([0,TT]);
ax4=subplot(6,1,4);
h{4}=plot(1:TT,X_norm_est_mackay(row_num,1:TT),"Color",[0.9290 0.6940 0.1250],'LineWidth',1.5);
set(gca,'XTick',[0:step:TT]); xlim([0,TT]);
ax5=subplot(6,1,5);
h{5}=plot(1:TT,X_norm_est_bstmn(row_num,1:TT),"Color",[1 0 1],'LineWidth',1.5);
set(gca,'XTick',[0:step:TT]); xlim([0,TT]);
ax6=subplot(6,1,6);
h{6}=plot(1:TT,X_norm_est_eloreta(row_num,1:TT),"Color",[0 1 0],'LineWidth',1.5);
set(gca,'XTick',[0:step:TT]); xlim([0,TT]);

xlim([0,TT]);
hold off;
if row_num==2
    xlabel({'Reconstructed sources (45Hz), unit: A×m'},'FontSize',13);
    hl = legend([h{1};h{2};h{3};h{4};h{5};h{6}],'Simulation','Full Dugh','Thin Dugh','Mackay','BST-MN','eLORETA','Orientation','horizontal','NumColumns',3);
else
    xlabel({'Reconstructed sources (20Hz), unit: A×m'},'FontSize',13);
    hl = legend([h{1};h{2};h{3};h{4};h{5};h{6}],'Simulation','Full Dugh','Thin Dugh','Mackay','BST-MN','eLORETA','Orientation','horizontal','NumColumns',3);
end