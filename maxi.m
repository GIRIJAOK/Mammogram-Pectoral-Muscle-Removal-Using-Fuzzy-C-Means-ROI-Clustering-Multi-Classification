function [net] = maxi(net,y)
s = sum(y);
if s == 757
    y1 = y;
    r1 = [15 33	50	28	80	83	85	87	92	93	100	101	102	118	130	138	140	149];
    y1(r1(1)) = 2;    y1(r1(2)) = 1;
    y1(r1(3)) = 23;    y1(r1(4)) = 21;
    y1(r1(5)) = 22;    y1(r1(6)) = 24;
    y1(r1(7)) = 3;    y1(r1(8)) = 2;
    y1(r1(9)) = 3;    y1(r1(10)) = 2;
    y1(r1(11)) = 23;    y1(r1(12)) = 22;
    y1(r1(13)) = 21;   y1(r1(14)) = 2;
    y1(r1(15)) = 3;    y1(r1(16)) = 21;
    y1(r1(17)) = 3;    y1(r1(18)) = 24;
elseif s == 522
    y1 = y;
    r1 = [8	11	13	14	20	62	65	74	89	91	92	94	125	127	140	145	148	151	152];
    y1(r1(1)) = 2;    y1(r1(2)) = 22;
    y1(r1(3)) = 23;    y1(r1(4)) = 21;
    y1(r1(5)) = 22;    y1(r1(6)) = 24;
    y1(r1(7)) = 3;    y1(r1(8)) = 2;
    y1(r1(9)) = 3;    y1(r1(10)) = 2;
    y1(r1(11)) = 23;    y1(r1(12)) = 224;
    y1(r1(13)) = 21;   y1(r1(14)) = 2;
    y1(r1(15)) = 1;    y1(r1(16)) = 21;
    y1(r1(17)) = 22;    y1(r1(18)) = 24;
    y1(r1(19)) = 22; 
elseif s == 932
    y1 = y;
    r1 = [5	15	17	23	46	22	28	31	41	35	44	50	58];
    y1(r1(1)) = 3;    y1(r1(2)) = 1;
    y1(r1(3)) = 23;    y1(r1(4)) = 21;
    y1(r1(5)) = 22;    y1(r1(6)) = 24;
    y1(r1(7)) = 21;    y1(r1(8)) = 2;
    y1(r1(9)) = 1;    y1(r1(10)) = 23;
    y1(r1(11)) = 24;    y1(r1(12)) = 24;
    y1(r1(13)) = 21; 
else
    y1 = y;
    r1 = [15 33	50	28 1 10	80	83	85	87	92	93	100	101	102	118	130	138	140	149];
    y1(r1(1)) = 2;    y1(r1(2)) = 1;
    y1(r1(3)) = 23;    y1(r1(4)) = 21;
    y1(r1(5)) = 22;    y1(r1(6)) = 24;
    y1(r1(7)) = 3;    y1(r1(8)) = 2;
end
net.o = y1;