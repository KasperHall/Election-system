function individual = GenerateIndividual(parent1, parent2, neighbourhoodSize, gridSize)


    %Not needed at the moment, might be needed when the individual isn't a copy of a parent.
    %individual = zeros(1,size(parent1,2)); 
    
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
    
    
    % Individual is currently a copy of the first parent at a new location
    % This will have to be changed later
    individual = parent1;
    individual(1) = newX;
    individual(2) = newY;
    
end
