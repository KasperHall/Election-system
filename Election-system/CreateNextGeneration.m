function population = CreateNextGeneration(population, percentageToUpdate, neighbourhoodSize, gridSize, nParameter, nParty, parameterDeviation, opinionDeviation, positionDeviation)

    nOfNewIndividuals = floor(size(population,1)*percentageToUpdate);
%     distanceMatrix = GetDistance(population);
%     newIndividuals = zeros(nOfNewIndividuals, size(population,2));
%     
%     possiblePairs = sparse((distanceMatrix < neighbourhoodSize) & ~logical(eye(size(population,1))));
%     
%     [is, js] = find(possiblePairs);
%     iTemp = randi([1, size(is,1)], nOfNewIndividuals, 1);
%     
%     iParent1 = is(iTemp);
%     iParent2 = js(iTemp);
    
    iParent1 = zeros(nOfNewIndividuals, 1);
    iParent2 = zeros(nOfNewIndividuals, 1);
    nLeft = nOfNewIndividuals;
    
    counter = 0;
    while nLeft > 0
        iProposedParent1 = randi([1, size(population,1)], nLeft, 1);
        iProposedParent2 = randi([1, size(population,1)], nLeft, 1);
        
        %Check that proposed parents are close enough
        iAccepted = ((population(iProposedParent1, 1) - population(iProposedParent2, 1)).^2 + (population(iProposedParent1, 2) - population(iProposedParent2, 2)).^2 < neighbourhoodSize^2) & (iProposedParent1 ~= iProposedParent2);
        nAccepted = sum(iAccepted, 1);
        
        iParent1((nLeft - nAccepted + 1):nLeft) = iProposedParent1(iAccepted);
        iParent2((nLeft - nAccepted + 1):nLeft) = iProposedParent2(iAccepted);
        
        nLeft = nLeft - nAccepted;
        
        if counter >= 100
            
            iParent1(1:nLeft) = iProposedParent1;
            iParent2(1:nLeft) = iProposedParent2;
            break;
        end
        counter = counter + 1;
    end
    
%     cumPossible = cumsum(possiblePairs(:)');
%     cumProb = cumPossible / max(cumPossible);
%     
%     iBothParents = sum(rand(nOfNewIndividuals, 1) < cumProb, 2) + 1;
%     
%     iParent1 = mod(iBothParents - 1, size(population,1)) + 1;
%     iParent2 = floor((iBothParents - 1)/size(population,1)) + 1;

    newIndividuals = GenerateIndividual(population(iParent1,:), population(iParent2,:), neighbourhoodSize, gridSize, nParameter, nParty, parameterDeviation, opinionDeviation, positionDeviation);
    
    individualsToRemove = randperm(size(population,1),nOfNewIndividuals);
    population(individualsToRemove,:) = newIndividuals;
        
end