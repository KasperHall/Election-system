function [hAxes, populationPlot, countryPlot] = ...
  InitializePlot(population, gridSize, parameters, parties)

  hAxes(1) = subplot(1, 2, 1);
  populationPlot = InitializePopulationPlot(population, ...
    gridSize, hAxes(1));
  
  hAxes(2) = subplot(1, 2, 2);
  countryPlot = InitializeCountryPlot(parameters, parties, hAxes(2));

end
