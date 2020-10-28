function new_pose = Calc_new_pose(old_pose, delta_s, delta_angle)
    val = old_pose(3) + (delta_angle/2);
    change_matrix = [
    delta_s * cos(val);
    delta_s * sin(val);
    delta_angle;
    ]
    new_pose = old_pose + change_matrix;