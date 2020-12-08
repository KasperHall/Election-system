function population = CreateNextGeneration(population, percentageToUpdate, neighbourhoodSize, gridSize, nParameter, nParty, parameterDeviation, opinionDeviation, positionDeviation)

    nOfNewIndividuals = floor(size(population,1)*percentageToUpdate);
    
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
        
        if counter >= 2500
            
            iParent1(1:nLeft) = iProposedParent1;
            iParent2(1:nLeft) = iProposedParent1;
            break;
        end
        
        nLeft = nLeft - nAccepted;
        
        counter = counter + 1;
    end

    newIndividuals = GenerateIndividual(population(iParent1,:), population(iParent2,:), neighbourhoodSize, gridSize, nParameter, nParty, parameterDeviation, opinionDeviation, positionDeviation);
    
%     individualsToRemove = randperm(size(population,1),nOfNewIndividuals);
    individualsToRemove = iParent1;
    population(individualsToRemove,:) = newIndividuals;
        
end