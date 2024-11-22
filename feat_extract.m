function feat = feat_extract(inp,t1,t2)

% apply DCT
dct_out = dct(double(inp));
dct_feat = mean(mean(dct_out));

% apply DWT
[cA,cH,cV,cD] = dwt2(inp,'haar');
dwt_out = [sum(sum(cA)) sum(sum(cH)) sum(sum(cV)) sum(sum(cD))];
dwt_feat = mean(dwt_out);

% apply gabor filter
gabArray = gaborFilterBank(5,8,30,30); % Generates the Gabor filter bank
% Extracts Gabor feature
[gab_feat] = gaborFeatures(inp,gabArray,2,2);

% apply Multi fractal analysis
mf_feat = multifractalanaly(inp);

% apply directional feature
dirfeat = directionfeat(double(inp));

% apply morphological features
% hu's moment
hu_mmentfeat  = hu_moments(double(inp));
se = strel('disk',t1);
bw = im2bw(inp,t2);
BW = imopen(bw,se); % open
STATS = regionprops(BW, 'all'); 
areafeat = STATS(1).Area; % area
pxelval = STATS(1).PixelIdxList; % density
densfeat = mean(pxelval);
eccenfeat = STATS(1).Eccentricity; % Eccentricity
i = inp;
rtemp = min(i);         % find the min. value of pixels in all the columns (row vector)
rmin = min(rtemp);      % find the min. value of pixel in the image
rtemp = max(i);         % find the max. value of pixels in all the columns (row vector)
rmax = max(rtemp);      % find the max. value of pixel in the image
m = 255/(rmax - rmin);  % find the slope of line joining point (0,255) to (rmin,rmax)
c = 255 - m*rmax;       % find the intercept of the straight line with the axis
i_new = m*i + c;        % transform the image according to new slope
strectfeat = mean(mean(i_new));

feat = [dct_feat dwt_feat gab_feat mf_feat dirfeat hu_mmentfeat areafeat densfeat eccenfeat strectfeat];