% list the content of input dataset
flist = dir('.\data\*.jpg');

% for length of the dataset
for i = 1
    % read input image
    inp_img = imresize(imread(['.\data\' flist(i).name]),[256 256]);
    figure;imshow(inp_img);
    
    % apply enthalpy based FCM
    [pect_reg,rem_reg] = prem_efcm1(inp_img,.25,4);
    figure;imshow(pect_reg);
    figure;imshow(rem_reg);
end