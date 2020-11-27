clear variables; close all; clc;

nParameter = 2;
nIndividual = 5;
nParty = 10;                % Allowed values [1, 10]
gridSize = 100;
percentageToUpdate = 0.5;
neighbourhoodSize = 20;
changeWeight = 0.1;
unfairityWeight = 0.1;
nIteration = 1000;

partyColors = InitializePartyColors();
countryParameters = InitializeParameters(nParameter);

% Population [x, y, population parameter, opinion of the parties]
population = InitializePopulation(nIndividual, gridSize, nParameter, nParty); 

partyParameters = InitializeParties(nParty, nParameter);

[pieAx, hAxes, populationPlot, countryPlot] = ...
  InitializePlot(population, gridSize, countryParameters, nParty, partyColors);

for iIteration = 1:nIteration
    
    populationParameters = population(:, 3:(2 + nParameter));
    
    happiness = CalculateHappiness(populationParameters, countryParameters);
    
    opinions = population(:, (3 + nParameter):(2 + nParameter + nParty));
    
    [newParameters, government, votes] = RunElection(partyParameters, opinions, countryParameters);
    
    UpdatePopulationPlot(populationPlot, population, happiness, votes, partyColors);
    
    UpdateCountryPlot(newParameters, government);
    
    newOpinions = ChangeOpinion(opinions, populationParameters, government, newParameters, countryParameters, changeWeight, unfairityWeight);
    
    countryParameters = newParameters;
    
    population(:, (3 + nParameter):(2 + nParameter + nParty)) = newOpinions;
    
    population = CreateNextGeneration(population, percentageToUpdate, neighbourhoodSize, gridSize, nParameter, nParty);
    
end