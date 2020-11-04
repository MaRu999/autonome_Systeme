% function for calculating the Jakobi matrix of the drive, based on the skriptum, page 53
% input parameters:
% delta_s = distance travelled in step
% delta_angle = difference in angle for step
% angle = current angle of robot
% d = wheel distance
% return values:
% jakobi = the Jakobi matrix for the drive
function jakobi = Jakobi_s(delta_s, delta_angle, angle, d)
    % variable for holding the calculation
    % variable is current angle * difference in angle/2
    val = angle + (delta_angle/2);
    % variable for holding the calculation
    % variable is distance travelled / 2 * wheel distance
    var = delta_s/(2*d);
    jakobi = [
    % 1/2 * cosinus of val - var * sinus of val, 1/2 * cosinus of val + var * sinus of val
    (0.5*cos(val) - var*sin(val)), (0.5*cos(val) + var*sin(val));
    % 1/2 * sinus of val + var * cosinus of val, 1/2 * sinus of val - var * cosinus of val
    (0.5*sin(val) + var*cos(val)), (0.5*sin(val) - var*cos(val));
    % 1/wheel distance, -1/wheel distance
    (1/d), (-1/d)
    ];