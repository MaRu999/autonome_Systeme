pkg load geometry;
pkg load matgeom;
% script for task 8

% distance to travel in step
delta_s = 0.15;
% angle for most steps
delta_angle = 0;
% wheel distance
d = 0.2;
% uncertainty factor for covariance matrix for righ wheel of drive
k_r = 0.001;
% uncertainty factor for covariance matrix for left wheel of drive (same as right wheel in this example)
k_l = k_r;
% starting covariance matrix of 3x3 filled with zeros
covariance_start = zeros(3,3);
% starting pose of robot at x = 0, y = 0, theta = 60 degrees
start = [
0;
0;
% since we are using cos and sin, we need rads, so transform from degree to rad
deg2rad(60)
]

% open new figure window
figure();
% hold figure window (keep drawing in same window)
hold on
% plot the starting point (no uncertainty, so no ellipse needed)
plot(start(1,1), start(2,1), 'r+');
% set label for x axis
xlabel("x");
% set label for y axis
ylabel("y");
% take the first five steps with the values set above
[start, covariance_start] = Draw_Loop(start, delta_s, delta_angle, d, k_r, k_l, covariance_start, 5);
% take one step that travels no distance, but rotates the robot by pi/2
[start, covariance_start] = Draw_Loop(start, 0, pi/2, d, k_r, k_l, covariance_start, 1);
% take five more steps with values set at the beginning of the script
[start, covariance_start] = Draw_Loop(start, delta_s, delta_angle, d, k_r, k_l, covariance_start, 5);
% print image to file
%print -dpng -r300 task8.png;
% stop holding figure
hold off