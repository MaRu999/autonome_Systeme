L1 = [1;1];
L2 = [10;3];
L3 = [7;5];
r1 = 5;
r2 = 5.0990;
r3 = 2.2361;
p = lateration(L1,L2,L3,r1,r2,r3);
disp("Robot point: "), disp(p);