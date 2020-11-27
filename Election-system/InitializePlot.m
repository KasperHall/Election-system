function [hFigure, pieAx, hAxes, populationPlot, countryPlot] = ...
  InitializePlot(population, gridSize, countryParameters, government, ...
                 partyColors)

  hFigure = figure;
  hAxes(1) = subplot(1, 2, 1);
  populationPlot = InitializePopulationPlot(population, ...
    gridSize, hAxes(1));
  
  hAxes(2) = subplot(1, 2, 2);
  [pieAx, countryPlot] = InitializeCountryPlot(countryParameters, ...
    government, hAxes(2), partyColors);
  
  sgtitle('Generation 1')
end
