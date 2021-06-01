function f_r = force_repel(k_rep, robot_pos, obstacles, radii, roh_min)
    f_r = 0;
    for i=1:3
        mid_pos = obstacles(:,i);
        radius = radii(i);
        dir_vec = (robot_pos - mid_pos)/norm(robot_pos - mid_pos);
        dist = norm(robot_pos - mid_pos) - radius;
        obs_p = robot_pos + dir_vec * dist;
        if dist >= roh_min
            f_r = f_r + 0;
        else
            f_r = f_r + (k_rep * ((1/dist) - (1/roh_min)) * ((robot_pos - mid_pos)/(dist^3)));
        end
    end