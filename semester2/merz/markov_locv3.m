function pos = markov_locv3(cell_num, map, move_model, measurement_model, measurements, step_num, min_p)
    figures = {'prior1v2', 'prior2v2', 'prior3v2', 'prior4v2', 'prior5v2', 'posterior1v2', 'posterior2v2', 'posterior3v2', 'posterior4v2', 'posterior5v2'};
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
        xlim([0 50]);
        ylim([0 1]);
        bar(pos);
        xlabel("Cell")
        ylabel("probability");
        print("-dpng","-color",figures{i});
        % do posterior
        posterior = zeros(1, cell_num);
        for n=1:cell_num
            posterior(n) = measurement_model(n,measurements(i)) * pos(n);
        end
        posterior(posterior==0) = min_p;
        nu = 1/sum(posterior);
        posterior = posterior * nu;
        pos = posterior;
        figure();
        xlim([0 50]);
        ylim([0 1]);
        bar(pos);
        xlabel("Cell")
        ylabel("probability");
        print("-dpng","-color",figures{i+5});
    end