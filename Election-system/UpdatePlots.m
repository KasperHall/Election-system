function UpdatePlots(hFigure, hAxes, generation, populationPlot, population, ...
  happiness, votes, countryPlot, countryParameters, pieAx, government, ...
  partyColors, recordVideo, videoHandle)

  UpdatePopulationPlot(populationPlot, population, happiness, votes, ... 
    partyColors);
  UpdatePartyFreqPlot(hAxes(2), government);
  UpdateCountryPlot(countryPlot, countryParameters);
  UpdatePieChart(pieAx, partyColors, government, votes);
  
  % Comment this out - slightly slows down the code
  hFigure.Children(1).String = sprintf('Generation %d, Average happiness %.2f', ...
    generation, mean(happiness));
  
  if recordVideo
    videoFrame = getframe(hFigure);
    writeVideo(videoHandle, videoFrame);
  end
  
  drawnow();

end