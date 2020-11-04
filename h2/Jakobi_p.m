% function for calculating the Jakobi matrix of the pose, based on skriptum, page 52
% input parameters:
% delta_s = distance travelled in step
% delta_angle = difference in angle for step (meaning rotation)
% angle = current angle of the robot
% return values:
% jakobi = the calculated Jakobi matrix for the pose
function jakobi = Jakobi_p(delta_s, delta_angle, angle)
    % variable for holding result of expression so it does not need to be typed every time
    % variable is current angle of robot + difference in angle (rotation of robot for step)/2
    val = angle + (delta_angle/2);
    jakobi = [
    % 1, 0, -distance travelled for step * sinus of val
    1, 0, (-delta_s * sin(val));
    % 0, 1, distance travelled for step * cosinus of val
    0, 1, (delta_s * cos(val));
    0, 0, 1
    ];