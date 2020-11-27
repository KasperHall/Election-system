function distanceMatrix = GetDistance(population)

    populationSize = size(population,1);
    distanceMatrix = zeros(populationSize,populationSize);
    xPos = population(:, 1);
    yPos = population(:, 2);
    
    for i = 1:(populationSize - 1)
        for j = (1 + 1):populationSize
            distance = sqrt((xPos(i) - xPos(j))^2 + (yPos(i) - yPos(j))^2);
            distanceMatrix(i,j) = distance;
            distanceMatrix(j,i) = distance;
        end
    end

end