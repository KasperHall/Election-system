function happinessPlot = InitializeHappinessPlot(happiness, hAxes)

  happinessPlot = plot(hAxes, happiness);

  xlabel(hAxes, 'Generation')
  ylabel(hAxes, 'Average happiness [%]')
  title(hAxes, 'Happiness over time')

end