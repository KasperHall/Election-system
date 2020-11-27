function populationOpinion = ComputeOpinion(populationParameters, ...
                                            partyParameters)
  
  nIndividual = size(populationParameters, 1);
  nParty = size(partyParameters, 1);
  populationOpinion = zeros(nIndividual, nParty);
  
  for i = 1:nParty
    rms = sqrt(mean((partyParameters(i, :) - populationParameters).^2, 2));
    populationOpinion(i, :) = 1./(1 + rms);
  end
  
end
