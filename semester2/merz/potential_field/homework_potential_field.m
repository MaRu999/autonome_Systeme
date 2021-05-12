% script for second homework in autonomous systems perception, part merz
% potential field method
% set parameters
k_att = 0.02;
k_rep = 0.05;
roh_min = 1 * 20;
middle_obs1 = [6;4] * 20;
radius_obs1 = 1 * 20;
midlle_obs2 = [7;8] * 20;
radius_obs2 = 0.5 * 20;
middle_obs3 = [3; 2.2] * 20;
radius_obs3 = 0.5 * 20;
obstacle_mids = [middle_obs1, midlle_obs2, middle_obs3];
obstacle_radii = [radius_obs1, radius_obs2, radius_obs3];
start_p = [2;1] * 20;
goal_p = [9;9] * 20;
u_atts = zeros(200,200);
for i=1:200
    for j=1:200
        u_atts(i,j) = u_att(k_att, goal_p, [i;j]);
    end
end
figure();
mesh((1:200)/20, (1:200)/20, u_atts/20);
xlabel("x");
ylabel("y");
zlabel("z");
axis("ij");

u_reps = zeros(200,200);
for j=1:200
    for i=1:200
        u_reps(i,j) = 0;
        for k=1:max(size(obstacle_mids))
            u_reps(i,j) = u_reps(i,j) + u_rep(k_rep, roh_min, [i;j], obstacle_mids(:,k), obstacle_radii(k));
        end
    end
end
figure();
mesh((1:200)/20, (1:200)/20, u_reps/20);
xlabel("x");
ylabel("y");
zlabel("z");
axis("ij");
hold on;
vec_x = [6, 6];
vec_y = [4, 4];
vec_z = [0, 0.25];
plot3(vec_x, vec_y, vec_z);
vec_x = [7, 7];
vec_y = [8, 8];
vec_z = [0, 0.25];
plot3(vec_x, vec_y, vec_z);
vec_x = [3, 3];
vec_y = [2.2, 2.2];
vec_z = [0, 0.25];
plot3(vec_x, vec_y, vec_z);
hold off;