function [pieAx, hAxes, populationPlot, countryPlot] = InitializePlot(...
  population, gridSize, countryParameters, nParty, partyColors)

  hAxes(1) = subplot(1, 2, 1);
  populationPlot = InitializePopulationPlot(population, ...
    gridSize, hAxes(1));
  
  hAxes(2) = subplot(1, 2, 2);
  [pieAx, countryPlot] = InitializeCountryPlot(countryParameters, ...
    nParty, hAxes(2), partyColors);

end
