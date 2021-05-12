function force_vector = attracting_force(k_att, robot_pos, goal_pos)
    force_vector = -k_att * (robot_pos - goal_pos);