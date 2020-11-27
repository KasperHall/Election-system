function happiness = CalculateHappiness(preferredParameters, parameters)

happiness = 1 / (1 + sqrt(mean((parameters - preferredParameters).^2, 2)));

end

