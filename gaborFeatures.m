function [feature,ma,mi,featureVector] = gaborFeatures(img,gaborArray,d1,d2)
img = double(img);

% Filter the image using the Gabor filter bank
[u,v] = size(gaborArray);
gaborResult = cell(u,v);
for i = 1 : u
    for j = 1 : v
        gaborResult{i,j} = imfilter(img, gaborArray{i,j});
    end
end

% Extract feature vector from input image
featureVector = [];
for i = 1 : u
    for j = 1 : v
        
        gaborAbs = abs(gaborResult{i,j});
        gaborAbs = downsample(gaborAbs,d1);
        gaborAbs = downsample(gaborAbs.',d2);
        gaborAbs = gaborAbs( : );
        
        % Normalized to zero mean and unit variance. (if not applicable, please comment this line)
        gaborAbs = (gaborAbs-mean(gaborAbs))/std(gaborAbs,1);
        
        featureVector =  [featureVector; mean(gaborAbs)];
    end
end
ma = max(featureVector);
mi = min(featureVector);
feature = mean(featureVector);