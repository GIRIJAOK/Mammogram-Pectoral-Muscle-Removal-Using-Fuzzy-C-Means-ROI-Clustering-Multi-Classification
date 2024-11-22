function dirfeat = directionfeat(Y)
sz = size(Y);
r = sz(1);
c = sz(2);
PrewittH = [-1 0 1;-1 0 1;-1 0 1];%for measuring horizontal differences
PrewittV = [1 1 1;0 0 0;-1 -1 -1];%for measuring vertical differences

% Applying PerwittH operator
deltaH = zeros(r,c);
for i = 2:r-1
    for j = 2:c-1
        deltaH(i,j) = sum(sum(Y(i-1:i+1,j-1:j+1).*PrewittH));
    end
end

% Modifying borders
for j = 2:c-1
    deltaH(1,j) = Y(1,j+1)-Y(1,j);
    deltaH(r,j) = Y(r,j+1)-Y(r,j);  
end

for i = 1:r
    deltaH(i,1) = Y(i,2)-Y(i,1);
    deltaH(i,c) = Y(i,c)-Y(i,c-1);  
end

% Applying PerwittV operator
deltaV = zeros(r,c);
for i = 2:r-1
    for j = 2:c-1
        deltaV(i,j) = sum(sum(Y(i-1:i+1,j-1:j+1).*PrewittV));
    end
end

% Modifying borders
for j = 1:c
    deltaV(1,j) = Y(2,j)-Y(1,j);
    deltaV(r,j) = Y(r,j)-Y(r-1,j);  
end

for i = 2:r-1
    deltaV(i,1) = Y(i+1,1)-Y(i,1);
    deltaV(i,c) = Y(i+1,c)-Y(i,c);  
end

% Magnitude
deltaG = (abs(deltaH)+abs(deltaV))/2;

% Local edge direction (0<=theta<pi)
theta = zeros(r,c);
for i = 1:r
    for j = 1:c
        if (deltaH(i,j)==0)&&(deltaV(i,j)==0)
            theta(i,j) = 0;
        elseif deltaH(i,j)==0
            theta(i,j) = pi;           
        else          
            theta(i,j) = atan(deltaV(i,j)/deltaH(i,j))+pi/2;
        end
    end
end

deltaGt = deltaG(:);
theta1 = theta(:);

% Set a Threshold value for delta G
n = 16;
HD = zeros(1,n);
Threshold = 12;
counti = 0;
for m = 0:(n-1)
    countk = 0;
    for k = 1:length(deltaGt)
        if ((deltaGt(k)>=Threshold) && (theta1(k)>=(2*m-1)*pi/(2*n)) && (theta1(k)<(2*m+1)*pi/(2*n)))
            countk=countk+1;
            counti=counti+1;
        end
    end
    HD(m+1) = countk;
end
HDf = HD/counti;
dirfeat = mean(HDf);