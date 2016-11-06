function tsp_ga_display(data, per, color)
    hold on;
    for i = 1 : length(per)
        s = per(i);
        if (i < length(per))
            d = per(i+1);
        else
            d = per(1);
        end
        line([data(s,1), data(d,1)], [data(s,2), data(d,2)], 'Color', color);
    end
end