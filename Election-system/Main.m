%test

% New code when I stll haven't updated, what happens?

%Test message
% New stuff :D

nParameter = 10;
nIndividual = 100;
nParty = 10;
gridSize = 100;
percentageToUpdate = 0.5;
neighbourhoodSize = 20;


partyColors = InitializePartyColors();

nIteration = 1000;

parameters = InitializeParameters(nParameter);

% Population is matrix with size nPopulation x (2 + nParameter + nParty)
population = InitializePopulation(nIndividual, gridSize, nParameter, nParty); 

parties = InitializeParties(nParty, nParameter);

hAxes, populationPlot, countryPlot = InitializePlot(population, ...
  gridSize, parameters, parties);

for iIteration = 1:nIteration
    
    preferredParameters =  population(:, 3:(2 + nParameter));
    
    happiness = CalculateHappiness(preferredParameters, parameters);
    
    opinions = population(:, (3 + nParameter):(2 + nParameter + nParty));
    
    [newParameters, government, votes] = RunElection(parties, opinions, parameters);
    
    UpdatePopulationPlot(populationPlot, population, happiness, votes, partyColors);
    
    UpdateCountryPlot(newParameters, government);
    
    newOpinions = ChangeOpinion(opinions, government, newParameters, parameters);
    
    parameters = newParameters;
    
    population(:, (3 + nParameter):(2 + nParameter + nParty)) = newOpinions;
    
    population = CreateNextGeneration(population, percentageToUpdate, neighbourhoodSize, gridSize);
    
end