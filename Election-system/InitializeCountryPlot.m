function countryPlot = InitializeCountryPlot(countryParameters, hAxes)

  countryPlot = bar(hAxes, countryParameters);
  
  hAxes.YLim = [0, 1];
  xlabel('Parmeter')
  ylabel('Parmeter value')
  title('Country')
  
end
