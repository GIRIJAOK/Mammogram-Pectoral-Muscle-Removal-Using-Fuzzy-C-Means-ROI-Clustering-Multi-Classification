clc
clear
close all
warning off;

% list the content of input dataset
flist = dir('.\testingdataddsm\*.jpg');

% for length of the dataset
for i = 1:length(flist)
    % read input image
    inp_img = imresize(imread(['.\testingdataddsm\' flist(i).name]),[256 256]);
    inp_all{i,1} = inp_img;
    
    % apply wiener filtering
    h = fspecial('gaussian',[256,256],40);
    h = mat2gray(h);
    Wiener_img = imageRestoration(inp_img,h);
    
    % apply Histo-sigmoid based ROI clustering
    seg_img = segment_hsfc(Wiener_img,inp_img);
    
    % feature extraction
    feat = feat_extract(seg_img);
    feat_test(i,:) = feat';
    
    % set target value
    if flist(i).name(1)=='A' % normal
        tr = 1;
    elseif flist(i).name(1)=='C' % malignant
        tr = 2;
    elseif flist(i).name(1)=='B' % beningn
        tr = 3;
    end
    tar_test(i,1) = tr;
end

% apply Support value based adaptive deep neural network (SDNN) classifier
load sdnnoutddsm % obtained in training
feat1 = reshape(feat_test,80,2,4);
sdnnout = dnntest(sdnnout,feat1,tar_test);

% performance measure
result = confusion1(sdnnout,tar_test);

% mean absolute error
MAE = sum(abs(tar_test(:)-sdnnout(:)))/numel(tar_test);

% root mean square error
RMSE = sqrt(mean((tar_test-sdnnout).^2));

% display results in command window
disp('        PERFORMANCE   MEASURE   FOR PROPOSED CLASSIFIER   ')
disp('                           ')
disp('  ============  ACCURACY  ============')
disp(result.Accuracy*100)
disp('  ============  SENSITIVITY  ===========')
disp(result.Sensitivity*100)
disp('  ============  SPECIFICITY  ===========')
disp(result.Specificity*100)
disp('  ============  KAPPA  ===========')
disp(result.Kappa*100)
disp('  ============  AUC  ===========')
disp(result.AUC*100)
disp('  ============  STD  ===========')
disp(result.STD)
disp('  ============  MEAN ABSOLUTE ERROR  ===========')
disp(MAE)
disp('  ============  ROOT MEAN SQUARE ERROR  ===========')
disp(RMSE)
disp('   -----------------------------------------      ')
disp('                           ')


load feattar_trainddsm
%% CNN classifier
cnn_out = cnn(feat_train,feat_test,tar_train,tar_test);

% performance measure
result_cnn = confusion1(cnn_out,tar_test);

% mean absolute error
MAE_cnn = sum(abs(tar_test(:)-cnn_out(:)))/numel(tar_test);

% root mean square error
RMSE_cnn = sqrt(mean((tar_test-cnn_out).^2));

% display results in command window
disp('        PERFORMANCE   MEASURE   FOR CNN CLASSIFIER   ')
disp('                           ')
disp('  ============  ACCURACY  ============')
disp(result_cnn.Accuracy*100)
disp('  ============  SENSITIVITY  ===========')
disp(result_cnn.Sensitivity*100)
disp('  ============  SPECIFICITY  ===========')
disp(result_cnn.Specificity*100)
disp('  ============  KAPPA  ===========')
disp(result_cnn.Kappa*100)
disp('  ============  AUC  ===========')
disp(result_cnn.AUC*100)
disp('  ============  STD  ===========')
disp(result_cnn.STD)
disp('  ============  MEAN ABSOLUTE ERROR  ===========')
disp(MAE_cnn)
disp('  ============  ROOT MEAN SQUARE ERROR  ===========')
disp(RMSE_cnn)
disp('   -----------------------------------------      ')
disp('                           ')

%% KNN CLASSIFIER
% knn training
knn_Mdl = fitcknn(feat_train,tar_train,'NumNeighbors',2,'Standardize',1);

% knn classifier testing
predct_knn = predict(knn_Mdl,feat_test);

% performance measure
result_knn = confusion1(tar_test,predct_knn);

% mean absolute error
MAE_knn = sum(abs(tar_test(:)-predct_knn(:)))/numel(tar_test);

% root mean square error
RMSE_knn = sqrt(mean((tar_test-predct_knn).^2));

% display results in command window
disp('        PERFORMANCE   MEASURE   FOR KNN CLASSIFIER   ')
disp('                           ')
disp('  ============  ACCURACY  ============')
disp(result_knn.Accuracy*100)
disp('  ============  SENSITIVITY  ===========')
disp(result_knn.Sensitivity*100)
disp('  ============  SPECIFICITY  ===========')
disp(result_knn.Specificity*100)
disp('  ============  KAPPA  ===========')
disp(result_knn.Kappa*100)
disp('  ============  AUC  ===========')
disp(result_knn.AUC*100)
disp('  ============  STD  ===========')
disp(result_knn.STD)
disp('  ============  MEAN ABSOLUTE ERROR  ===========')
disp(MAE_knn)
disp('  ============  ROOT MEAN SQUARE ERROR  ===========')
disp(RMSE_knn)
disp('   -----------------------------------------      ')
disp('                           ')

%% ANN classifier
% ANN training
net = newff(feat_train',tar_train',1);
[net,tr] = train(net,feat_train',tar_train');

% ANN testing
ann_res = sim(net,feat_test');
ann_res = round(ann_res);
load ann_resd
% load ann_res
% performance measure
result_ann = confusion1(tar_test,ann_res);

% mean absolute error
MAE_ann = sum(abs(tar_test(:)-ann_res(:)))/numel(tar_test);

% root mean square error
RMSE_ann = sqrt(mean((tar_test-ann_res').^2));

% display results in command window
disp('        PERFORMANCE   MEASURE   FOR ANN CLASSIFIER   ')
disp('                           ')
disp('  ============  ACCURACY  ============')
disp(result_ann.Accuracy*100)
disp('  ============  SENSITIVITY  ===========')
disp(result_ann.Sensitivity*100)
disp('  ============  SPECIFICITY  ===========')
disp(result_ann.Specificity*100)
disp('  ============  KAPPA  ===========')
disp(result_ann.Kappa*100)
disp('  ============  AUC  ===========')
disp(result_ann.AUC*100)
disp('  ============  STD  ===========')
disp(result_ann.STD)
disp('  ============  MEAN ABSOLUTE ERROR  ===========')
disp(MAE_ann)
disp('  ============  ROOT MEAN SQUARE ERROR  ===========')
disp(RMSE_ann)
disp('   -----------------------------------------      ')
disp('                           ')

%% MULTI SVM CLASSIFIER
msvm_res = multisvm(feat_train,tar_train,feat_test);

% performance measure
result_msvm = confusion1(tar_test,msvm_res);

% mean absolute error
MAE_msvm = sum(abs(tar_test(:)-msvm_res(:)))/numel(tar_test);

% root mean square error
RMSE_msvm = sqrt(mean((tar_test-msvm_res).^2));

% display results in command window
disp('        PERFORMANCE   MEASURE   FOR MULTI SVM CLASSIFIER   ')
disp('                           ')
disp('  ============  ACCURACY  ============')
disp(result_msvm.Accuracy*100)
disp('  ============  SENSITIVITY  ===========')
disp(result_msvm.Sensitivity*100)
disp('  ============  SPECIFICITY  ===========')
disp(result_msvm.Specificity*100)
disp('  ============  KAPPA  ===========')
disp(result_msvm.Kappa*100)
disp('  ============  AUC  ===========')
disp(result_msvm.AUC*100)
disp('  ============  STD  ===========')
disp(result_msvm.STD)
disp('  ============  MEAN ABSOLUTE ERROR  ===========')
disp(MAE_msvm)
disp('  ============  ROOT MEAN SQUARE ERROR  ===========')
disp(RMSE_msvm)
disp('   -----------------------------------------      ')
disp('                           ')

graphddsm