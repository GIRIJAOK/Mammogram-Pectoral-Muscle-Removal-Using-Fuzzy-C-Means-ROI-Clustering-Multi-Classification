function [seg] = EFCMn(data,nband,t)

I1 = im2bw(data,t);

% FCM clustering
options = [2; % exponent for the partition matrix U
    5; % max. number of iteration
    1e-2000; % min. amount of improvement
    0];

[~,center] = fcm1(I1(:),nband,options);

for ii = 1:size(center,2)
    [~,ind] = min(center(:,ii));
    if ind == 1
        a(ii,1) = 1;
    else
        a(ii,1) = 0;
    end
end

seg = reshape(a,[size(I1)]);

a1 = find(seg<1);
a2 = find(seg==1);
if length(a1)>length(a2)
    seg = seg;
else
    seg = ~seg;
end