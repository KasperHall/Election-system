function parties = InitializeParties(nParty, nParameter)

    switch nParty
    case 0
      error('nParty = 0 not allowed!')
    case 1
      parties = rand(1, nParameter);
    case 2
      firstParty = ones(1, nParameter);
      secondParty = zeros(1, nParameter);
      parties = [firstParty; secondParty];
    otherwise
      firstParty = ones(1, nParameter);
      secondParty = zeros(1, nParameter);
      otherParty = rand(nParty - 2, nParameter);
      parties = [firstParty; secondParty; otherParty];
    end
  
% Simple parties
if nParty == 6 && nParameter == 3
    parties = [1, 0.5, 0.5; 0, 0.5, 0.5; 0.5, 1, 0.5; 0.5, 0, 0.5; 0.5, 0.5, 1; 0.5, 0.5, 0];
end
end
