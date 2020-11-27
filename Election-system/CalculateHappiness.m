function happiness = CalculateHappiness(preferredParameters, parameters)

happiness = sqrt(mean((parameters - preferredParameters).^2, 2));

end

