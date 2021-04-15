cell_num = 50;
map = [4, 13, 20, 31, 45];
map = map +1;
move_model = [3, 4, 5, 6, 7; 0.1, 0.2, 0.4, 0.2, 0.1];
sens_noise = [-1, 0, 1; 0.25, 0.5, 0.25];
measurements = [5, 10, 7, 2, 10];
measurement_model = zeros(cell_num,cell_num);
mm = zeros(1,cell_num);
mm(1,map) = 0.5;
mm(1,map-1) = 0.25;
mm(1,map+1) = 0.25;
measurement_model(map,:) = 0.5;
measurement_model(map-1,:) = 0.25;
measurement_model(map+1,:) = 0.25;
min_p = 10^-5;
step_num = 5;
test = markov_locv2(cell_num, map, move_model, mm, measurements, step_num, min_p);