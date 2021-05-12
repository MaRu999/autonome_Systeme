function repelling_u = u_rep(k_rep, min_roh, robot_pos, obs_mid, obs_r)
    dist_mid = norm(robot_pos - obs_mid);
    dist = dist_mid - obs_r;
    if dist >= min_roh
        repelling_u = 0;
    elseif dist == 0
        repelling_u = 0.2*20;
    else
        repelling_u = min(0.2*20, 0.5 * k_rep * ((1/dist) - (1/min_roh))^2);
    end