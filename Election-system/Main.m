clear variables; close all; clc;

recordVideo = false;
videoHandle = 0;
if recordVideo
  videoHandle = VideoWriter(datestr(now,'mm-dd-yyyy HH-MM'),'MPEG-4');
  v.FrameRate = 30;
  v.Quality = 100;
  open(videoHandle);
end

nGens = 500;
nParameter = 30;
nIndividual = 200;%200;
nParty = 6;                % Allowed values [1, 10]
gridSize = 100;
percentageToUpdate = 0.5;
neighbourhoodSize = 30;
parameterDeviation = 0.05;
opinionDeviation = 0.05;
positionDeviation = 0.5;
changeWeight = 5;
unfairityWeight = 0.5;
greedParameter = 0.01;
nToBeElected = 3;
countryParameterChangeRate = 0.1;
voteSystems = ["FPP", "PLPR", "STV"]; % FPP = first-past-the-post , PLPR = Party-list proportional representation, STV = Single transferable vote
pickedSystem = voteSystems(1);


government = ones(nParty, 1, 'logical');

partyColors = InitializePartyColors();

countryParameters = InitializeParameters(nParameter);
partyParameters = InitializeParties(nParty, nParameter);
compatibilityMatrix = CalculatePartyCompatibility(partyParameters, nParty);

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
      partyParameters, populationOpinions, countryParameters, pickedSystem(1), greedParameter, countryParameterChangeRate, compatibilityMatrix, nToBeElected);
    
    % Update population
    populationOpinions = ChangeOpinion(populationOpinions, ...
      populationParameters, government, countryParameters, ...
      oldCountryParameters, changeWeight, unfairityWeight);
    
    population(:, (3+nParameter):(2+nParameter+nParty)) = populationOpinions;
    population = CreateNextGeneration(population, percentageToUpdate, neighbourhoodSize, gridSize, nParameter, nParty, parameterDeviation, opinionDeviation, positionDeviation);
    
    % Update plots
    UpdatePlots(hFigure, hAxes, generation, populationPlot, population, ...
      happiness, votes, countryPlot, countryParameters, pieAx, ...
      government, partyColors, recordVideo, videoHandle)
end

if recordVideo
  close(videoHandle);
end