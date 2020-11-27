function individual = GenerateIndividual(parent1, parent2, neighbourhoodSize, gridSize, nParameter, nParty)

    individual = zeros(1,size(parent1,2)); 
    
    p1PosX = parent1(1);
    p1PosY = parent1(2);
    p2PosX = parent2(1);
    p2PosY = parent2(2);
    xMin = ((p1PosX + p2PosX)/2)-neighbourhoodSize;
    xMax = ((p1PosX + p2PosX)/2)+neighbourhoodSize;
    yMin = ((p1PosY + p2PosY)/2)-neighbourhoodSize;
    yMax = ((p1PosY + p2PosY)/2)+neighbourhoodSize;
    newX = xMin + rand * (xMin - xMax);
    newY = yMin + rand * (yMax - yMin);
    
    if newX > gridSize/2
        newX = gridSize/2;
    elseif newX < -gridSize/2
        newX = -gridSize/2;
    end
    if newY > gridSize/2
        newY = gridSize/2;
    elseif newY < -gridSize/2
        newY = -gridSize/2;
    end
    
    for i = 1:nParameter
        r = normrnd(1,0.1);
        if rand < 0.5
            individual(2+i) = parent1(2+i) * r;
        else
            individual(2+i) = parent2(2+1) * r;
        end
        if individual(2+i) > 1
            individual(2+i) = 1;
        end
    end
    for i = 1:nParty
        r = normrnd(1,0.1);
        if rand < 0.5
            individual(2 + nParameter + i) = parent1(2 + nParameter + i) * r;
        else
            individual(2 + nParameter + i) = parent2(2 + nParameter + i) * r;
        end
        if individual(2 + nParameter + i) > 1
            individual(2 + nParameter + i) = 1;
        end
    end
           
    individual(1) = newX;
    individual(2) = newY;
    
end
