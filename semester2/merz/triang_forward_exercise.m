a = [0;0];
b = [8;4];
rpa = 180;
rpb = 90;
[pos1, pos2] = triangulation_forwardscut(a, b, deg2rad(rpa), deg2rad(rpb));
disp("Robot position (first variant): "), disp(pos1);
disp("Robot position (second variant): "), disp(pos2);