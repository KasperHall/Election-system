function newOpinions = ChangeOpinion(opinions, preferredParameters, government, newParameters, oldParameters, changeWeight, unfairityWeight)

% preferredParameters = population(:, 3:(2 + nParameter));

oldAnger = sqrt(mean((oldParameters - preferredParameters).^2, 2));

newAnger = sqrt(mean((newParameters - preferredParameters).^2, 2));

relativeAnger = newAnger - oldAnger;

newOpinions = opinions - changeWeight * government .* relativeAnger;

newOpinions = newOpinions - unfairityWeight * government .* (newAnger - mean(newAnger));

newOpinions = max(0, min(1, newOpinions));

end

