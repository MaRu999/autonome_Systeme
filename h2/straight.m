pkg load geometry;
pkg load matgeom;

1;
delta_s = 0.2;
delta_angle = 0;
d = 0.2;
k_r = 0.001;
k_l = k_r;
covariance_start = zeros(3,3);

start = [
0;
0;
0
]

figure();
hold on
plot(start(1,1), start(2,1), 'r+');

[start, covariance_start] = Draw_Loop(start, delta_s, delta_angle, d, k_r, k_l, covariance_start, 20);
hold off