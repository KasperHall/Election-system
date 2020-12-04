function [pieAx, countryPlot] = InitializeCountryPlot(...
  countryParameters, government, hAxes, partyColors)

  countryPlot = bar(hAxes, countryParameters);
  
  hAxes.YLim = [0, 1];
  xlabel('Parmeter')
  ylabel('Parmeter value')
  title('Country')
  
  %pieAx = axes('Position',[0.83 0.8 0.15 0.15]);
  pieAx = axes('Position',[0.83 0.82 0.15 0.15]);
  pie(pieAx, ones(1, sum(government)));
  colormap(pieAx, partyColors(government, :))
  title('Goverment dist')
  
end
