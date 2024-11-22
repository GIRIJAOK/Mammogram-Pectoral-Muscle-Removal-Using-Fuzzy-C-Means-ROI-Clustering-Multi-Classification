% list the content of input dataset
flist = dir('.\data\*.jpg');

% for length of the dataset
for i = 2
    % read input image
    inp_img = imresize(imread(['.\data\' flist(i).name]),[256 256]);
    figure;imshow(inp_img);
    if size(inp_img,3)>1
        inp_img = rgb2gray(inp_img);
    end
    
    % apply preprocessing
    % apply fuzzy filtering
    fuzfilt_img = fuzzyfilters1(inp_img);
    
    % apply histogram equalizatin
    histeq_img = histeq(uint8(fuzfilt_img));
    
    % apply enthalpy based FCM
    [pect_reg,rem_reg] = prem_efcm1(histeq_img,.79,2);
    figure;imshow(pect_reg);
    figure;imshow(rem_reg);
end