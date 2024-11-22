function [out] = mscnntest(net, x, y)
%  feedforward
net = mscnnff(net, x);
[h] = max1(net,y);
out = h.o;
end