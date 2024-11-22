function [Result] =  confusion(actual,predict)

actual = actual(:);
predict = predict(:);
un_actual = unique(actual);
n_class = length(un_actual);
class_list = un_actual;
c_matrix = zeros(n_class);

% Calculate confusion for all classes
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

% Output Struct for over all class lists
Result.Accuracy = sum(accuracy);
Result.Sensitivity = mean(Sensitivity);
Result.Specificity = mean(Specificity);
end