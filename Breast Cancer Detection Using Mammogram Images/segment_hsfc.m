function [segimg] = segment_hsfc(filt_img,inp_img)

Tr1 = 8; Tr2 = 3;
nband = 3;
filt_img1 = zeros([size(filt_img)  3]);
filt_img1(:,:,1) = filt_img;
filt_img1(:,:,2) = filt_img;
filt_img1(:,:,3) = filt_img;
hs = AHFCM(filt_img1,nband,Tr1,Tr2);


hs1 = hs(:,:,1);
segimg = uint8(zeros(size(filt_img)));
binaryImage  = im2bw(filt_img);
noBorder = imclearborder(binaryImage);
pect = xor(noBorder, binaryImage);
m = mean(mean(pect));
if m>.5
    segimg(pect~=0) = uint8(filt_img(pect~=0));
    segimg1 = filt_img;
    segimg1(pect==1) = 0;
else
    segimg(noBorder~=0) = uint8(filt_img(noBorder~=0));
    segimg1 = filt_img;
    segimg1(noBorder==1) = 0;
end