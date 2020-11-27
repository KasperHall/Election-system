function UpdatePlots(hFigure, generation, populationPlot, population, ...
  happiness, votes, countryPlot, countryParameters, pieAx, government, ...
  partyColors, recordVideo, videoHandle)

  UpdatePopulationPlot(populationPlot, population, happiness, votes, ... 
    partyColors);
  UpdateCountryPlot(countryPlot, countryParameters);
  UpdatePieChart(pieAx, partyColors, government, votes)
  
  % Comment this out - slightly slows down the code
  hFigure.Children(1).String = sprintf('Generation %d', generation);
  
  if recordVideo
    videoFrame = getframe(hFigure);
    writeVideo(videoHandle, videoFrame);
  end
  
  drawnow();

end