# TSP_GA
Applying a genetic algorithm to the traveling salesman problem.

# TSP
The travelling salesman problem (TSP) asks the following question:
 * Given a list of cities and the distances between each pair of cities. What is the shortest possible route that visits each city exactly once and returns to the origin city?

# Genetic Algorithm
In a genetic algorithm, a population of candidate solutions to an optimization problem is evolved toward better solutions. Each candidate solution has a set of properties which can be mutated and altered.

# Genetic Algorithm Steps
* Generate initial population
* Do this until population fitness converge:
 * Calculate the population fitness
 * Select parents to Reproduce
 * Recombine parents genotype and cross their genotype over each other
 * Mutate Some children
 * Calculate children population fitness
 * Select the new generation from parent population and children population and replace them to continue

# Running the algorithm
The program has been written in MATLAB language and in order to run the program you just need to run the function "tsp_ga" and other things would be handled automatically.

- The file "Data.csv" contains each city coordinates and to run the algorithm on other database you could just change this file.
- There are some parameters in the function "tsp_ga" which changing them for every run could produce a different answer. Increasing the algorithm iteration limit would results a good answer (not always) but it needs more process and more time.
 * population_size: This is the size of each generation population and after reproduction, using selection algorithem helps to remove supernumerary poputation.
 * iterations: The limit of running algorithm befor it converge.
 * show_iterations: There is a graphical representation available which shows best fined answer of the algorithm. If this variable be true, it would be shown.
 * show_iteration_every: If show_iteration be true, this variable controls the rate of showing answers.
