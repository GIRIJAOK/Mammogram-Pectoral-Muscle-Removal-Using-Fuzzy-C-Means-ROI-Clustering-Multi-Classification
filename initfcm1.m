function U = initfcm1(cluster_n, data,center,expo)
% INITFCM Generate initial fuzzy partition matrix for fuzzy c-means clustering.

dist = distfcm1(center, data);       % fill the distance matrix
obj_fcn = sum(sum((dist.^2)));  % objective function
tmp = dist.^(-2/(expo-1));      % calculate new U, suppose expo != 1
U = tmp./(ones(cluster_n, 1)*sum(tmp));