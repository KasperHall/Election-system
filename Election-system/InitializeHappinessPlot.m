function happinessPlot = InitializeHappinessPlot(happiness, hAxes)

  happinessPlot = plot(hAxes, happiness);
  
  ylim(hAxes, [0, 1]);
  xlabel(hAxes, 'Generation')
  ylabel(hAxes, 'Average happiness')
  title(hAxes, 'Happiness over time')

end