function UpdatePlots(hFigure, hAxes, generation, populationPlot, ...
        population, populationVote, votePlot, voteCount, happinessPlot, ...
        happiness, pieAx, government, partyColors, recordVideo, videoHandle)

  UpdatePopulationPlot(populationPlot, population, populationVote, partyColors);
  UpdatePartyFreqPlot(hAxes(2), government);
  UpdatePieChart(pieAx, partyColors, government, populationVote);
  UpdateVotePlot(votePlot, voteCount)
  UpdateHappinessPlot(happinessPlot, happiness)
  % UpdateCountryPlot(countryPlot, countryParameters);
  
  % Comment this out - slightly slows down the code
  hFigure.Children(1).String = sprintf('Generation %d, Average happiness %.2f', ...
    generation, happiness(generation));
  
  if recordVideo
    videoFrame = getframe(hFigure);
    writeVideo(videoHandle, videoFrame);
  end
  
  drawnow();

end