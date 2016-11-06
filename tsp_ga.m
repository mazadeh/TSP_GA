function tsp_ga()
    clc;
    clear;
    data = csvread('Data.csv');
    count = length(data);

    population_size = 200;
    iterations = 5000;
    show_iterations = true;
    show_iteration_every = 100;

    text_x = max(data(:,1)) * 0.15;
    text_y1 = max(data(:,2)) * 0.2;
    text_y2 = max(data(:,2)) * 0.25;
    text_y3 = max(data(:,2)) * 0.3;
    
    %% Initianl population
    initial_population = zeros(population_size, count);
    for i = 1: population_size
        initial_population(i,:) = randperm(count);
    end
    
    fitnesses(population_size) = 0;
    population = initial_population;
    
    %% Evolving loop
    for round = 1 : iterations
        %% Fitness calculation
        for i = 1: population_size
            fitnesses(i) = tsp_ga_fitness(data, population(i,:));
        end
        % disp(fitnesses);

        %% Parents Selection
        [selected, old_fittest] = tsp_ga_selection(population_size/2, population, fitnesses);
        % disp(selected);
        
        old_population = [];
        for i = length(selected) : -1 : 1
            old_population(i,:) = population(selected(i),:);
            old_fitnesses(i) = fitnesses(selected(i));
        end
        % disp(old_fitnesses);
        
        %% Recombination and Mutation
        new_population = tsp_ga_recombination(old_population);
        for i = 1 : size(new_population, 1)
            new_population(i,:) = tsp_ga_mutation(new_population(i,:));
        end
        
        %% %% Fitness calculation
        new_fitnesses = fitnesses(1:population_size/2);
        for i = 1 : population_size/2
            new_fitnesses(i) = tsp_ga_fitness(data, new_population(i,:));
        end
        % disp(new_fitnesses);
        
        all_population = [old_population; new_population];
        all_fitnesses  = [old_fitnesses, new_fitnesses];
        % disp(all_fitnesses);
        
        %% Natural Selection
        [next_generation, new_fittest] = tsp_ga_selection(population_size, all_population, all_fitnesses);
        % disp(size(population));
        % disp(size(old_population));
        % disp(size(new_population));
        % disp(size(all_population));
        % disp(size(next_generation));
        for i = 1 : population_size
            population(i,:) = all_population(next_generation(i), :);
        end
        
        %% Display the generation
        if show_iterations == true && rem(round, show_iteration_every)==1
            clf;
            tsp_ga_display(data, new_population(new_fittest,:), 'r');
            tsp_ga_display(data, old_population(old_fittest,:), 'b');
            text(text_x, text_y1, num2str(old_fitnesses(old_fittest)));
            text(text_x, text_y2, num2str(new_fitnesses(new_fittest)));
            text(text_x, text_y3, num2str(round));
            drawnow;
        end
    end
    % disp(all_fitnesses);
    clf;
    tsp_ga_display(data, old_population(old_fittest,:), 'b');
    text(text_x, text_y1, num2str(old_fitnesses(old_fittest)));
            text(text_x, text_y3, num2str(round));
    disp(min(all_fitnesses));
end