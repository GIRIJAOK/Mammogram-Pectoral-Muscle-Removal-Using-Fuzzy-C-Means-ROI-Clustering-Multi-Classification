val1 = [0.95	0.903051318	0.962811666	0.8875	0.869468343
0.875	0.775106838	0.91195677	0.71875	0.706863928
0.55	0.314182213	0.674655047	0.012345679	0.211964616
0.506329114	0.360928705	0.695621705	0.0997151	0.251069841
0.6625	0.333333333	0.666666667	0.240625	0.222222222];

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


val2 = [0.285203692	0.075	0.353553391
0.250338313	0.175	0.524404424
0.295958014	0.69375	1.086853256
0.253980752	0.65625	0.984250984
0.382494553	0.59375	1.051784198];

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