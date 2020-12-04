function population = CreateNextGeneration(population, percentageToUpdate, neighbourhoodSize, gridSize, nParameter, nParty)

    nOfNewIndividuals = floor(size(population,1)*percentageToUpdate);
    distanceMatrix = GetDistance(population);
    newIndividuals = zeros(nOfNewIndividuals, size(population,2));
    
    possiblePairs = sparse((distanceMatrix < neighbourhoodSize) & ~logical(eye(size(population,1))));
    
    [is, js] = find(possiblePairs);
    iTemp = randi([1, size(is,1)], nOfNewIndividuals, 1);
    
    iParent1 = is(iTemp);
    iParent2 = js(iTemp);
    
%     cumPossible = cumsum(possiblePairs(:)');
%     cumProb = cumPossible / max(cumPossible);
%     
%     iBothParents = sum(rand(nOfNewIndividuals, 1) < cumProb, 2) + 1;
%     
%     iParent1 = mod(iBothParents - 1, size(population,1)) + 1;
%     iParent2 = floor((iBothParents - 1)/size(population,1)) + 1;

    newIndividuals = GenerateIndividual(population(iParent1,:), population(iParent2,:), neighbourhoodSize, gridSize, nParameter, nParty);
    
    individualsToRemove = randperm(size(population,1),nOfNewIndividuals);
    population(individualsToRemove,:) = newIndividuals;
        
end