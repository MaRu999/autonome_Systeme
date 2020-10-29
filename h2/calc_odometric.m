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

plot(res1(1,:), res1(2,:), 'ro');
elli1 = cov2ellipse(covar1);
elli1(1,1) = res1(1,1);
elli1(1,2) = res1(2,1);
drawEllipse(elli1);

res2 = Calc_new_pose(res1, delta_s, delta_angle);
covar2 = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covar1);

plot(res2(1,:), res2(2,:), 'ro');
elli2 = cov2ellipse(covar2);
elli2(1,1) = res2(1,1);
elli2(1,2) = res2(2,1);
drawEllipse(elli2);

res3 = Calc_new_pose(res2, delta_s, delta_angle);
covar3 = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covar2);

plot(res3(1,:), res3(2,:), 'ro');
elli3 = cov2ellipse(covar3);
elli3(1,1) = res3(1,1);
elli3(1,2) = res3(2,1);
drawEllipse(elli3);

res4 = Calc_new_pose(res3, delta_s, delta_angle);
covar4 = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covar3);

plot(res4(1,:), res4(2,:), 'ro');
elli4 = cov2ellipse(covar4);
elli4(1,1) = res4(1,1);
elli4(1,2) = res4(2,1);
drawEllipse(elli4);

res5 = Calc_new_pose(res4, delta_s, delta_angle);
covar5 = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covar4);

plot(res5(1,:), res5(2,:), 'ro');
elli1 = cov2ellipse(covar5);
elli5(1,1) = res5(1,1);
elli5(1,2) = res5(2,1);
drawEllipse(elli5);

res6 = Calc_new_pose(res5, delta_s, delta_angle);
covar6 = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covar5);

plot(res6(1,:), res6(2,:), 'ro');
elli6 = cov2ellipse(covar6);
elli6(1,1) = res6(1,1);
elli6(1,2) = res6(2,1);
drawEllipse(elli6);

res7 = Calc_new_pose(res6, delta_s, delta_angle);
covar7 = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covar6);

plot(res7(1,:), res7(2,:), 'ro');
elli7 = cov2ellipse(covar7);
elli7(1,1) = res7(1,1);
elli7(1,2) = res7(2,1);
drawEllipse(elli7);


% lambdas -> get out of 1/sqrt(det) * e blublub = 0