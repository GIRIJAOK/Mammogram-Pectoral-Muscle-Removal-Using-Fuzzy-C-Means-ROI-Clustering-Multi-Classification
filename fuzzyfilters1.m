function [Y] = fuzzyfilters1(inp,h)

if nargin < 2
    h = 3;    % local search window size
    f = 1;    % padding value for window
else
    f = (h-1)/2;    % padding value for window
end
F = zeros(h*h,1);
Y  = zeros(size(inp));

X = double(padarray(inp,[f f],'symmetric'));
[m,n,~] = size(X);

for i = 1+f:1:m-f
    for j = 1+f:1:n-f
        x = reshape(X(i-f:i+f, j-f:j+f),[],1);
        xmax = max(x);
        xmin = min(x);
        xmed = median(x);
        
        F(:,:) = 0;
        if (xmed-xmin==0)||(xmax-xmed==0)
            F(:,:) = 1;
        else
            ind1 = find((x>=xmin)&(x<=xmed));
            F(ind1) = 1-(xmed-x(ind1))/(xmed-xmin);
            
            ind2 = find((x>=xmed)&(x<=xmax));
            F(ind2) = 1-(x(ind2)-xmed)/(xmax-xmed);
        end
        
        Y(i-f,j-f) = sum(sum(F.*x))/sum(sum(F));
        clear xmax xmin xmed;
    end
end
end