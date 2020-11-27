function population = InitializePopulation(nIndividual, gridSize, nParameter, nParty)

population = [gridSize / 2 - gridSize * rand(nIndividual, 2), rand(nIndividual, nParameter), rand(nIndividual, nParty)];

end
