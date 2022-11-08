
function dnn = sdnn(inpdat,tar)

% initialize dnn

dnn.layers = {
    struct('type', 'i') %
    struct('type', 'c', 'outputmaps', 3, 'kernelsize', 5) % convolution layer
    struct('type', 's', 'scale', 2) % down sampling layer
    };

opts.batchsize = 2;
opts.numepochs = 10;
inc = 1;
for i = 1:80
    for j = 1:2
        re_tr(i,:,j) = inpdat(inc,:);
        tar1(i,j) = tar(inc,1);
        inc = inc+1;
    end
end

dnn = dnnsetup(dnn, re_tr, tar1);
dnn = dnntrain(dnn, re_tr, tar1, opts); % dnn training