function mf_feat = multifractalanaly(a)

% calculates nL which is the number of pixels in the ith box of size L
[rows, ~] = size(a);
width = rows;
p = log(width)/log(2);
p = round(p);
max_boxes = power(rows,2)/power(2,2);
nL = double(zeros(max_boxes,p));
for g = (p-1):-1:0
    siz = 2^(p-g);
    sizm1 = siz - 1;
    index = log2(siz);
    count = 0;
    for i = 1:siz:(width-siz+1)
        for j = 1:siz:(width-siz+1)
            count = count + 1;
            sums = sum(sum(a(i:i+sizm1,j:j+sizm1)));
            nL(count,index) = sums;
        end
    end
end

qran = 1;
logl = zeros(p,1);

for l=1:p
    logl(l) = log(power(2,l));
end

% normalized masses
pL = double(zeros(max_boxes,p));

for l = 1:p
    nboxes = power(rows,2)/power(power(2,l),2);
    norm = sum(nL(1:nboxes,l));
    for i = 1:nboxes
        pL(i,l) = nL(i,l)/norm;
    end
end


for l=1:p
    
    count = 0;
    nboxes = power(rows,2)/power(power(2,l),2);
    
    for q = -qran:+0.1:qran
        
        %denominator of muiql
        qsum = 0.0;
        for i=1:nboxes
            if(pL(i,l) ~= 0)
                qsum = qsum + power(pL(i,l),q);
            end
        end
        
        fqnum = 0.0;
        aqnum = 0.0;
        smuiqL = 0.0;
        for i=1:nboxes
            if(pL(i,l) ~= 0)
                muiqL = power(pL(i,l),q)/qsum;
                fqnum = fqnum + (muiqL * log(muiqL));
                aqnum = aqnum + (muiqL * log(pL(i,l)));
                smuiqL = smuiqL + muiqL;
            end
        end
        
        count = count + 1;
        fql(l,count) = fqnum;
        aql(l,count) = aqnum;
        qval(count) = q;
    end    
end

% alpha_q
for i = 1:count
    line = polyfit(logl,aql(:,i),1);
    aq(i) = line(1);
    yfit = polyval(line,logl);
    sse = sum(power(aql(:,i)-yfit,2));
    sst = sum(power(aql(:,i)-mean(aql(:,i)),2));
    ar2(i) = 1-(sse/sst);
end

% f_q
for i = 1:count
    line = polyfit(logl,fql(:,i),1);
    fq(i) = line(1);
    yfit = polyval(line,logl);
    sse = sum(power(fql(:,i)-yfit,2));
    sst = sum(power(fql(:,i)-mean(fql(:,i)),2));
    fr2(i) = 1-(sse/sst);
end
mf_feat = mean(fr2);