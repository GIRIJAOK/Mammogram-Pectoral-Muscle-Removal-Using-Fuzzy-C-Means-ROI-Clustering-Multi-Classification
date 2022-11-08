function out = subsample(in, ratio)
switch ratio
    case 4
        out = 0;
        for k=1:4
            for l=1:4
                out = out+in(1+(k-1):4:size(in,1),1+(l-1):4:size(in,2));
            end
        end
        out = out/16;
    case 2
        out = (in(1:2:size(in,1),1:2:size(in,2)) + in(1:2:size(in,1),2:2:size(in,2))...
            +in(2:2:size(in,1),1:2:size(in,2)) + in(2:2:size(in,1),2:2:size(in,2)))./4;
    case 1
        out = in;
    otherwise disp('Unsupported ratio');
end
end