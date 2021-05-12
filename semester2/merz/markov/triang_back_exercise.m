a = [7.5; 7.5];
m = [2.5; 2.5];
b = [0; 0];
alpha_p = 70;
beta_p = 45;
robot_pos = triangulation_backwardscut(a, m, b, deg2rad(alpha_p), deg2rad(beta_p));
disp("Robot position: "), disp(robot_pos);