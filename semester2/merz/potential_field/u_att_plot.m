function attracting_u = u_att_plot(robot_pos)
    k_att = 0.02;
    pos_goal = [9;9] * 20;
    attracting_u = 0.5 * k_att * norm(robot_pos - pos_goal);