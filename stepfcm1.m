function [U_new, center, obj_fcn] = stepfcm1(data, U, cluster_n, expo)
% STEPFCM One step in fuzzy c-mean clustering.


mf = U.^expo;       % MF matrix after exponential modification
center = mf*data./((ones(size(data, 2), 1)*sum(mf'))'); % new center
dist = distfcm(center, data);       % fill the distance matrix
enthal = data+prod(U(:,1)); % enthalpy
obj_fcn = sum(sum((dist.^2).*mf))*(1/sum(sum(enthal)));  % objective function
tmp = dist.^(-2/(expo-1));      % calculate new U, suppose expo != 1
U_new = tmp./(ones(cluster_n, 1)*sum(tmp));