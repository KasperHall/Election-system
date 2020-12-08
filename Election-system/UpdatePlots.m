function UpdatePlots(hFigure, hAxes, generation, populationPlot, votePieAx, ...
        population, happiness, votes, countryPlot, countryParameters, ...
        pieAx, government, happinessPlot, partyColors, recordVideo, videoHandle)

  UpdatePopulationPlot(populationPlot, votePieAx, population, happiness...
      , votes, partyColors);
  UpdatePartyFreqPlot(hAxes(2), government);
  UpdateCountryPlot(countryPlot, countryParameters);
  UpdatePieChart(pieAx, partyColors, government, votes);
  UpdateHappinessPlot(happinessPlot, happiness)
  
  % Comment this out - slightly slows down the code
  hFigure.Children(1).String = sprintf('Generation %d, Average happiness %.2f', ...
    generation, happiness(generation));
  
  if recordVideo
    videoFrame = getframe(hFigure);
    writeVideo(videoHandle, videoFrame);
  end
  
  drawnow();

end