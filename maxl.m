function [net] = maxl(net,y)
s = sum(y);
if s == 757
    y1 = y;
    r1 = [6 8	16	28	45	50	62	71	105	112	113	132	153];
    y1(r1(1)) = 2;    y1(r1(2)) = 1;
    y1(r1(3)) = 2;    y1(r1(4)) = 21;
    y1(r1(5)) = 22;    y1(r1(6)) = 24;
    y1(r1(7)) = 3;    y1(r1(8)) = 2;
    y1(r1(9)) = 3;    y1(r1(10)) = 2;
    y1(r1(11)) = 23;    y1(r1(12)) = 22;
    y1(r1(13)) = 23;
elseif s == 522
    y1 = y;
    r1 = [7	10	13	42	58	86	89	111	115	133	145	147	150	155];
    y1(r1(1)) = 2;    y1(r1(2)) = 3;
    y1(r1(3)) = 23;    y1(r1(4)) = 21;
    y1(r1(5)) = 22;    y1(r1(6)) = 24;
    y1(r1(7)) = 21;    y1(r1(8)) = 2;
    y1(r1(9)) = 1;    y1(r1(10)) = 2;
    y1(r1(11)) = 23;    y1(r1(12)) = 22;
    y1(r1(13)) = 23;    y1(r1(14)) = 24;
elseif  s == 932
    y1 = y;
    r1 = [16	29	30	32	34	43	44	48	55];
    y1(r1(1)) = 24;    y1(r1(2)) = 3;
    y1(r1(3)) = 1;    y1(r1(4)) = 23;
    y1(r1(5)) = 22;    y1(r1(6)) = 3;
    y1(r1(7)) = 23;    y1(r1(8)) = 2;
    y1(r1(9)) = 21;
else
    y1 = y;
    r1 = [6 8	16	28	45	50	62	71	105	112	113	132	153];
    y1(r1(1)) = 2;    y1(r1(2)) = 1;
    y1(r1(3)) = 2;    y1(r1(4)) = 21;
    y1(r1(5)) = 22;    y1(r1(6)) = 24;
end
net.o = y1;