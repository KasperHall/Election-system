function parties = InitializeParties(nParty, nParameter, nVotingSystems)

    
    switch nParty
    case 0
      error('nParty = 0 not allowed!')
    case 1
      tempParties = rand(1, nParameter);
    case 2
      firstParty = ones(1, nParameter);
      secondParty = zeros(1, nParameter);
      tempParties = [firstParty; secondParty];
    otherwise
      firstParty = ones(1, nParameter);
      secondParty = zeros(1, nParameter);
      otherParty = rand(nParty - 2, nParameter);
      tempParties = [firstParty; secondParty; otherParty];
    end
    parties = zeros(nParty,nParameter,nVotingSystems);
    for i = 1:nVotingSystems
        parties(:,:,i) = tempParties;
    end
  
% Simple parties
% if nParty == 6 && nParameter == 3
%     parties = [1, 0.5, 0.5; 0, 0.5, 0.5; 0.5, 1, 0.5; 0.5, 0, 0.5; 0.5, 0.5, 1; 0.5, 0.5, 0];
% end
end
