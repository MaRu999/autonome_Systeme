function transformed = Transform_2D(robot_angle, robot_x_pos, robot_y_pos, data_distance, data_angle)
    % creates Transformation matrix and transforms input data with it
    % all angles are assumed to be in degrees!
    t = Trans_matrix(robot_angle, robot_x_pos, robot_y_pos);
    transformed = Perform_transformation(t, data_distance, data_angle);
