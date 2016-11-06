%%% This function takes fitness of each input permutstion and select K of
%%% them with the minimum fitness.
%%% (Here we're looking for minimum total distance.)

function [selected, fittest] = tsp_ga_selection(selection_size, pers, fitnesses)
    selected(selection_size) = 0;
    MAX = max(fitnesses);
    fittest = 1;
    for i = 1 : selection_size
        [M, I] = min(fitnesses);
        selected(i) = I;
        fitnesses(I) = MAX;
        % disp(M);
        % disp(I);
    end;
end