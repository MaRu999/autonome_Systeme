function [start, covariance_start] = Draw_Loop(start, delta_s, delta_angle, d, k_r, k_l, covariance_start, num_loops)
    for i=1:num_loops
        angle = start(3);
        res = Calc_new_pose(start, delta_s, delta_angle);
        covar = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covariance_start);
        covar_ell = covar(1:2,1:2);
        elli = cov2ellipse(covar_ell);
        elli(1,1) = res(1,1);
        elli(1,2) = res(2,1);
        plot(res(1,:), res(2,:), 'r+');
        drawEllipse(elli);
        start = res;
        covariance_start = covar;
    end