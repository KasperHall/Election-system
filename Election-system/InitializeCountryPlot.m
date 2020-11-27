function countryPlot = InitializeCountryPlot(parameters, nParty, hAxes)

  nParameters = length(parameters);
  countryPlot = bar(hAxes, parameters);
  
  hAxes.YLim = [0, 1];
  xlabel('Parmeter')
  ylabel('Parmeter value')
  
  pieAx = axes('Position',[0.83 0.8 0.15 0.15]);
  pie(ones([1, nParty]));
  
end
