function covar = Covariance_drive(k_r, delta_sr, k_l, delta_sl)
    covar = [
    k_r * norm(delta_sr) 0;
    0 k_l * norm(delta_sl)
    ];