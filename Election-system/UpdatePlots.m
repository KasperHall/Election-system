function UpdatePlots(hFigure, hAxes, generation, populationPlot, population, ...
  happiness, votes, countryPlot, countryParameters, pieAx, government, ...
  happinessPlot, partyColors, recordVideo, videoHandle)

  UpdatePopulationPlot(populationPlot, population, happiness, votes, ... 
    partyColors);
  UpdatePartyFreqPlot(hAxes(2), government);
  UpdateCountryPlot(countryPlot, countryParameters);
  UpdatePieChart(pieAx, partyColors, government, votes);
  UpdateHappinessPlot(happinessPlot, happiness)
  
  % Comment this out - slightly slows down the code
  hFigure.Children(1).String = sprintf('Generation %d, Happiness %.2f', ...
    generation, happiness(generation));
  
  if recordVideo
    videoFrame = getframe(hFigure);
    writeVideo(videoHandle, videoFrame);
  end
  
  drawnow();

end