function cnn = ms_cnn(inpdat,tar)

% initialize cnn

cnn.layers = {
    struct('type', 'i') %
    struct('type', 'c', 'outputmaps', 3, 'kernelsize', 5) % convolution layer
    struct('type', 's', 'scale', 2) % down sampling layer
    };

opts.batchsize = 2;
opts.numepochs = 10;
inc = 1;

if length(tar) == 160
    sz = 80;
elseif length(tar) == 60
    sz = 30;
end

for i = 1:sz
    for j = 1:2
        re_tr(i,:,j) = inpdat(inc,:);
        tar1(i,j) = tar(inc,1);
        inc = inc+1;
    end
end

cnn = mscnnsetup(cnn, re_tr, tar1);
cnn = mscnntrain(cnn, re_tr, tar1, opts); % cnn training