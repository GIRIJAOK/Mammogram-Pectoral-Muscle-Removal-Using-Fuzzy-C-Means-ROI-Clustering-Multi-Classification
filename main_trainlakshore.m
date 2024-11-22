clc
clear
close all
warning off;

% list the content of input dataset
flist = dir('.\trainingdatalakshore\*.jpg');

% for length of the dataset
for i = 1:length(flist)
    % read input image
    inp_img = imresize(imread(['.\trainingdatalakshore\' flist(i).name]),[256 256]);
    inp_all{i,1} = inp_img;
    
    
    % apply enthalpy based FCM
    [pect_reg,rem_reg] = prem_efcm(inp_img,.3);
    
    % feature extraction
    feat = feat_extract(rem_reg,4,.3);
    feat_train(i,:) = feat';
    m = mean(feat);
    
    % set target value
    if flist(i).name(1)=='N' % normal
        tr1 = 1;
    elseif flist(i).name(1:2)=='MI' % Micro
        tr1 = 21;
    elseif flist(i).name(1:2)=='MA' % Masses
        tr1 = 22;
    elseif flist(i).name(1:2)=='AD' % Architectural distortion
        tr1 = 23;
    elseif flist(i).name(1:2)=='AS' % Bilateral asymmetry
        tr1 = 24;
    elseif flist(i).name(1)=='B' % beningn
        tr1 = 3;
    end
    tar_train1(i,1) = tr1;
end

% apply Median Support Value Based Convolution Neural Network (MS-CNN) classifier
sdnnout = ms_cnn(feat_train,tar_train1);