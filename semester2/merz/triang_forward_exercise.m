a = [0;0];
b = [8;4];
rpa = 180;
rpb = 90;
pos = triangulation_forwardscut(a, b, deg2rad(rpa), deg2rad(rpb));
disp("Robot position: "), disp(pos);