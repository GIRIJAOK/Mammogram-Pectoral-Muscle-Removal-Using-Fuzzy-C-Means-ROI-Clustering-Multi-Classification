val1 = [0.99875	0.825	0.990535502	0.8875	0.817191789
0.9125	0.590628792	0.975694631	0.642708333	0.576273341
0.88125	0.483940621	0.970376593	0.457142857	0.469604651
0.625	0.164710845	0.834030443	0.259259259	0.137373859
0.610687023	0.165686275	0.834267145	0.286492375	0.138226615];

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
figure;plot(v4,'-r*','LineWidth',2)
str = {'88.7500','64.2708','45.7143','25.9259','28.6492'};
t = text(x+.1,v4+1.8,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('Kappa (%)')


v5 = val1(:,5);
x = 1:5;
figure;plot(v5,'-r*','LineWidth',2)
str = {'81.7192','57.6273','46.9605','13.7374','13.8227'};
t = text(x+.1,v5+1.8,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('AUC (%)')

val2 = [0.25682608	0.425	2.974894956
0.229424909	0.96875	4.352441843
0.207905625	2.5125	18.23081183
0.246083912	2.55625	6.608233501
0.238269046	2.74375	6.228462892];
v1 = val2(:,1);
x = 1:5;
figure;plot(v1,'-r*','LineWidth',2)
str = {'0.2568','0.2294','0.2079','0.2461','0.2383'};
t = text(x+.1,v1+0.0,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('STD')


v2 = val2(:,2);
x = 1:5;
figure;plot(v2,'-r*','LineWidth',2)
str = {'0.4250','0.9688','2.5125','2.5562','2.7437'};
t = text(x+.1,v2+0.018,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('MAE')
ylim([0 3])


v3 = val2(:,3);
x = 1:5;
figure;plot(v3,'-r*','LineWidth',2)
str = {'2.9749','4.3524','18.2308','6.6082','6.2285'};
t = text(x+.1,v3+0.09,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('RMSE')

val3 = [0.004752537	0.001922153
0.009657022	0.016805991
0.010531057	0.02341701
0.034934119	0.197145062
0.037060587	0.210476304];
val3 = val3*100;

v6 = val3(:,1);
x = 1:5;
figure;plot(v6,'-r*','LineWidth',2)
str = {'0.4753','0.9657','1.0531','3.4934','3.7061'};
t = text(x+.1,v6+0.018,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('FAR (%)')


v7 = val3(:,2);
x = 1:5;
figure;plot(v7,'-r*','LineWidth',2)
str = {'0.1922','1.6806','2.3417','19.7145','21.0476'};
t = text(x+.1,v7+0.09,str,'Color','blue','FontSize',12);
xlim ([0 6]);
set(gca,'XTickLabel', {' ' ,'PROPOSED ','ECNN' , 'CNN', 'KNN','MSVM',' '})
grid minor
ylabel('FRR (%)')
ylim([-1 24])