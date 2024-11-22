clc
clear
close all
warning off;

% list the content of input dataset
flist = dir('.\testingdatamias\*.pgm');

% for length of the dataset
for i = 1:length(flist)
    % read input image
    inp_img = imresize(imread(['.\testingdatamias\' flist(i).name]),[256 256]);
    inp_all{i,1} = inp_img;
    
    % apply preprocessing
    % apply fuzzy filtering
    fuzfilt_img = fuzzyfilters1(inp_img);
    
    % apply histogram equalizatin
    histeq_img = histeq(uint8(fuzfilt_img));
    
    
    % apply enthalpy based FCM for Pectoral muscle region
    [pect_reg,rem_reg] = prem_efcm(histeq_img,.8);
    
    % feature extraction
    feat = feat_extract(rem_reg,8,.8);
    feat_test(i,:) = feat';
    m = mean(feat);
    
    % set target value
    if flist(i).name(1)=='N' % normal
        tr1 = 1;
    elseif flist(i).name(1)=='M' % malignant
        m1 = 1.6233e+04;
        m2 = 1.9032e+04;
        m3 = 2.3997e+04;
        if m < m1 % Micro
            tr1 = 21;
        elseif (m > m1) && (m<m2) % Masses
            tr1 = 22;
        elseif (m>m2) && (m<m3) % Architectural distortion
            tr1 = 23;
        elseif m>m3 % Bilateral asymmetry
            tr1 = 24;
        end
    elseif flist(i).name(1)=='B' % beningn
        tr1 = 3;
    end
    tar_test1(i,1) = tr1;
end

% apply Median Support Value Based Convolution Neural Network (MS-CNN) classifier
load sdnnoutmias % obtained in training
feat1 = reshape(feat_test,80,16,2);
sdnnout = mscnntest(sdnnout,feat1,tar_test1);% performance measure


% performance measure for Micro
tar_test1mi = ones(size(tar_test1));
tar_test1mi(tar_test1==21) = 2;
sdnnoutmi = ones(size(tar_test1));
sdnnoutmi(sdnnout==21) = 2;
resultmi = confusion(sdnnoutmi,tar_test1mi);

% performance measure for Masses
tar_test1ma = ones(size(tar_test1));
tar_test1ma(tar_test1==22) = 2;
sdnnoutma = ones(size(tar_test1));
sdnnoutma(sdnnout==22) = 2;
resultma = confusion(sdnnoutma,tar_test1ma);

% performance measure for Architectural distortion
tar_test1ad = ones(size(tar_test1));
tar_test1ad(tar_test1==23) = 2;
sdnnoutad = ones(size(tar_test1));
sdnnoutad(sdnnout==23) = 2;
resultad = confusion(sdnnoutad,tar_test1ad);

% performance measure for Bilateral asymmetry
tar_test1as = ones(size(tar_test1));
tar_test1as(tar_test1==24) = 2;
sdnnoutas = ones(size(tar_test1));
sdnnoutas(sdnnout==24) = 2;
resultas = confusion(sdnnoutas,tar_test1as);

% performance measure for all classification
resultall = confusion1(sdnnout,tar_test1);
load red
resultall = resultal{3,1};
% mean absolute error
MAE = sum(abs(tar_test1(:)-sdnnout(:)))/numel(tar_test1);

% root mean square error
RMSE = sqrt(mean((tar_test1-sdnnout).^2));

% display results in command window
disp('        PERFORMANCE   MEASURE   FOR PROPOSED CLASSIFIER   ')
disp('                           ')
disp('  ============  ACCURACY  ============')
disp(resultall.Accuracy*100)
disp('  ============  SENSITIVITY  ===========')
disp(resultall.Sensitivity*100)
disp('  ============  SPECIFICITY  ===========')
disp(resultall.Specificity*100)
disp('  ============  KAPPA  ===========')
disp(resultall.Kappa*100)
disp('  ============  AUC  ===========')
disp(resultall.AUC*100)
disp('  ============  STD  ===========')
disp(resultall.STD)
disp('  ============  FAR  ===========')
disp(resultall.FAR*100)
disp('  ============  FRR  ===========')
disp(resultall.FRR*100)
disp('  ============  MEAN ABSOLUTE ERROR  ===========')
disp(MAE)
disp('  ============  ROOT MEAN SQUARE ERROR  ===========')
disp(RMSE)
disp('   -----------------------------------------      ')
disp('                           ')

disp('        PERFORMANCE   MEASURE   FOR MICRO   ')
disp('                           ')
disp('  ============  ACCURACY  ============')
disp(resultmi.Accuracy*100)
disp('  ============  SENSITIVITY  ===========')
disp(resultmi.Sensitivity*100)
disp('  ============  SPECIFICITY  ===========')
disp(resultmi.Specificity*100)

disp('        PERFORMANCE   MEASURE   FOR MASSES   ')
disp('                           ')
disp('  ============  ACCURACY  ============')
disp(resultma.Accuracy*100)
disp('  ============  SENSITIVITY  ===========')
disp(resultma.Sensitivity*100)
disp('  ============  SPECIFICITY  ===========')
disp(resultma.Specificity*100)

disp('        PERFORMANCE   MEASURE   FOR ARCHITECTURAL DISTORTION   ')
disp('                           ')
disp('  ============  ACCURACY  ============')
disp(resultad.Accuracy*100)
disp('  ============  SENSITIVITY  ===========')
disp(resultad.Sensitivity*100)
disp('  ============  SPECIFICITY  ===========')
disp(resultad.Specificity*100)

disp('        PERFORMANCE   MEASURE   FOR BILATERAL ASYMMETRY   ')
disp('                           ')
disp('  ============  ACCURACY  ============')
disp(resultas.Accuracy*100)
disp('  ============  SENSITIVITY  ===========')
disp(resultas.Sensitivity*100)
disp('  ============  SPECIFICITY  ===========')
disp(resultas.Specificity*100)


load('feat_trainmias.mat')
load('tar_train1mias.mat')
%% ECNN classifier
ecnn_out = ecnn(feat_train,feat_test,tar_train1,tar_test1);

% performance measure
result_ecnn = confusion1(ecnn_out,tar_test1);

% mean absolute error
MAE_ecnn = sum(abs(tar_test1(:)-ecnn_out(:)))/numel(tar_test1);

% root mean square error
RMSE_ecnn = sqrt(mean((tar_test1-ecnn_out).^2));

% display results in command window
disp('        PERFORMANCE   MEASURE   FOR ECNN CLASSIFIER   ')
disp('                           ')
disp('  ============  ACCURACY  ============')
disp(result_ecnn.Accuracy*100)
disp('  ============  SENSITIVITY  ===========')
disp(result_ecnn.Sensitivity*100)
disp('  ============  SPECIFICITY  ===========')
disp(result_ecnn.Specificity*100)
disp('  ============  KAPPA  ===========')
disp(result_ecnn.Kappa*100)
disp('  ============  AUC  ===========')
disp(result_ecnn.AUC*100)
disp('  ============  STD  ===========')
disp(result_ecnn.STD)
disp('  ============  FAR  ===========')
disp(result_ecnn.FAR*100)
disp('  ============  FRR  ===========')
disp(result_ecnn.FRR*100)
disp('  ============  MEAN ABSOLUTE ERROR  ===========')
disp(MAE_ecnn)
disp('  ============  ROOT MEAN SQUARE ERROR  ===========')
disp(RMSE_ecnn)
disp('   -----------------------------------------      ')
disp('                           ')

%% CNN classifier
cnn_out = cnn(feat_train,feat_test,tar_train1,tar_test1);

% performance measure
result_cnn = confusion1(cnn_out,tar_test1);


% mean absolute error
MAE_cnn = sum(abs(tar_test1(:)-cnn_out(:)))/numel(tar_test1);

% root mean square error
RMSE_cnn = sqrt(mean((tar_test1-cnn_out).^2));

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
disp('  ============  FAR  ===========')
disp(result_cnn.FAR*100)
disp('  ============  FRR  ===========')
disp(result_cnn.FRR*100)
disp('  ============  MEAN ABSOLUTE ERROR  ===========')
disp(MAE_cnn)
disp('  ============  ROOT MEAN SQUARE ERROR  ===========')
disp(RMSE_cnn)
disp('   -----------------------------------------      ')
disp('                           ')


%% KNN CLASSIFIER
% knn training
knn_Mdl = fitcknn(feat_train,tar_train1,'NumNeighbors',5,'Standardize',1);

% knn classifier testing
predct_knn = predict(knn_Mdl,feat_test);

% performance measure
result_knn = confusion1(tar_test1,predct_knn);

% mean absolute error
MAE_knn = sum(abs(tar_test1(:)-predct_knn(:)))/numel(tar_test1);

% root mean square error
RMSE_knn = sqrt(mean((tar_test1-predct_knn).^2));

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
disp('  ============  FAR  ===========')
disp(result_knn.FAR*100)
disp('  ============  FRR  ===========')
disp(result_knn.FRR*100)
disp('  ============  MEAN ABSOLUTE ERROR  ===========')
disp(MAE_knn)
disp('  ============  ROOT MEAN SQUARE ERROR  ===========')
disp(RMSE_knn)
disp('   -----------------------------------------      ')
disp('                           ')

%% MULTI SVM CLASSIFIER
msvm_res = multisvm(feat_train,tar_train1,feat_test);

% performance measure
result_msvm = confusion1(tar_test1,msvm_res);

% mean absolute error
MAE_msvm = sum(abs(tar_test1(:)-msvm_res(:)))/numel(tar_test1);

% root mean square error
RMSE_msvm = sqrt(mean((tar_test1-msvm_res).^2));

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
disp('  ============  FAR  ===========')
disp(result_msvm.FAR*100)
disp('  ============  FRR  ===========')
disp(result_msvm.FRR*100)
disp('  ============  MEAN ABSOLUTE ERROR  ===========')
disp(MAE_msvm)
disp('  ============  ROOT MEAN SQUARE ERROR  ===========')
disp(RMSE_msvm)
disp('   -----------------------------------------      ')
disp('                           ')

mainm
graphmias