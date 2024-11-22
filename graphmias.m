val1 = [0.99125	0.808150183	0.99681991	0.9234375	0.805580193
0.91875	0.66482086	0.977859743	0.668229167	0.650101556
0.8875	0.622422302	0.967117293	0.540625	0.601955372
0.51875	0.145506597	0.814576096	0.422799423	0.118526196
0.508064516	0.17032967	0.831668838	0.435336976	0.141657879];

val1 = val1*100;
figure;
plot(val1(1,1:3) , '-b*' , 'LineWidth',2);hold on
plot(val1(2,1:3) , '-r*' , 'LineWidth',2);hold on
plot(val1(3,1:3) , '-g*' , 'LineWidth',2);hold on
plot(val1(4,1:3) , '-k*' , 'LineWidth',2);hold on
plot(val1(5,1:3) , '-m*' , 'LineWidth',2);hold on
xlim([0.5 3.5])
set(gca,'XTickLabel', {' ' , 'ACCURACY' , ' ' , 'SENSITIVITY' , ' ' , 'SPECIFICITY' , ' '})
legend('PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM','Location','southwest')
ylabel('Percentage (%) ')
ylim([0 115])
grid on


v4 = val1(:,4);
x = 1:5;
figure;plot(v4,'-m*','LineWidth',2)
str = {'92.3438','66.8229','54.0625','42.2799','43.5337'};
t = text(x+.1,v4+1.8,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('Kappa (%)')


v5 = val1(:,5);
x = 1:5;
figure;plot(v5,'-m*','LineWidth',2)
str = {'80.5580','65.0102','60.1955','11.8526','14.1658'};
t = text(x+.1,v5+1.8,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('AUC (%)')

val2 = [0.231583575	0.03125	0.237170825
0.216084956	0.6	3.310966626
0.200120871	1.14375	4.725595201
0.20873191	5.29375	10.26614582
0.177694069	4.20625	8.452440476];
v1 = val2(:,1);
x = 1:5;
figure;plot(v1,'-m*','LineWidth',2)
str = {'0.2316','0.2161','0.2001','0.2087','0.1777'};
t = text(x+.1,v1+0.0,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('STD')


v2 = val2(:,2);
x = 1:5;
figure;plot(v2,'-m*','LineWidth',2)
str = {'0.0313','0.6000','1.1438','5.2938','4.2062'};
t = text(x+.1,v2+0.018,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('MAE')


v3 = val2(:,3);
x = 1:5;
figure;plot(v3,'-m*','LineWidth',2)
str = {'0.2372','3.3110','4.7256','10.2661','8.4524'};
t = text(x+.1,v3+0.09,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('RMSE')


val3 = [0.00290058	0.009021049
0.009145198	0.019902366
0.011009854	0.032590587
0.055199804	0.289875756
0.061383733	0.347001764];
val3 = val3*100;

v6 = val3(:,1);
x = 1:5;
figure;plot(v6,'-m*','LineWidth',2)
str = {'0.2901','0.9145','1.1010','5.5200','6.1384'};
t = text(x+.1,v6+0.018,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('FAR (%)')


v7 = val3(:,2);
x = 1:5;
figure;plot(v7,'-m*','LineWidth',2)
str = {'0.9021','1.9902','3.2591','28.9876','34.7002'};
t = text(x+.1,v7+0.09,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('FRR (%)')
ylim([-1 36])