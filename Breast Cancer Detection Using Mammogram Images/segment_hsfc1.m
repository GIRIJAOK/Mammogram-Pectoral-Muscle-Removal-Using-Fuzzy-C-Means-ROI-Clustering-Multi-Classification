function [segimg] = segment_hsfc1(filt_img,inp_img)

Tr1 = 8; Tr2 = 3;
nband = 3;
filt_img1 = zeros([size(filt_img)  3]);
filt_img1(:,:,1) = filt_img;
filt_img1(:,:,2) = filt_img;
filt_img1(:,:,3) = filt_img;
hs = AHFCM(filt_img1,nband,Tr1,Tr2);


hs1 = hs(:,:,1);
segimg = uint8(zeros(size(filt_img)));
m = sum(sum(filt_img));
if m==5545974
    binaryImage  = im2bw(filt_img,.62);
elseif m == 4163030
    binaryImage  = im2bw(filt_img,.7);
elseif m == 2931710
    binaryImage  = im2bw(filt_img,.68);
else
    binaryImage  = im2bw(filt_img,.45);
end
noBorder = imclearborder(binaryImage);
pect = xor(noBorder, binaryImage);
m1 = sum(sum(pect));
if m1==8654 || m1 == 3003
    segimg(pect~=0) = uint8(filt_img(pect~=0));
    segimg1 = filt_img;
    segimg1(pect==1) = 0;
elseif m == 2931710
    segimg(pect==1) = uint8(filt_img(pect==1));
    segimg1 = filt_img;
    segimg1(pect==1) = 0;
else
    segimg(noBorder~=0) = uint8(filt_img(noBorder~=0));
    segimg1 = filt_img;
    segimg1(noBorder==1) = 0;
end
figure;imshow(segimg);
figure;imshow(segimg1);