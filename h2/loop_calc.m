pkg load geometry;

1;
angle = 0;
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

Draw_Loop(start, delta_s, delta_angle, angle, d, k_r, k_l, covariance_start, 20);
