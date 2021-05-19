function force = force_at_point(pos, k_att, k_rep, roh_min, obstacle_mids, obstacle_radii, goal_pos)
    force = attracting_force(k_att, pos, goal_pos);
    pos = pos + force;
    obs_count = max(size(obstacle_mids));
    for i=1:obs_count
        r_f = repelling_force(pos, obstacle_mids(:,i), obstacle_radii(i), roh_min, k_rep);
        pos = pos + r_f;
        force = force + r_f;
    end