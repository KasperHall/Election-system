clear variables; close all; clc;

recordVideo = false;
videoHandle = 0;
if recordVideo
  videoHandle = VideoWriter(datestr(now,'mm-dd-yyyy HH-MM'),'MPEG-4');
  v.FrameRate = 30;
  v.Quality = 100;
  open(videoHandle);
end

nGens = 1500;
nParameter = 6;
nIndividual = 2000;%200;
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
greedParameter = 0.15;
nToBeElected = 1;
countryParameterChangeRate = 0.2;
voteSystems = ["FPP", "PLPR", "STV"]; % FPP = first-past-the-post , PLPR = Party-list proportional representation, STV = Single transferable vote
pickedSystem = voteSystems(3);
nVotingSystems = size(voteSystems,2);
happiness = zeros(nGens, 1, nVotingSystems);


government = ones(1, nParty, nVotingSystems, 'logical');
votes = zeros(1, nIndividual ,nVotingSystems);
populationParameters = zeros(nIndividual,nParty,nVotingSystems);
populationOpinions = zeros(nIndividual,nParty,nVotingSystems);
oldCountryParameters = zeros(1,nParameter,nVotingSystems);

partyColors = InitializePartyColors();

countryParameters = InitializeParameters(nParameter,nVotingSystems);
partyParameters = InitializeParties(nParty, nParameter, nVotingSystems);
compatibilityMatrix = CalculatePartyCompatibility(partyParameters, nParty);

% Population [x, y, population parameters, opinion of the parties]
population = InitializePopulation(nIndividual, gridSize, partyParameters(:,:,1), nVotingSystems);

% removed by me
[hFigure, pieAx, hAxes, populationPlot, votePieAx, countryPlot, happinessPlot] = InitializePlot(...
  population(:,:,1), gridSize, countryParameters(:,:,1), government(:,:,1), happiness(:,:,1), partyColors);

for generation = 2:nGens
    for pickedSystem = 1:nVotingSystems
        populationParameters(:,:,pickedSystem) = population(:, 3:(2 + nParameter), pickedSystem);
    
        happiness(generation, 1, pickedSystem) = mean(ComputeHappiness(populationParameters(:,:,pickedSystem), ...
            countryParameters(:,:,pickedSystem)));
        populationOpinions(:,:,pickedSystem) = population(:, (3 + nParameter):(2 + nParameter + nParty), pickedSystem);
        oldCountryParameters(:,:,pickedSystem) = countryParameters(:,:,pickedSystem);
    
        [countryParameters(:,:,pickedSystem), government(:,:,pickedSystem), votes(:,:,pickedSystem)] = RunElection(...
            partyParameters(:,:,pickedSystem), populationOpinions(:,:,pickedSystem), countryParameters(:,:,pickedSystem),...
            voteSystems(pickedSystem), greedParameter, countryParameterChangeRate, compatibilityMatrix, nToBeElected);
    
        % Update plots % removed by me
        UpdatePlots(hFigure, hAxes, generation, populationPlot, votePieAx, ...
            population(:,:,pickedSystem), happiness(:,:,pickedSystem), votes(:,:,pickedSystem), countryPlot, countryParameters(:,:,pickedSystem), ...
            pieAx, government(:,:,pickedSystem), happinessPlot, partyColors, recordVideo, videoHandle)

        % Update population
        populationOpinions(:,:,pickedSystem) = ChangeOpinion(populationOpinions(:,:,pickedSystem), ...
            populationParameters(:,:,pickedSystem), government(:,:,pickedSystem), countryParameters(:,:,pickedSystem), ...
            oldCountryParameters(:,:,pickedSystem), changeWeight, unfairityWeight, constantDislikeWeight);
    
        population(:, (3+nParameter):(2+nParameter+nParty), pickedSystem) = populationOpinions(:,:,pickedSystem);
        population(:,:,pickedSystem) = CreateNextGeneration(population(:,:,pickedSystem), percentageToUpdate, neighbourhoodSize,...
            gridSize, nParameter, nParty, parameterDeviation, opinionDeviation, positionDeviation);

    end
end

if recordVideo
  close(videoHandle);
end