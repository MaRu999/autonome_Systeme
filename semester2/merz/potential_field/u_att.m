function attracting_u = u_att(k_att, pos_goal, robot_pos)
    attracting_u = 0.5 * k_att * norm(robot_pos - pos_goal)^2;