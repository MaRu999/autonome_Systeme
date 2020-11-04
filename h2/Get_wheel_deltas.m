% function for calculating the deltas for the wheels, meaning the distance the left and right wheel travel in the step
% input paramters:
% delta_s = distance traveled in the step
% d = wheel distance
% delta_angle = difference in angle (rotation for this step)
% return values:
% delta_sr = distance travelled in the step for the right wheel
% delta_sl = distance travelled in the step for the left wheel
function [delta_sr, delta_sl] = Get_wheel_deltas(delta_s, d, delta_angle)
    % calculation based on skriptum, page 51
    % distance travelled in step for right wheel is (2 times total distance travelled in step + wheel distance * rotation divided) by 2
    delta_sr = ((2*delta_s) + (d * delta_angle))/2;
    % distance travelled in step for left wheel is 2 times total distance travelled - distance travelled for right wheel
    delta_sl = (2*delta_s) - delta_sr;
