function happinessPlot = InitializeHappinessPlot(happiness, hAxes)

  nGenerations = size(happiness, 1);
  happinessPlot = plot(hAxes, happiness, nGenerations);

end