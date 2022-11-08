function [ress] = multisvm(TrainingSet,GroupTrain,TestSet)

u = unique(GroupTrain);
numClasses = length(u);
ress = zeros(length(TestSet(:,1)),1);

% build models
for k = 1 : numClasses
    % Vectorized statement that binarizes Group
    % where 1 is the current class and 0 is all other classes
    G1vAll = (GroupTrain==u(k));
    models{k} = fitcsvm(TrainingSet,G1vAll);
end

% classify test cases
for j = 1 : size(TestSet,1)
    for k = 1 : numClasses
        if(predict(models{k},TestSet(j,:)))
            break;
        end
    end
    ress(j) = k;
end