function [out] = ecnntest(net, x, y)
%  feedforward
net = cnnff(net, x);
[h] = maxl(net,y);
out = h.o;
end