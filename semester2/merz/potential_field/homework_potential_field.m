% script for second homework in autonomous systems perception, part merz
% potential field method
% set parameters
k_att = 0.02;
k_rep = 0.05;
octave_offset = 0;
field_num = 200;
scaling_factor = 20;
roh_min = 1 * 20;
middle_obs1 = ([6;4] + octave_offset) * scaling_factor;
radius_obs1 = 1 * scaling_factor;
midlle_obs2 = ([7;8] + octave_offset) * scaling_factor;
radius_obs2 = 0.5 * 20;
middle_obs3 = ([3; 2.2] + octave_offset) * scaling_factor;
radius_obs3 = 0.5 * scaling_factor;
obstacle_mids = [middle_obs1, midlle_obs2, middle_obs3];
obstacle_radii = [radius_obs1, radius_obs2, radius_obs3];
start_p = ([2;1] + octave_offset) * scaling_factor;
goal_p = ([9;9] + octave_offset) * scaling_factor;
u_atts = zeros(field_num,field_num);
for i=1:field_num
    for j=1:field_num
        u_atts(i,j) = u_att(k_att, goal_p, [i;j]);
    end
end
figure();
mesh((1:field_num)/scaling_factor, (1:field_num)/scaling_factor, u_atts/scaling_factor);
xlabel("x");
ylabel("y");
zlabel("z");
axis("ij");

u_reps = zeros(field_num,field_num);
for j=1:field_num
    for i=1:field_num
        u_reps(i,j) = 0;
        for k=1:max(size(obstacle_mids))
            u_reps(i,j) = u_reps(i,j) + u_rep(k_rep, roh_min, [i;j], obstacle_mids(:,k), obstacle_radii(k));
        end
    end
end
figure();
mesh((1:field_num)/scaling_factor, (1:field_num)/scaling_factor, u_reps/scaling_factor);
xlabel("x");
ylabel("y");
zlabel("z");
hold on;
vec_x = ([6, 6] + octave_offset);
vec_y = ([4, 4] + octave_offset);
vec_z = [0, 0.25];
plot3(vec_x, vec_y, vec_z);
vec_x = ([7, 7] + octave_offset);
vec_y = ([8, 8] + octave_offset);
vec_z = [0, 0.25];
plot3(vec_x, vec_y, vec_z);
vec_x = ([3, 3] + octave_offset);
vec_y = ([2.2, 2.2] + octave_offset);
vec_z = [0, 0.25];
plot3(vec_x, vec_y, vec_z);
hold off;
axis("ij");