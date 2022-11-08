function net = dnntrain(net, x, y, opts)
% here input x is entropy value and
% input y is the target value
m = size(x, 3);
numbatches = m / opts.batchsize;
numbatches = round(numbatches);
if rem(numbatches, 1) ~= 0
    error('numbatches not integer');
end
net.rL = [];
for i = 1 : opts.numepochs
    kk = randperm(m);
    for l = 1 : numbatches
        batch_x = x(:, :, kk((l - 1) * opts.batchsize + 1 : l * opts.batchsize)); % obtain a batches for input x (entropy value)
        batch_y = y(:, kk((l - 1) * opts.batchsize + 1 : l * opts.batchsize)); % obtain a batches for input y (target)
        
        net = dnnff(net, batch_x);
        net = dnnbp(net, batch_y);
        if isempty(net.rL)
            net.rL(1) = net.L;
        end
        net.rL(end + 1) = 0.99 * net.rL(end) + 0.01 * net.L;
    end
end
end