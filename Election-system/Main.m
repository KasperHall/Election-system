clear variables; close all; clc;

nParameter = 3;
nIndividual = 5;
nParty = 3;                % Allowed values [1, 10]
gridSize = 100;
percentageToUpdate = 0.5;
neighbourhoodSize = 20;
changeWeight = 0.1;
unfairityWeight = 0.1;
systems = ["FPP", "PLPR"]; % FPP = first-past-the-post , PLPR = Party-list proportional representation

nIteration = 1000;
runningGov = ones(nParty, 1, 'logical');

partyColors = InitializePartyColors();

countryParameters = InitializeParameters(nParameter);
partyParameters = InitializeParties(nParty, nParameter);

% Population [x, y, population parameters, opinion of the parties]
population = InitializePopulation(nIndividual, gridSize, partyParameters);

[pieAx, hAxes, populationPlot, countryPlot] = InitializePlot(...
  population, gridSize, countryParameters, runningGov, partyColors);

for iIteration = 1:nIteration
    populationParameters = population(:, 3:(2 + nParameter));
    
    happiness = CalculateHappiness(populationParameters, ...
      countryParameters);
    opinions = population(:, (3 + nParameter):(2 + nParameter + nParty));
    
    [newParameters, government, votes] = RunElection(partyParameters, opinions, countryParameters, systems(1));

    % Update
    UpdatePopulationPlot(populationPlot, population, happiness, votes, partyColors);
    UpdateCountryPlot(newParameters, government);
    
    newOpinions = ChangeOpinion(opinions, populationParameters, government, newParameters, countryParameters, changeWeight, unfairityWeight);
    countryParameters = newParameters;
    
    population(:, (3+nParameter):(2+nParameter+nParty)) = newOpinions;
    
    population = CreateNextGeneration(population, percentageToUpdate, neighbourhoodSize, gridSize, nParameter, nParty);
    
end