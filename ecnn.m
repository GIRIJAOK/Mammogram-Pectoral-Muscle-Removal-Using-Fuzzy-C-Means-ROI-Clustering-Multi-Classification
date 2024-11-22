function out = ecnn(inpdat,inpdat_tst,train_tar,tst_tar)

% initialize cnn

cnn.layers = {
    struct('type', 'i') %
    struct('type', 'c', 'outputmaps', 3, 'kernelsize', 5) % convolution layer
    struct('type', 's', 'scale', 2) % down sampling layer
    };

opts.batchsize = 2;
opts.numepochs = 10;
inc = 1;

if length(train_tar) == 160
    sz = 80;
elseif length(train_tar) == 60
    sz = 30;
end

for i = 1:sz
    for j = 1:2
        re_tr(i,:,j) = inpdat(inc,:);
        re_tr1(i,:,j) = inpdat_tst(inc,:);
        tar1(i,j) = train_tar(inc,1);
        inc = inc+1;
    end
end

cnn = ecnnsetup(cnn, re_tr, tar1);
cnn = ecnntrain(cnn, re_tr, tar1, opts); % cnn training

% cnn testing
out = ecnntest(cnn, re_tr1, tst_tar); % cnn testing