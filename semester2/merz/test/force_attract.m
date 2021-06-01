function f_a = force_attract(k_att, robot_pos, goal_pos)
    f_a = -k_att * (robot_pos - goal_pos);