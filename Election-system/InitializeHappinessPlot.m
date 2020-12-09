function happinessPlot = InitializeHappinessPlot(happiness, hAxes)

  happinessPlot = plot(hAxes, happiness);
  xlabel(hAxes, 'Generation')
  ylabel(hAxes, 'Happiness')

end