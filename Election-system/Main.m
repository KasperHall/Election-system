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
nParameter = 3;
nIndividual = 1000;%200;
nParty = 6;                % Allowed values [1, 10]
gridSize = 200;
percentageToUpdate = 0.5;
neighbourhoodSize = 30;
parameterDeviation = 0.05;
opinionDeviation = 0.01;
positionDeviation = 2;
changeWeight = 0.5;
unfairityWeight = 0;
constantDislikeWeight = 0.001;
greedParameter = 0.001;
nToBeElected = 1;
countryParameterChangeRate = 0.35;
voteSystems = ["FPP", "PLPR", "STV"]; % FPP = first-past-the-post , PLPR = Party-list proportional representation, STV = Single transferable vote
voteSystems = ["FPP", "STV"];
nVotingSystems = size(voteSystems,2);
happiness = zeros(nGens, 1, nVotingSystems);
voteCount = zeros(nGens, nParty, nVotingSystems);

% Preallocate plot handles
hFigure = gobjects(1, nVotingSystems);
pieAx = gobjects(1, nVotingSystems);
hAxes = gobjects(4, nVotingSystems);           % Currently 4 axes
populationPlot = gobjects(1, nVotingSystems);
votePlot = gobjects(nParty, nVotingSystems);
happinessPlot = gobjects(1, nVotingSystems);



partyColors = InitializePartyColors();
initGovernment = ones(1, nParty, nVotingSystems);
initPartyParameters = InitializeParties(nParty, nParameter, nVotingSystems);
initPopulation = InitializePopulation(nIndividual, gridSize, initPartyParameters(:,:,1), nVotingSystems);
for i = 1:nVotingSystems
  [hFigure(:, i), pieAx(:, i), hAxes(:, i), populationPlot(:, i), votePlot(:, i), happinessPlot(:, i)] = ...
    InitializePlot(initPopulation(:,:,i), gridSize, initGovernment(:,:,i), ...
                   happiness(:,:,i), voteCount(:,:,i), partyColors);
end

nRun = 10;
meanHap = zeros(nRun, 1, nVotingSystems);
for iRun = 1:nRun

  government = zeros(nGens, nParty, nVotingSystems);
  populationVote = zeros(1, nIndividual, nVotingSystems);
  populationParameters = zeros(nIndividual, nParameter, nVotingSystems);
  populationOpinions = zeros(nIndividual, nParty, nVotingSystems);
  oldCountryParameters = zeros(1, nParameter, nVotingSystems);

  countryParameters = InitializeParameters(nParameter,nVotingSystems);
  partyParameters = InitializeParties(nParty, nParameter, nVotingSystems);
  compatibilityMatrix = CalculatePartyCompatibility(partyParameters, nParty);

  % Population [x, y, population parameters, opinion of the parties]
  population = InitializePopulation(nIndividual, gridSize, partyParameters(:,:,1), nVotingSystems);
  
  if iRun ~= 1
    for i = 1:nVotingSystems
      for j = 1:nParty
        hAxes(2,i).Children(j).YData = 0;
      end
    end
  end
  
  for generation = 2:nGens
    for pickedSystem = 1:nVotingSystems
      populationParameters(:,:,pickedSystem) = ...
        population(:, 3:(2 + nParameter), pickedSystem);

      happiness(generation, 1, pickedSystem) = mean(ComputeHappiness(...
        populationParameters(:,:,pickedSystem), countryParameters(:,:,pickedSystem)));
      populationOpinions(:,:,pickedSystem) = population(:, ...
        (3 + nParameter):(2 + nParameter + nParty), pickedSystem);
      oldCountryParameters(:,:,pickedSystem) = countryParameters(:,:,pickedSystem);

      [countryParameters(:,:,pickedSystem), government(generation,:,pickedSystem), populationVote(:,:,pickedSystem)] = RunElection(...
          partyParameters(:,:,pickedSystem), populationOpinions(:,:,pickedSystem), countryParameters(:,:,pickedSystem),...
          voteSystems(pickedSystem), greedParameter, countryParameterChangeRate, compatibilityMatrix, nToBeElected);
      voteCount(generation, :, pickedSystem) = histc(populationVote(:,:,pickedSystem), 1:nParty)/nIndividual;

      % Update plots
      if generation == nGens
       UpdatePlots(hFigure(:, pickedSystem), hAxes(:, pickedSystem), generation, populationPlot(:, pickedSystem), ...
        population(:,:,pickedSystem), populationVote(:, :, pickedSystem), votePlot(:, pickedSystem), voteCount(:,:,pickedSystem), happinessPlot(:, pickedSystem),...
          happiness(:,:,pickedSystem), pieAx(:, pickedSystem), government(:,:,pickedSystem), partyColors, recordVideo, videoHandle)
      end
      % Update population
      populationOpinions(:,:,pickedSystem) = ChangeOpinion(populationOpinions(:,:,pickedSystem), ...
          populationParameters(:,:,pickedSystem), government(generation,:,pickedSystem), countryParameters(:,:,pickedSystem), ...
          oldCountryParameters(:,:,pickedSystem), changeWeight, unfairityWeight, constantDislikeWeight);

      population(:, (3+nParameter):(2+nParameter+nParty), pickedSystem) = populationOpinions(:,:,pickedSystem);
      population(:,:,pickedSystem) = CreateNextGeneration(population(:,:,pickedSystem), percentageToUpdate,...
          neighbourhoodSize, gridSize, nParameter, nParty, parameterDeviation, opinionDeviation, positionDeviation);

    end

  end

  meanHap(iRun, :, :) = mean(happiness);
end

if recordVideo
  close(videoHandle);
end