function population = InitializePopulation(nIndividual, gridSize, ...
  partyParameters)

  nParty = size(partyParameters, 1);
  nParameter = size(partyParameters, 2);
  populationPositions = gridSize/2 - gridSize*rand(nIndividual, 2);
  
  populationParameters = rand(nIndividual, nParameter);
  populationOpinions = ComputeOpinion(populationParameters, partyParameters);
  
  population = [populationPositions, ...
                populationParameters, ...
                populationOpinions];
end
