val1 = [0.976666667	0.93452381	0.992621932	0.88	0.92762883
0.85	0.698639456	0.970677479	0.3875	0.678153585
0.783333333	0.625283447	0.958373415	0.115277778	0.599255032
0.55	0.479166667	0.904531395	0.382716049	0.433421293
0.466666667	0.355235043	0.884469667	0.479166667	0.31419462];

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
figure;plot(v4,'-g*','LineWidth',2)
str = {'88.0000','38.7500','11.5278','38.2716','47.9167'};
t = text(x+.1,v4+1.8,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('Kappa (%)')


v5 = val1(:,5);
x = 1:5;
figure;plot(v5,'-g*','LineWidth',2)
str = {'92.7629','67.8154','59.9255','43.3421','31.4195'};
t = text(x+.1,v5+1.8,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('AUC (%)')

val2 = [0.1306678	0.35	2.585214369
0.109169544	2.05	6.240993511
0.103509834	1.916666667	5.823801737
0.103682207	7.75	12.17168846
0.102016702	9.483333333	13.57632744];
v1 = val2(:,1);
x = 1:5;
figure;plot(v1,'-g*','LineWidth',2)
str = {'0.1307','0.1092','0.1035','0.1037','0.1020'};
t = text(x+.1,v1+0.0,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('STD')


v2 = val2(:,2);
x = 1:5;
figure;plot(v2,'-g*','LineWidth',2)
str = {'0.3500','2.0500','1.9167','7.7500','9.4833'};
t = text(x+.1,v2+0.018,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('MAE')


v3 = val2(:,3);
x = 1:5;
figure;plot(v3,'-g*','LineWidth',2)
str = {'2.5852','6.2410','5.8238','12.1717','13.5763'};
t = text(x+.1,v3+0.09,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('RMSE')

val3 = [0.006214024	0.012387387
0.021306062	0.102067183
0.031493126	0.161879896
0.08381201	0.434782609
0.097911227	0.475];
val3 = val3*100;

v6 = val3(:,1);
x = 1:5;
figure;plot(v6,'-g*','LineWidth',2)
str = {'0.6214','2.1306','3.1493','8.3812','9.7911'};
t = text(x+.1,v6+0.018,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('FAR (%)')


v7 = val3(:,2);
x = 1:5;
figure;plot(v7,'-g*','LineWidth',2)
str = {'1.2387','10.2067','16.1880','43.4783','47.5000'};
t = text(x+.1,v7+0.09,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('FRR (%)')
ylim([-1 50])