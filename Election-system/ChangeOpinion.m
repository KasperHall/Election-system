function populationOpinions = ChangeOpinion(populationOpinions, ...
  populationParameters, government, countryParameters, ...
  oldCountryParameters, changeWeight, unfairityWeight)
  
  %added test code NaN problem
  temp = populationOpinions;
  first = isnan(temp);
  
  oldAnger = mean(abs(oldCountryParameters - populationParameters), 2);
  newAnger = mean(abs(countryParameters - populationParameters), 2);
  relativeAnger = newAnger - oldAnger;
  
  a = populationOpinions - changeWeight*relativeAnger .* government;
  b = unfairityWeight*(newAnger - mean(newAnger)) .* government;
  newOpinions = max(0, a - b);
  newOpinions = newOpinions ./ sum(newOpinions, 2);
  newOpinions(isnan(newOpinions)) = 1./size(newOpinions, 2);
  newOpinions = min(1, newOpinions);
  
%   partyIndex = find(government);
%   
%   for i = 1:sum(government)
%     populationOpinions(:, partyIndex(i)) = newOpinions(:, i);
%   end

    populationOpinions = newOpinions;
    
    %added test code NaN problem
    second = isnan(populationOpinions);
    if max(max(first)) ~= max(max(second))
      disp("error");
    end
%   newOpinions = populationOpinions - changeWeight * partyParameters(government, :) .* relativeAnger;
%   newOpinions = newOpinions - unfairityWeight * partyParameters(government, :).* (newAnger - mean(newAnger));
%   newOpinions = max(0, min(1, newOpinions));

end

