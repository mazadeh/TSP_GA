%%% This function selects pairs of input permutations and recombine them in
%%% pairs.

function new_pers = tsp_ga_recombination(pers)
    input_size = size(pers);
    % disp(input_size);
    new_pers = pers;
    order(input_size(1)+1) = 0;
    order = randperm(input_size(1));
    order(input_size(1)+1) = order(1);
    % disp(order);
    for i = 1 : input_size(1)
        new_pers(i, :) = recombination(pers(order(i),:), pers(order(i+1),:));
    end
end


%% Recombination
%%% This function takes two permutations A and B as input and find the path
%%% of A(1) to A(2) in the B and puts this way in the output.
%%% Then puts the rest of path A in output such that if a city in A(3)~A(n)
%%% is visited befor, it will not be in the output.

function new_per = recombination(per1, per2)
    len = length(per2);
    % disp(per1);
    % disp(per2);
    s = find(per1==per2(1));
    d = find(per1==per2(2));
    % disp(s);
    % disp(d);
    if (s < d)
        new_per(1:d-s+1)=per1(s:d);
    else
        new_per(1:len-s+1)=per1(s:len);
        % disp(new_per);
        % disp(len-s+2);
        % disp(per1(1:d));
        new_per(len-s+2:len-s+d+1)=per1(1:d);
    end
    % disp(new_per);
    
    tmp_per = per2(3:len);
    % disp(tmp_per);
    repetitives = ismember(tmp_per, new_per);
    % disp(repetitives);
    
    index = length(new_per)+1;
    for i = 1 : length(tmp_per)
        if (~repetitives(i))
            new_per(index) = tmp_per(i);
            index = index + 1;
        end
    end
    % disp(new_per);
end