function populationPlot = InitializePopulationPlot(population, gridSize,...
  hAxes)

  hold on;
  populationPlot(2) = scatter(hAxes, population(:, 1), population(:, 2),...
    100, 'filled', 'y', 'MarkerEdgeColor', 'none');
  
  populationPlot(1) = scatter(hAxes, population(:, 1), population(:, 2),...
    50, 'filled', 'k', 'MarkerEdgeColor', 'none');
  hold off;

  hAxes.XLim = [-gridSize/2, gridSize/2];
  hAxes.YLim = [-gridSize/2, gridSize/2];
  xlabel('x');
  ylabel('y');

end
