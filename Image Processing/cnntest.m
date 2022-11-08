function [out] = cnntest(net, x, y)
%  feedforward
net = cnnff(net, x);
[h] = maxi(net,y);
out = h.o;
end