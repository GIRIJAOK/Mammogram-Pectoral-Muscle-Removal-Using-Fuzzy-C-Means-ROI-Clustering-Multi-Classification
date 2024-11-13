function [out] = AHFCM(data,nband,Tr1,Tr2)


data = double(data);
for k = 1:nband
    data1(:,k) = reshape(data(:,:,k),[],1);
end

n = hist(data1,0:255);
for g1 = 1:nband
    for g2 = 1:256
        
        if g2==1
            m((g2),g1) = (n(g2,g1)-0);
        else
            m(g2,g1) = (n(g2,g1)-n((g2-1),g1));
        end
    end
end
for gg1 = 1:nband
    for gg2 = 1:256
        
        if  gg2==256
            m1(gg2,gg1) = (0-n(gg2,gg1));
        else
            m1(gg2,gg1) = (n(gg2,gg1)-n((gg2+1),gg1));
        end
    end
end

% here we have some rules to determine the initial cluster center and
% number of clusters according to histogram for each band data
m1 = -m1;
mm = m.*m1;
r = zeros(size(n));
for t1 = 1:nband
    for t2 = 1:256
        if mm(t2,t1) > 0
            r(t2,t1) = nan;
            
        elseif mm(t2,t1) < 0
            if m(t2,t1) < 0
                r(t2,t1) = nan;
            end
        elseif mm(t2,t1)==0
            if m(t2,t1)==0 && m1(t2,t1)==0
                r(t2,t1) = nan;
            elseif m(t2,t1) < 0 || m1(t2,t1) < 0
                r(t2,t1) = nan;
            end
        end
        
        if t2>=2 && r(t2,t1)==0
            t3 = find(r(1:(t2-1),t1)==0);
            [st1,st2] = size(t3);
            if st1 >= 1
                if  t3(st1,st2) >= 1
                    if  (t2-t3(st1,st2))<Tr1
                        r(t2,t1) = nan;
                        r(t3(st1,st2),t1) = nan;
                        r((round((t2+t3(st1,st2))/2)),t1) = 0;
                    end
                end
            end
            t3 = [];st1 = [];st2 = [];
        end
    end
    
end

% clustering for each band according to previous finding center and number
% of cluster algorithm
for c1 = 1:nband
    [r11,c11,v11] = find(r(:,c1)==0);
    incenter = r11(:,1)-1;
    n_cluster1 = size(r11(:,1));
    n_cluster = n_cluster1(1,1);
    [cente,member] = fcm(data1(:,c1),n_cluster,[2 10 1e-5 0]);
    [ssc1,ssc2] = size(cente);
    for fcs1 = 1:ssc1
        center(fcs1,c1) = cente(fcs1,1);
    end
    centerz = (center(:,c1)~=0);
    [cen,cidx] = sort(center((centerz==1),c1));
    member = member';
    member = member(:,cidx);
    [maxmember,label(:,c1)] = max(member,[],2);
    cidx = []; maxmember = []; member = []; cen = []; centerz = [];
end
[nrow,ncols] = size(data(:,:,1));
for kkk = 1:nband
    ps(:,:,kkk) = reshape(label(:,kkk),nrow,ncols);    
end
out = data;