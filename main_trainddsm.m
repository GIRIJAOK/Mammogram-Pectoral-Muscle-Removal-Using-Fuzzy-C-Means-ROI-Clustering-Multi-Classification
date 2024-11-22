clc
clear
close all
warning off;

% list the content of input dataset
flist = dir('.\trainingdataddsm\*.jpg');

% for length of the dataset
for i = 1:length(flist)
    % read input image
    inp_img = imresize(imread(['.\trainingdataddsm\' flist(i).name]),[256 256]);
    inp_all{i,1} = inp_img;
    
    % apply preprocessing
    % apply fuzzy filtering
    fuzfilt_img = fuzzyfilters1(inp_img);
    % apply histogram equalization
    histeq_img = histeq(uint8(fuzfilt_img));
    % apply enthalpy based FCM
    [pect_reg,rem_reg] = prem_efcm(histeq_img,.8);
     % feature extraction
    feat = feat_extract(rem_reg,4,.8);
    feat_train(i,:) = feat';
    m = mean(feat);
    % set target value
    if flist(i).name(1)=='A' % normal
        tr1 = 1;
    elseif flist(i).name(1)=='C' % malignant
        m1 = 1.6233e+04;
        m2 = 1.8032e+04;
        m3 = 2.4197e+04;
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
    tar_train1(i,1) = tr1;
end

% apply Median Support Value Based Convolution Neural Network (MS-CNN) classifier
sdnnout = ms_cnn(feat_train,tar_train1);