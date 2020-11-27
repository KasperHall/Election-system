function happiness = CalculateHappiness(populationParameters, ...
                                        countryParameters)

  rms = sqrt(mean((countryParameters - populationParameters).^2, 2));
  happiness = 1./(1 + rms);

end

