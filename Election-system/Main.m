clear variables; close all; clc;

recordVideo = false;
videoHandle = 0;
if recordVideo
  videoHandle = VideoWriter(datestr(now,'mm-dd-yyyy HH-MM'),'MPEG-4');
  v.FrameRate = 30;
  v.Quality = 100;
  open(videoHandle);
end

nGens = 1000;
nParameter = 3;
nIndividual = 200;%200;
nParty = 6;                % Allowed values [1, 10]
gridSize = 200;
percentageToUpdate = 0.5;
neighbourhoodSize = 10;
parameterDeviation = 0.05;
opinionDeviation = 0.01;
positionDeviation = 2;
changeWeight = 1;
unfairityWeight = 0;
constantDislikeWeight = 0.005;
greedParameter = 0.05;
nToBeElected = 1;
countryParameterChangeRate = 0.2;
voteSystems = ["FPP", "PLPR", "STV"]; % FPP = first-past-the-post , PLPR = Party-list proportional representation, STV = Single transferable vote
pickedSystem = voteSystems(2);
happiness = zeros(nGens, 1);
voteCount = zeros(nGens, nParty);


government = ones(nParty, 1, 'logical');

partyColors = InitializePartyColors();

countryParameters = InitializeParameters(nParameter);
partyParameters = InitializeParties(nParty, nParameter);
compatibilityMatrix = CalculatePartyCompatibility(partyParameters, nParty);

% Population [x, y, population parameters, opinion of the parties]
population = InitializePopulation(nIndividual, gridSize, partyParameters);

[hFigure, pieAx, hAxes, populationPlot, votePlot, happinessPlot] = ...
  InitializePlot(population, gridSize, government, happiness, voteCount, partyColors);

for generation = 2:nGens
    populationParameters = population(:, 3:(2 + nParameter));
    
    happiness(generation, 1) = mean(ComputeHappiness(populationParameters, ...
      countryParameters));
    populationOpinions = population(:, (3 + nParameter):(2 + nParameter + nParty));
    oldCountryParameters = countryParameters;
    
    [countryParameters, government, populationVote] = RunElection(...
      partyParameters, populationOpinions, countryParameters, pickedSystem,...
      greedParameter, countryParameterChangeRate, compatibilityMatrix, nToBeElected);
    voteCount(generation, :) = histc(populationVote, 1:nParty);
    
    % Update plots
    UpdatePlots(hFigure, hAxes, generation, populationPlot, ...
        population, populationVote, votePlot, voteCount, happinessPlot, ...
        happiness, pieAx, government, partyColors, recordVideo, videoHandle)

    % Update population
    populationOpinions = ChangeOpinion(populationOpinions, ...
      populationParameters, government, countryParameters, ...
      oldCountryParameters, changeWeight, unfairityWeight, constantDislikeWeight);
    
    population(:, (3+nParameter):(2+nParameter+nParty)) = populationOpinions;
    population = CreateNextGeneration(population, percentageToUpdate, ...
      neighbourhoodSize, gridSize, nParameter, nParty, parameterDeviation, ...
      opinionDeviation, positionDeviation);
end

if recordVideo
  close(videoHandle);
end