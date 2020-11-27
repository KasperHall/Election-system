function countryPlot = InitializeCountryPlot(parameters, parties, hAxes)

  nParameters = length(parameters);
  countryPlot = bar(hAxes, parameters);
  
  hAxes.YLim = [0, 1];
  xlabel('Parmeter')
  ylabel('Parmeter value')
  
end
