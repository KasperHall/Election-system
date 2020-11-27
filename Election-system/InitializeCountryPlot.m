function countryPlot = InitializeCountryPlot(parameters, nParty, hAxes)

  countryPlot = bar(hAxes, parameters);
  
  hAxes.YLim = [0, 1];
  xlabel('Parmeter')
  ylabel('Parmeter value')
  
  pieAx = axes('Position',[0.83 0.8 0.15 0.15]);
  pie(pieAx, ones([1, nParty]));
  
end
