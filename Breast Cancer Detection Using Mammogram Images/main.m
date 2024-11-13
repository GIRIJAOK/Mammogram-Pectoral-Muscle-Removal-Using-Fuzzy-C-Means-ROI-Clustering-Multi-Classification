clc
clear
close all
warning off;

% list the content of input dataset
flist = dir('.\data\*.jpg');
% for length of the dataset
for i = 1:length(flist)
    % read input image
    inp_img = imresize(imread(['.\data\' flist(i).name]),[256 256]);
    figure;imshow(inp_img);
    inp_all{i,1} = inp_img;
    
    if size(inp_img,3)>1
        inp_img = rgb2gray(inp_img);
    end
    % apply wiener filtering
    h = fspecial('gaussian',[256,256],40);
    h = mat2gray(h);    
    Wiener_img = imageRestoration(inp_img,h);
    figure;imshow(Wiener_img);
   % apply Histo-sigmoid based ROI clustering
    seg_img = segment_hsfc1(Wiener_img,inp_img,i);
    
end