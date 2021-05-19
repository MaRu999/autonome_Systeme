% script for second homework in autonomous systems perception, part merz
% potential field method
% set parameters
k_att = 0.02;
k_rep = 0.05;
octave_offset = 0;
scaling_factor = 1;
roh_min = 1 * scaling_factor;
middle_obs1 = ([6;4] + octave_offset) * scaling_factor;
radius_obs1 = 1 * scaling_factor;
midlle_obs2 = ([7;8] + octave_offset) * scaling_factor;
radius_obs2 = 0.5 * scaling_factor;
middle_obs3 = ([3; 2.2] + octave_offset) * scaling_factor;
radius_obs3 = 0.5 * scaling_factor;
obstacle_mids = [middle_obs1, midlle_obs2, middle_obs3];
obstacle_radii = [radius_obs1, radius_obs2, radius_obs3];
start_p = ([2;1] + octave_offset) * scaling_factor;
goal_p = ([9;9] + octave_offset) * scaling_factor;
robot_pos = start_p
ps_vec = [start_p];
g = 1;
while 1
    robot_pos = force_at_point(robot_pos, k_att, k_rep, roh_min, obstacle_mids, obstacle_radii, goal_p)
    ps_vec = [ps_vec, robot_pos];
    g = g + 1;
    if abs(robot_pos - goal_p) <= [10^-10;10^-10];
        break;
    end
end
figure();
plot(ps_vec(1,:), ps_vec(2,:));
xlabel("x");
ylabel("y");
