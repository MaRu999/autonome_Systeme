function pos = markov_loc(cell_num, map, move_model, measurement_model, measurements, step_num)
    pos = ones(1,cell_num) * (1/cell_num);
    % steps
    for i=1:step_num
        % move robot
        temp_pos = zeros(1, cell_num);
        for k=1:cell_num
            for m=1:max(size(move_model))
                temp_pos(k) = temp_pos(k) + pos(ring_buff(k-move_model(1,m),cell_num)) * move_model(2,m);
            end
        end
        pos = temp_pos;
        % do posterior
        posterior = zeros(1, cell_num);
        for n=1:cell_num
            posterior(n) = measurement_model(measurements(i),n) * pos(n);
        end
        nu = 1/sum(posterior);
        posterior = posterior * nu;
        pos = posterior;
    end