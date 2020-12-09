function [hFigure, pieAx, hAxes, populationPlot, votePlot, happinessPlot] = ...
  InitializePlot(population, gridSize, government, happiness, voteCount, partyColors)

  hFigure = figure;
  hAxes(1) = subplot(3, 2, 1);  % Population plot
  hAxes(2) = subplot(3, 2, 2);  % Party freq plot
  hAxes(3) = subplot(3, 1, 2);  % Vote plot
  hAxes(4) = subplot(3, 1, 3);  % Happiness plot
  
  populationPlot = InitializePopulationPlot(population, gridSize, hAxes(1));
  
  InitializePartyFreqPlot(government, hAxes(2), partyColors);
  
  %countryPlot = InitializeCountryPlot(countryParameters, hAxes(3));
  votePlot = InitializeVotePlot(voteCount, hAxes(3), partyColors);
  
  pieAx = InitializeGovernmentPie(government, partyColors);
  
  happinessPlot = InitializeHappinessPlot(happiness, hAxes(4));
  
  sgtitle('Generation 1, Happiness 0.00')
end
