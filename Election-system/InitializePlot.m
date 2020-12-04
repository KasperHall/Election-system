function [hFigure, pieAx, hAxes, populationPlot, countryPlot] = ...
  InitializePlot(population, gridSize, countryParameters, government, ...
                 partyColors)

  hFigure = figure;
  hAxes(1) = subplot(1, 3, 1);  % Population plot
  hAxes(2) = subplot(1, 3, 2);  % Party freq plot
  hAxes(3) = subplot(1, 3, 3);  % Country plot
  
  populationPlot = InitializePopulationPlot(population, ...
    gridSize, hAxes(1));
  
  InitializePartyFreqPlot(government, hAxes(2), partyColors);
  
  [pieAx, countryPlot] = InitializeCountryPlot(countryParameters, ...
    government, hAxes(3), partyColors);
  
  sgtitle('Generation 1, Happiness 0.00')
end
