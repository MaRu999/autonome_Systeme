% test test
h1 = [6; 4];
r1 = 1;
h2 = [7; 8];
r2 = 0.5;
h3 = [3; 2.2];
r3 = 0.5;
k_rep = 0.05;
k_att = 0.02;
roh_min = 1;
p_start = [2; 1];
p_goal = [9; 9];
field_num = 10;
step_size = 0.05;
radii = [r1, r2, r3];
mids = [h1, h2, h3];
ps_vec = [p_start];
robot_pos = p_start;

while 1
    cur_pos = robot_pos;
    robot_pos = robot_pos + (force_attract(k_att, cur_pos, p_goal) +  force_repel(k_rep, cur_pos, mids, radii, roh_min))
    ps_vec = [ps_vec, robot_pos];
    g = g + 1;
    if abs(robot_pos - p_goal) <= [10^-10;10^-10];
        break;
    end
end
figure();
plot(ps_vec(1,:), ps_vec(2,:));
xlabel("x");
ylabel("y");
hold on;
circle(h1(1),h1(2), r1);
circle(h2(1), h2(2), r2);
circle(h3(1), h3(2), r3);

hold off;
