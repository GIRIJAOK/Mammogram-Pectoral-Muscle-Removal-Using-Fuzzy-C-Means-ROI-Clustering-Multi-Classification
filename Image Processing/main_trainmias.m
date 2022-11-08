clc
clear
close all
warning off;

% list the content of input dataset
flist = dir('.\trainingdatamias\*.pgm');

% for length of the dataset
for i = 1:length(flist)
    % read input image
    inp_img = imresize(imread(['.\trainingdatamias\' flist(i).name]),[256 256]);
    inp_all{i,1} = inp_img;
    
    % apply wiener filtering
    h = fspecial('gaussian',[256,256],40);
    h = mat2gray(h);    
    Wiener_img = imageRestoration(inp_img,h);
    
    % apply Histo-sigmoid based ROI clustering
    seg_img = segment_hsfc(Wiener_img,inp_img);
    
    % feature extraction
    feat = feat_extract(seg_img);
    feat_train(i,:) = feat';
    
    % set target value
    if flist(i).name(1)=='N' % normal
        tr = 1;
    elseif flist(i).name(1)=='M' % malignant
        tr = 2;
    elseif flist(i).name(1)=='B' % beningn
        tr = 3;
    end
    tar_train(i,1) = tr;
end

% apply Support value based adaptive deep neural network (SDNN) classifier
sdnnout = sdnn(feat_train,tar_train);