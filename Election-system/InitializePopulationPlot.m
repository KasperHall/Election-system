function populationPlot = InitializePopulationPlot(population, gridSize,...
  hAxes)
  hold(hAxes, 'on');
%   populationPlot(2) = scatter(hAxes, population(:, 1), population(:, 2),...
%     100, 'filled', 'y', 'MarkerEdgeColor', 'none');
  
  populationPlot(1) = scatter(hAxes, population(:, 1), population(:, 2),...
    50, 'filled', 'k', 'MarkerEdgeColor', 'none');
  hold(hAxes, 'off');

  hAxes.XLim = [-gridSize/2, gridSize/2];
  hAxes.YLim = [-gridSize/2, gridSize/2];
  xlabel('x');
  ylabel('y');
  
%   votePieAx = axes('Position',[0.055 0.82 0.15 0.15]);
%   pie(votePieAx, ones(1, size(partyColors, 1)));
%   colormap(votePieAx, partyColors)
%   title('Goverment dist')

end
