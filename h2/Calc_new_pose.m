% function for calculating the robot's new pose
% input parameters:
% old_pose = the current pose of the robot
% delta_s = the distance the robot travels
% delta_angle = the angle at which the robot travels
% return values:
% new_pose = the new pose of the robot
function new_pose = Calc_new_pose(old_pose, delta_s, delta_angle)
    % this variable is only here to make the code more readable and to
    % not have to write the whole expressions every time
    % value is the value at index three of the current pose (meaning the angle) + the difference in angle divided by two
    val = old_pose(3) + (delta_angle/2);
    % change vector, same as from the skriptum, page 51f
    change_vector = [
    % step size multiplied with cosinus of val
    delta_s * cos(val);
    % step size multiplied with sinus of val
    delta_s * sin(val);
    % difference in angle
    delta_angle;
    ]
    % add the change vector to the old pose
    new_pose = old_pose + change_vector;