function fitness = tsp_ga_fitness (data, per)
    fitness = 0;
    count = length(data);
    % disp(size(per));
    for i = 1 : count
        s = data(per(i), :);
        if (i < count)
            d = data(per(i+1), :);
        else
            d = data(per(1), :);
        end
        % disp(s);
        % disp(d);
        % Euclidean distance
        distance = sqrt((d(1)-s(1))^2 + (d(2)-s(2))^2);
        fitness = fitness + distance;
    end
end