function populationOpinion = ComputeOpinion(populationParameters, ...
                                            partyParameters)
  % Function which computes the individuals opinion of the parties.
  % param: populationParameters - Matrix containing the population params.
  % param: partyParameters - Matrix containing the party parameters.
  % return: A matrix where the rows are an individual opinion of all 
  %         different parties.
  
  nIndividual = size(populationParameters, 1);
  nParty = size(partyParameters, 1);
  populationOpinion = zeros(nIndividual, nParty);
  
  for i = 1:nParty
    mae = mean(abs(partyParameters(i, :) - populationParameters), 2);
    populationOpinion(:, i) = (1 - mae)';
  end
  
end
