function populationPlot = InitializePopulationPlot(population, gridSize)

populationPlot = scatter(population(:, 1), population(:, 2), 50, 'filled', 'k');

axis([-gridSize / 2, gridSize / 2, -gridSize / 2, gridSize / 2]);

end

