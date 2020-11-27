function [pieAx, countryPlot] = InitializeCountryPlot(...
  countryParameters, runningGov, hAxes, partyColors)

  countryPlot = bar(hAxes, countryParameters);
  
  hAxes.YLim = [0, 1];
  xlabel('Parmeter')
  ylabel('Parmeter value')
  title('Country')
  
  pieAx = axes('Position',[0.83 0.8 0.15 0.15]);
  pie(pieAx, ones(1, sum(runningGov)));
  colormap(pieAx, partyColors(runningGov, :))
  
end
