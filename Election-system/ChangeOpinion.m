function populationOpinions = ChangeOpinion(populationOpinions, ...
  populationParameters, government, countryParameters, ...
  oldCountryParameters, changeWeight, unfairityWeight)

  oldAnger = mean(abs(oldCountryParameters - populationParameters), 2);
  newAnger = mean(abs(countryParameters - populationParameters), 2);
  relativeAnger = newAnger - oldAnger;
  
  a = populationOpinions - changeWeight*relativeAnger .* government;
  b = unfairityWeight*(newAnger - mean(newAnger)) .* government;
  newOpinions = max(0, min(1, a - b));
  
%   partyIndex = find(government);
%   
%   for i = 1:sum(government)
%     populationOpinions(:, partyIndex(i)) = newOpinions(:, i);
%   end

    populationOpinions = newOpinions;
  
%   newOpinions = populationOpinions - changeWeight * partyParameters(government, :) .* relativeAnger;
%   newOpinions = newOpinions - unfairityWeight * partyParameters(government, :).* (newAnger - mean(newAnger));
%   newOpinions = max(0, min(1, newOpinions));

end

