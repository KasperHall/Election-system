clear variables; close all; clc;

nGens = 100;
nParameter = 6;
nIndividual = 10;
nParty = 5;                % Allowed values [1, 10]
gridSize = 100;
percentageToUpdate = 0.5;
neighbourhoodSize = 20;
changeWeight = 0.1;
unfairityWeight = 0.1;
voteSystems = ["FPP", "PLPR"]; % FPP = first-past-the-post , PLPR = Party-list proportional representation
pickedSystem = voteSystems(1);

government = ones(nParty, 1, 'logical');

partyColors = InitializePartyColors();

countryParameters = InitializeParameters(nParameter);
partyParameters = InitializeParties(nParty, nParameter);

% Population [x, y, population parameters, opinion of the parties]
population = InitializePopulation(nIndividual, gridSize, partyParameters);

[hFigure, pieAx, hAxes, populationPlot, countryPlot] = InitializePlot(...
  population, gridSize, countryParameters, government, partyColors);

for generation = 2:nGens
    populationParameters = population(:, 3:(2 + nParameter));
    
    happiness = ComputeHappiness(populationParameters, ...
      countryParameters);
    populationOpinions = population(:, (3 + nParameter):(2 + nParameter + nParty));
    oldCountryParameters = countryParameters;
    
    [countryParameters, government, votes] = RunElection(...
      partyParameters, populationOpinions, countryParameters, pickedSystem(1));
    
    % Update population
    populationOpinions = ChangeOpinion(populationOpinions, ...
      populationParameters, government, countryParameters, ...
      oldCountryParameters, changeWeight, unfairityWeight);
    
    population(:, (3+nParameter):(2+nParameter+nParty)) = populationOpinions;
    population = CreateNextGeneration(population, percentageToUpdate, neighbourhoodSize, gridSize, nParameter, nParty);
    
    % Update plots
    UpdatePlots(hFigure, generation, populationPlot, population, ...
      happiness, votes, countryPlot, countryParameters, pieAx, ...
      government, partyColors)
end
