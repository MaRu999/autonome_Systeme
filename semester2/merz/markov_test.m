cell_num = 20;
map = [2, 4, 7, 11, 17];
map = map +1;
disp(map);
move_model = [0, 1, 2; 0.1, 0.8, 0.1];
measurement_model = ones(2, cell_num) * 0.8;
measurement_model(1,map) = 0.2;
measurement_model(2,:) = 1 - measurement_model(1,:);
measurements = [1, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1];
step_num = 10;
test = markov_loc(cell_num, map, move_model, measurement_model, measurements, step_num)
disp(test);
disp(sum(sum(test)));
