function population = InitializePopulation(nIndividual, gridSize, ...
  partyParameters, nVotingSystems)

  nParty = size(partyParameters, 1);
  nParameter = size(partyParameters, 2);
  populationPositions = gridSize/2 - gridSize*rand(nIndividual, 2);
  
  %Give all individuals the same preffered parameters
%   populationParameters = repmat(rand(1, nParameter), nIndividual, 1);
  %Give all individuals different preffered parameters
  populationParameters = 0.5 * rand(1, nParameter) + 0.5 * rand(nIndividual, nParameter);
  populationParameters = max(0, min(1, populationParameters));
  
  %r = ComputeOpinion(populationParameters, partyParameters);
  %populationOpinions = r ./ sum(r, 2);
  populationOpinions = ComputeOpinion(populationParameters, partyParameters);
  
  tempPopulation = [populationPositions, ...
                populationParameters, ...
                populationOpinions];
  population = zeros(size(tempPopulation,1),size(tempPopulation,2), nVotingSystems);
  for i = 1:nVotingSystems
    population(:,:,i) = tempPopulation;
  end

end
