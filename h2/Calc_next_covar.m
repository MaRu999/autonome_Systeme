% helper function that collects the different Function calls needed for the calculation of the next covariance matrix
% input parameters:
% delta_s = the size of the step the robot takes (the distance it travels)
% delta_angle = difference in angle (how much the robot rotates for this step)
% angle = angle of the robot (third value of the current pose vector)
% d = wheel distance
% k_r = uncertainty factor for covariance matrix for righ wheel of drive
% k_l = uncertainty factor for covariance matrix for left wheel of drive
% covar_p = current covariance matrix
% return values:
% next_covar = the next covariance matrix
function next_covar = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covar_p)
    % calculate the distances the left and right wheel travel for this step
    [delta_sr, delta_sl] = Get_wheel_deltas(delta_s, d, delta_angle);
    % calculate the jakobi matrix p (for the pose)
    jakobi_p = Jakobi_p(delta_s, delta_angle, angle);
    % calculate the jakobi matrix s (for the drive)
    jakobi_s = Jakobi_s(delta_s, delta_angle, angle, d);
    % calculate the covariance matrix for the dive
    covar_s = Covariance_drive(k_r, delta_sr, k_l, delta_sl);
    % calculate the next covariance matrix
    next_covar = Covar_next(jakobi_p, covar_p, jakobi_s, covar_s);