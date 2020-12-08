function [hFigure, pieAx, hAxes, populationPlot, votePieAx, countryPlot, happinessPlot] = ...
  InitializePlot(population, gridSize, countryParameters, government, ...
                 happiness, partyColors)

  hFigure = figure;
  hAxes(1) = subplot(2, 3, 1);  % Population plot
  hAxes(2) = subplot(2, 3, 2);  % Party freq plot
  hAxes(3) = subplot(2, 3, 3);  % Country plot
  hAxes(4) = subplot(2, 1, 2);  % Happiness plot
  
  [populationPlot, votePieAx] = InitializePopulationPlot(population, ...
    gridSize, hAxes(1), partyColors);
  
  InitializePartyFreqPlot(government, hAxes(2), partyColors);
  
  [pieAx, countryPlot] = InitializeCountryPlot(countryParameters, ...
    government, hAxes(3), partyColors);
  
  happinessPlot = InitializeHappinessPlot(happiness, hAxes(4));
  
  sgtitle('Generation 1, Happiness 0.00')
end
