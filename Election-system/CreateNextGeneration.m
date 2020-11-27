function population = CreateNextGeneration(population, percentageToUpdate, neighbourhoodSize, gridSize, nParameter, nParty)

    nOfNewIndividuals = floor(size(population,1)*percentageToUpdate);
    distanceMatrix = GetDistance(population);
    newIndividuals = zeros(nOfNewIndividuals, size(population,2));
    
    for i = 1:nOfNewIndividuals
        
        parent1 = randi([1,size(population,1)]);
        distances = distanceMatrix(parent1,:);
        listOfPotentialParents = [];
        
        for j = 1:size(population,1)
            
            if distances(j) < neighbourhoodSize && j ~= parent1
                listOfPotentialParents = [listOfPotentialParents; j];
            end
            
        end
        if size(listOfPotentialParents,1) == 0
            parent2 = randi([1,size(population,1)]);
            while parent2 == parent1
                parent2 = randi([1,size(population,1)]);
            end
        else
            parent2 = randi([1,size(listOfPotentialParents,1)]);
        end
        
        individual = GenerateIndividual(population(parent1,:), population(parent2,:), neighbourhoodSize, gridSize, nParameter, nParty);
        newIndividuals(i,:) = individual;
        
    end
    
    individualsToRemove = randperm(size(population,1),nOfNewIndividuals);
    for i = 1:nOfNewIndividuals
        population(individualsToRemove(i),:) = newIndividuals(i,:);
    end
        
end