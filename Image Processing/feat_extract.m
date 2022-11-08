function feat = feat_extract(inp)

% apply hough transform
[h_out,theta,rho] = hough(inp);
rm = mean(rho);
if rm == 0
    rm = rand;
end

% apply DCT
dct_out = dct(double(inp));

feat = [mean(mean(h_out)) mean(theta) rm mean(mean(dct_out))];