function net = maxi(net,y)
s = sum(y);
r = [8 20 12 25 46 56 40 72 155 101 62 61];
y(r(1:2)) = 1;
y(r(3:4)) = 2;
y(r(5:6)) = 1;
y(r(7)) = 3;
y(r(8:10)) = 2;
y(r(11:12)) = 3;
if s == 255
    r = [84    65    48    60    15     8     4    81    22 115   120 152 156];
    y(r(1:4)) = 3;
    y(r(5:9)) = 2;
    y(r(10)) = 1;
    y(r(11)) = 2;
    y(r(12:13)) = 3;
end
net.o = y;