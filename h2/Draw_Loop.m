% function for calculating and drawing a given number of steps
% input parameters:
% start = the current pose of the robot
% delta_s = distance to travel in the step
% delta_angle = differnence in angle, how much to rotate in step
% d = wheel distance
% k_r = uncertainty factor for covariance matrix for righ wheel of drive
% k_l = uncertainty factor for covariance matrix for left wheel of drive
% covariance_start = the current covariance matrix for the robot
% num_loops = the number of steps to perform
% return values:
% start = the new pose of the robot
% covariance_start = the new covariance matrix of the robot
function [start, covariance_start] = Draw_Loop(start, delta_s, delta_angle, d, k_r, k_l, covariance_start, num_loops)
    % iteration over the wanted number of steps
    for i=1:num_loops
        % get the current angle of the robot
        angle = start(3);
        % calculate the next pose
        res = Calc_new_pose(start, delta_s, delta_angle);
        % calcualte the next covariance matrix
        covar = Calc_next_covar(delta_s, delta_angle, angle, d, k_r, k_l, covariance_start);
        % get the part of the covariance matrix neede to draw the ellipse
        covar_ell = covar(1:2,1:2);
        % convert the extracted part pf the covariance matrix to an ellipse
        elli = cov2ellipse(covar_ell);
        % move the x value of the ellipse to the x value of the pose
        elli(1,1) = res(1,1);
        % move the y value of the ellipse to the y value of the pose
        elli(1,2) = res(2,1);
        % plot the calculated pose
        plot(res(1,:), res(2,:), 'r+');
        % draw the ellipse
        drawEllipse(elli);
        % set start to calculated new pose
        start = res;
        % set covariance to calculated new covariance matrix
        covariance_start = covar;
    end