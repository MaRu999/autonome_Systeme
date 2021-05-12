function force_vector = repelling_force(robot_pos, obstacle_mid, obstacle_rad, min_roh, k_rep)
    dist = norm(robot_pos - obstacle_mid) - obstacle_rad;
    if dist >= min_roh
        force_vector = zeros(2,1);
    else
        force_vector = k_rep * ((1/dist) - (1/min_roh)) * ((robot_pos - obstacle_mid)/dist^3);
    end