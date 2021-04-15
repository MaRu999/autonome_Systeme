function pos = markov_locv2(cell_num, map, move_model, measurement_model, measurements, step_num, min_p)
    figures = {'prior1', 'prior2', 'prior3', 'prior4', 'prior5', 'posterior1', 'posterior2', 'posterior3', 'posterior4', 'posterior5'};
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
        figure();
        bar(pos);
        xlabel("Cell")
        ylabel("probability");
        print("-dpng","-color",figures{i});
        % do posterior
        posterior = zeros(1, cell_num);
        for n=1:cell_num
            posterior(n) = measurement_model(ring_buff(n+measurements(i),cell_num)) * pos(n);
        end
        posterior(posterior==0) = min_p;
        nu = 1/sum(posterior);
        posterior = posterior * nu;
        pos = posterior;
        figure();
        bar(pos);
        xlabel("Cell")
        ylabel("probability");
        print("-dpng","-color",figures{i+5});
    end