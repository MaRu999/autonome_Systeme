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

figure();
plot(start);

hold on;

res1 = Calc_new_pose(start, delta_s, delta_angle);
covar1 = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covariance_start);

plot(res1);
elli1 = cov2ellipse(covar1);
drawEllipse(elli1, 'linewidth', 2);

res2 = Calc_new_pose(res1, delta_s, delta_angle);
covar2 = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covar1);

plot(res2);
elli2 = cov2ellipse(covar2);
drawEllipse(elli2, 'linewidth', 2);

res3 = Calc_new_pose(res2, delta_s, delta_angle);
covar3 = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covar2);

plot(res3);
elli3 = cov2ellipse(covar3);
drawEllipse(elli3, 'linewidth', 2);

res4 = Calc_new_pose(res3, delta_s, delta_angle);
covar4 = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covar3);

plot(res4);
elli4 = cov2ellipse(covar4);
drawEllipse(elli4, 'linewidth', 2);

hold off;

% lambdas -> get out of 1/sqrt(det) * e blublub = 0