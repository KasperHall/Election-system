function populationPlot = InitializePopulationPlot(population, gridSize)

hold on;
populationPlot(2) = scatter(population(:, 1), population(:, 2), 100, 'filled', 'y', 'MarkerEdgeColor', 'none');

populationPlot(1) = scatter(population(:, 1), population(:, 2), 50, 'filled', 'k', 'MarkerEdgeColor', 'none');
hold off;

axis([-gridSize / 2, gridSize / 2, -gridSize / 2, gridSize / 2]);

end

