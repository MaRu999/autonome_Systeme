function next_covar = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covar_p)
    [delta_sr, delta_sl] = Get_wheel_deltas(delta_s, d, delta_angle);
    jakobi_p = Jakobi_p(delta_s, delta_angle, angle);
    jakobi_s = Jakobi_s(delta_s, delta_angle, angle, d);
    covar_s = Covariance_drive(k_r, delta_sr, k_l, delta_sl);
    next_covar = Covar_next(jakobi_p, covar_p, jakobi_s, covar_s);