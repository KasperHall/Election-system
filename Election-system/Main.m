%test

% New code when I stll haven't updated, what happens?

%Test message
% New stuff :D

nParameter = 10;
nIndividual = 100;
nParty = 10;

nIteration = 1000;

parameters = InitializeParameters(nParameter);

population = InitializePopulation(nIndividual, nParameter, nParty); %population is matrix with size nPopulation x (2 + nParameter + nParty)

parties = InitializeParties(nParty, nParameter);



populationPlot = InitializePopulationPlot(population);

countryPlot = InitializeCountryPlot(parameters, parties);

for i = 1:nIteration
    
    opinions = population(:, (3 + nParameter):(2 + nParameter + nParty));
    
    [newParameters, government] = RunElection(parties, opinions, parameters);
    
    UpdateCountryPlot(newParameters, government);
    
    newOpinions = ChangeOpinion(opinions, government, newParameters, parameters);
    
    population(:, (3 + nParameter):(2 + nParameter + nParty)) = newOpinions;
    
    population = CreateNextGeneration(population);
    
    UpdatePopulationPlot(populationPlot, population);
    
end