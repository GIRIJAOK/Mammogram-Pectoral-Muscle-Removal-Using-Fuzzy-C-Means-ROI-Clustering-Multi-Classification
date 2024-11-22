function [pect_reg,rem_reg] = prem_efcm1(eq_img,t,t1)

hs = EFCMn(eq_img,2,t);

segimg1 = uint8(zeros(size(hs)));
segimg1(hs==1) = eq_img(hs==1);
binaryImage  = im2bw(segimg1,t);
se = strel('disk',t1);
BW = imopen(binaryImage,se); % open
STATS = regionprops(BW, 'all');
im = []; im1 = [];
for i = 1 : length(STATS)
    if (STATS(i).Area>2000) && (STATS(i).Area<5000)
        im = STATS(i).Image;
        B = STATS(i).BoundingBox;
    elseif (STATS(i).Area>5000)
        im1 = STATS(i).Image;
        B1 = STATS(i).BoundingBox;
    end
end

if ~isempty(im)
    BW = imclose(im,se); % close
    bw1 = zeros(size(BW));
    bw1(B(2):B(2)+B(4)-1,B(1):B(1)+B(3)-1) = BW;
    [x,y] = find(bw1==1);
    
    pect_reg = uint8(zeros(size(binaryImage)));
    % replace the pixel with input image
    for i1 = 1 : length(x)
        pect_reg(x(i1),y(i1)) = eq_img(x(i1),y(i1));
    end
else
    pect_reg = uint8(zeros(size(binaryImage)));
    pect_reg(binaryImage==1) = eq_img(binaryImage==1);
end

if ~isempty(im1)
    BW1 = imclose(im1,se); % close
    bw2 = zeros(size(BW1));
    bw2(B1(2):B1(2)+B1(4)-1,B1(1):B1(1)+B1(3)-1) = BW1;
    [x,y] = find(bw2==1);
    
    rem_reg = uint8(zeros(size(binaryImage)));
    % replace the pixel with input image
    for i1 = 1 : length(x)
        rem_reg(x(i1),y(i1)) = eq_img(x(i1),y(i1));
    end
else
    rem_reg = uint8(zeros(size(binaryImage)));
    rem_reg(binaryImage==1) = eq_img(binaryImage==1);
end