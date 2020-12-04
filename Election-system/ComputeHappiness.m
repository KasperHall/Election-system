function happiness = ComputeHappiness(populationParameters, ...
                                        countryParameters)

  % rms = sqrt(mean((countryParameters - populationParameters).^2, 2));
  % happiness = 1./(1 + rms);
  mae = mean(abs(countryParameters - populationParameters), 2);
  happiness = (1 - mae);

end

