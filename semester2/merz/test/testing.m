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
step_size = 0.05;
radii = [r1, r2, r3];
mids = [h1, h2, h3];
u_atts = zeros(200,200);
u_reps = zeros(200,200);
for i=1:200
    for j=1:200
        pos = [i; j]/20;
        u_a = attracting_field(k_att, p_goal, pos);
        u_atts(j,i) = u_a;
    end
end
figure();
mesh((1:200)*step_size, (1:200)*step_size, u_atts);
xlabel("x");
ylabel("y");
zlabel("z");
axis("ij");
% print image to file
print -dpng -r300 u_att.png;

for i=1:200
    for j=1:200
        pos = [i; j]/20;
        u_r = repelling_field(roh_min, k_rep, mids, radii, pos);
        u_reps(j,i) = u_r;
    end
end
figure();
mesh((1:200)*step_size, (1:200)*step_size, min(0.2, u_reps));
xlabel("x");
ylabel("y");
zlabel("z");
axis("ij");
% print image to file
print -dpng -r300 u_rep.png;

u_combi = u_atts + min(0.2, u_reps);
figure();
mesh((1:200)*step_size, (1:200)*step_size, u_combi);
xlabel("x");
ylabel("y");
zlabel("z");
axis("ij");
% print image to file
print -dpng -r300 u_combi.png;
