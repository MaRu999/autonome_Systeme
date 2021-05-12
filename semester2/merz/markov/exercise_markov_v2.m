cell_num = 50;
map = [4, 13, 20, 31, 45];
map = map +1;
move_model = [3, 4, 5, 6, 7; 0.1, 0.2, 0.4, 0.2, 0.1];
measurements = [5, 10, 7, 2, 10];
mm = zeros(1,cell_num);
mm(1,map) = 0.5;
mm(1,map-1) = 0.25;
mm(1,map+1) = 0.25;
min_p = 10^-5;
step_num = 5;
measure_model = zeros(cell_num,cell_num);
for i=1:max(size(map))
    map_val = map(i);
    start_c = 1;
    if i > 1
        start_c = map(i-1);
    end
    for j=start_c:map_val-1
        if map_val - j - 1 > 0
            measure_model(j,map_val - j - 1) = 0.25;
        end
        measure_model(j,map_val - j) = 0.5;
        measure_model(j,map_val - j + 1) = 0.25;
    end
end
distance = 9;
for k=46:50
    if distance - 1 > 0
        measure_model(k,distance - 1) = 0.25;
    end
    measure_model(k,distance) = 0.5;
    measure_model(k,distance + 1) = 0.25;
    distance = distance - 1;
end
test = markov_locv3(cell_num, map, move_model, measure_model, measurements, step_num, min_p);