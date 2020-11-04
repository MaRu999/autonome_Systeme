pkg load geometry;
pkg load matgeom;

1;
delta_s = 0.15;
delta_angle = 0;
d = 0.2;
k_r = 0.001;
k_l = k_r;
covariance_start = zeros(3,3);

start = [
0;
0;
deg2rad(30)
]

figure();
hold on
plot(start(1,1), start(2,1), 'r+');

[start, covariance_start] = Draw_Loop(start, delta_s, delta_angle, d, k_r, k_l, covariance_start, 5);
[start, covariance_start] = Draw_Loop(start, 0, -pi/2, d, k_r, k_l, covariance_start, 1);
[start, covariance_start] = Draw_Loop(start, delta_s, delta_angle, d, k_r, k_l, covariance_start, 5);

hold off