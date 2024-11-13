function [out] = dnntest(net, x, y)
%  feedforward
net = dnnff(net, x);
[h] = max1(net,y);
out = h.o;
end