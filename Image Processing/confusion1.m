function [Result] =  confusion1(actual,predict)

actual = actual(:);
predict = predict(:);
un_actual = unique(actual);
n_class = length(un_actual);
class_list = un_actual;
c_matrix = zeros(n_class);

% Calculate conufsion for all classes
for i = 1:n_class
    for j = 1:n_class
        val = (actual == class_list(i)) & (predict == class_list(j));
        c_matrix(i,j) = sum(val);
    end
end
[Result] = getValues(c_matrix);
end

function  [Result]  =  getValues(c_matrix)

[row,~] = size(c_matrix);

n_class = row;
TP = zeros(1,n_class);
FN = zeros(1,n_class);
FP = zeros(1,n_class);
TN = zeros(1,n_class);
for i = 1:n_class
    TP(i) = c_matrix(i,i);
    FN(i) = sum(c_matrix(i,:))-c_matrix(i,i);
    FP(i) = sum(c_matrix(:,i))-c_matrix(i,i);
    TN(i) = sum(c_matrix(:))-TP(i)-FP(i)-FN(i);
end

P = TP+FN;
N = FP+TN;
accuracy = (TP)./(P+N);
Sensitivity = TP./P;
Specificity = TN./N;

% Kappa Calculation
pox = sum(accuracy);
Px = sum(P);TPx = sum(TP);FPx = sum(FP);TNx = sum(TN);FNx = sum(FN);Nx = sum(N);
pex = ( (Px.*(TPx+FPx))+(Nx.*(FNx+TNx)) ) ./ ( (TPx+TNx+FPx+FNx).^2 );
kappa_overall = ([( pox-pex ) ./ ( 1-pex );( pex-pox ) ./ ( 1-pox )]);
kappa_overall = max(kappa_overall);

AUC = mean(Specificity)*mean(Sensitivity);

STD = std((accuracy));

% Output Struct for over all class lists
Result.Accuracy = sum(accuracy);
Result.Sensitivity = mean(Sensitivity);
Result.Specificity = mean(Specificity);
Result.Kappa = kappa_overall;
Result.AUC = AUC;
Result.STD = STD;
end