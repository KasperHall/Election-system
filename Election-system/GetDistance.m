function distanceMatrix = GetDistance(population)

    populationSize = size(population,1);
    distanceMatrix = zeros(populationSize,populationSize);
    
    for i = 1:populationSize
        for j = 1:populationSize
            
            distanceMatrix(i,j) = sqrt((population(i,1)-population(j,1))^2 ...
                + (population(i,2)-population(j,2))^2);
        end
    end

end