function populationOpinions = ChangeOpinion(populationOpinions, ...
  populationParameters, government, countryParameters, ...
  oldCountryParameters, changeWeight, unfairityWeight, constantDislikeWeight)
  
  %added test code NaN problem
  temp = populationOpinions;
  first = isnan(temp);
  
  oldAnger = mean(abs(oldCountryParameters - populationParameters), 2);
  newAnger = mean(abs(countryParameters - populationParameters), 2);
  relativeAnger = newAnger - oldAnger;
  
% Previous opinion change
%   changeOpinionDelta = changeWeight * relativeAnger .* government;
%   unfairityOpinionDelta = unfairityWeight*(newAnger - mean(newAnger)) .* government;
%   constantOpinionDelta = constantDislikeWeight .* government;
%   newOpinions = populationOpinions - changeOpinionDelta - unfairityOpinionDelta - constantOpinionDelta;
%   newOpinions = max(0, newOpinions);
%   newOpinions = min(1, newOpinions);
%   newOpinions = newOpinions ./ sum(newOpinions, 2);
%   newOpinions(isnan(newOpinions)) = 1./size(newOpinions, 2);

% Alternative opinion change
%   goalOpinions = 0.5 * (1 - relativeAnger);
%   newOpinions = populationOpinions - changeWeight .* (populationOpinions - (government .* goalOpinions) - ~government .* 0.5) - constantDislikeWeight .* government;
%   newOpinions = max(0, newOpinions);
%   newOpinions = min(1, newOpinions);

% Another alternative opinion change
    oposition = (government == 0) / sum(government == 0, 2);

    sittingOpinionDelta = -changeWeight .* government .* relativeAnger;
    opositionOpinionDelta = changeWeight .* oposition .* relativeAnger;
    sittingConstantDelta = -constantDislikeWeight .* government;
    opositionConstantDelta = constantDislikeWeight .* oposition;

    newOpinions = populationOpinions + sittingOpinionDelta + opositionOpinionDelta + sittingConstantDelta + opositionConstantDelta;

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

