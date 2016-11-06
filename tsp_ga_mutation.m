%%% This function takes a permutation as input and mirrors a selects part of it.
%%% Unselected parts will remain imtact.

function new_per = tsp_ga_mutation(per)
    len = length(per);
    s = randi([1,len-1]);
    d = randi([s+1,len]);
    % disp(s);
    % disp(d);
    tmp = per(s:d);
    new_per = per;
    new_per(s:d) = tmp(length(tmp):-1:1);
    % disp(per);
    % disp(new_per);
end