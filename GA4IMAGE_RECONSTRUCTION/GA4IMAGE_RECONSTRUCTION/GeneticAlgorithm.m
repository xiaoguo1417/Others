% Written by Dr. Seyedali Mirjalili
% To watch videos on this algorithm, enrol to my courses with 95% discount using the following links: 

% ************************************************************************************************************************************************* 
%  A course on "Optimization Problems and Algorithms: how to understand, formulation, and solve optimization problems": 
%  https://www.udemy.com/optimisation/?couponCode=MATHWORKSREF
% ************************************************************************************************************************************************* 
%  "Introduction to Genetic Algorithms: Theory and Applications" 
%  https://www.udemy.com/geneticalgorithm/?couponCode=MATHWORKSREF
% ************************************************************************************************************************************************* 

function [BestChrom]  = GeneticAlgorithm (M , N, MaxGen , Pc, Pm , Er , obj, visuailzation)

load IMG_REF_BINARY;

cgcurve = zeros(1 , MaxGen);

%%  Initialization
[ population ] = initialization(M, N);
for i = 1 : M
    population.Chromosomes(i).fitness = obj( population.Chromosomes(i).Gene(:), IMG_REF_BINARY);
end

g = 1;
disp(['Generation #' , num2str(g)]);
[max_val , indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');
cgcurve(g) = population.Chromosomes(indx(1)).fitness;

subplot(1,2,2)

%% Main loop
for g = 2 : MaxGen
    disp(['Generation #' , num2str(g)]);

    for k = 1: 2: M
        % Selection
        [ parent1, parent2] = selection(population);
        
        % Crossover
        [child1 , child2] = crossover(parent1 , parent2, Pc, 'double');
        
        % Mutation
        [child1] = mutation(child1, Pm);
        [child2] = mutation(child2, Pm);
        
        newPopulation.Chromosomes(k).Gene = child1.Gene;
        newPopulation.Chromosomes(k+1).Gene = child2.Gene;
    end
    
    % Calcualte the fitness values
    for i = 1 : M
        newPopulation.Chromosomes(i).fitness = obj( newPopulation.Chromosomes(i).Gene(:), IMG_REF_BINARY);
    end
    
    % Elitism
    [ newPopulation ] = elitism(population, newPopulation, Er);
    
    cgcurve(g) = newPopulation.Chromosomes(1).fitness;
    
    population = newPopulation; % Replace the previous population with the newly made
    
    BestChrom.Gene    = population.Chromosomes(1).Gene;
    BestChrom.Fitness = population.Chromosomes(1).fitness;
    
    
    col_no = size(IMG_REF_BINARY,2);
    Recons_IMG = vec2mat(BestChrom.Gene , col_no);
    Recons_IMG = Recons_IMG .* 255;

    
 %   if rem(g , 100) == 0
        subplot(1,2,2)
        imshow(Recons_IMG);
        title(['Generation #' , num2str(g), ' Error = ' , num2str(-BestChrom.Fitness)])
 
        drawnow
 %   end
    
end

   



if visuailzation == 1
    figure
    plot( 1 : MaxGen , cgcurve);
    xlabel('Generation');
    ylabel('Fitness of the best elite')
end


end