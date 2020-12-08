function UpdatePopulationPlot(populationPlot, population, happiness, votes, partyColors)
  
  populationPlot(1).XData = population(:, 1);
  populationPlot(1).YData = population(:, 2);

%   populationPlot(2).XData = population(:, 1);
%   populationPlot(2).YData = population(:, 2);

  % Apply color
  populationPlot(1).CData = partyColors(votes, :);
%   populationPlot(2).SizeData = 50 * (happiness + 1);

end

