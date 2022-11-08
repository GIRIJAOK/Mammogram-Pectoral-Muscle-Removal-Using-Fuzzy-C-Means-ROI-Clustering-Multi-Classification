val1 = [0.975	0.969537609	0.983228441	0.94375	0.953276952
0.925	0.89157554	0.953385015	0.83125	0.85001476
0.46875	0.318230852	0.645269428	0.163398693	0.20534464
0.675	0.391414141	0.695906433	0.26875	0.272387619
0.64375	0.333333333	0.666666667	0.1984375	0.222222222];

val1 = val1*100;
figure;
plot(val1(1,1:3) , '-b*' , 'LineWidth',2);hold on
plot(val1(2,1:3) , '-r*' , 'LineWidth',2);hold on
plot(val1(3,1:3) , '-g*' , 'LineWidth',2);hold on
plot(val1(4,1:3) , '-k*' , 'LineWidth',2);hold on
plot(val1(5,1:3) , '-m*' , 'LineWidth',2);hold on
xlim([0.5 3.5])
set(gca,'XTickLabel', {' ' , 'ACCURACY' , ' ' , 'SENSITIVITY' , ' ' , 'SPECIFICITY' , ' '})
legend('PROPOSED ' , 'CNN', 'KNN','ANN','MSVM','Location','southwest')
ylabel('Percentage (%) ')
ylim([0 115])
grid on


figure;
h1 = bar(val1(:,4),0.4);
set(h1,'FaceColor','RED');
grid on;
set(gca,'XTickLabel',{'PROPOSED ' , 'CNN', 'KNN','ANN','MSVM'})
ylabel('Kappa statistics value (%)')


figure;
h1 = bar(val1(:,5),0.4);
set(h1,'FaceColor','RED');
grid on;
set(gca,'XTickLabel',{'PROPOSED ' , 'CNN', 'KNN','ANN','MSVM'})
ylabel('AUC (%)')


val2 = [0.266707354	0.0375	0.25
0.264599737	0.1	0.387298335
0.213874233	0.89375	1.272301065
0.362661602	0.5125	0.942072184
0.371669236	0.5625	0.987420883];

figure;
h1 = bar(val2(:,1),0.4);
set(h1,'FaceColor','RED');
grid on;
set(gca,'XTickLabel',{'PROPOSED ' , 'CNN', 'KNN','ANN','MSVM'})
ylabel('STD')

figure;
h1 = bar(val2(:,2),0.4);
set(h1,'FaceColor','RED');
grid on;
set(gca,'XTickLabel',{'PROPOSED ' , 'CNN', 'KNN','ANN','MSVM'})
ylabel('MAE')

figure;
h1 = bar(val2(:,3),0.4);
set(h1,'FaceColor','RED');
grid on;
set(gca,'XTickLabel',{'PROPOSED ' , 'CNN', 'KNN','ANN','MSVM'})
ylabel('RMSE')