function u_att = attracting_field(k_att, p_goal, p_robot)
    u_att = (1/2) * k_att * norm(p_robot - p_goal)^2;