function individual = GenerateIndividual(parent1, parent2, ...
  neighbourhoodSize, gridSize, nParameter, nParty, parameterDeviation, ...
  opinionDeviation, positionDeviation)

  nChild = size(parent1, 1);
  individual = zeros(size(parent1)); 

  p1PosX = parent1(:, 1);
  p1PosY = parent1(:, 2);
  p2PosX = parent2(:, 1);
  p2PosY = parent2(:, 2);
  xMin = ((p1PosX + p2PosX)./2)-neighbourhoodSize;
  xMax = ((p1PosX + p2PosX)./2)+neighbourhoodSize;
  yMin = ((p1PosY + p2PosY)./2)-neighbourhoodSize;
  yMax = ((p1PosY + p2PosY)./2)+neighbourhoodSize;
  newX = xMin + rand(nChild, 1) .* (xMax - xMin);
  newY = yMin + rand(nChild, 1) .* (yMax - yMin);

  % Hard boundary
  newX(newX > gridSize/2) = gridSize/2;
  newX(newX < -gridSize/2) = -gridSize/2;

  newY(newY > gridSize/2) = gridSize/2;
  newY(newY < -gridSize/2) = -gridSize/2;

  r = normrnd(0, parameterDeviation, nChild, nParameter);
  iFrom = logical(randi([0, 1], nChild, nParameter));

  individual(:, 2+(1:nParameter)) = (iFrom .* parent1(:, 2+(1:nParameter))...
    + (~iFrom) .* parent2(:, 2+(1:nParameter))) + r;

  individual(individual(:, 2+(1:nParameter)) > 1) = 1;
  individual(individual(:, 2+(1:nParameter)) < 0) = 0;

  r = normrnd(0, opinionDeviation, nChild, nParty); 
  iFrom = logical(randi([0, 1], nChild, nParty));
  individual(:, 2+nParameter+(1:nParty)) = (iFrom .* parent1(:, 2+nParameter+(1:nParty))...
    + (~iFrom) .* parent2(:, 2+nParameter+(1:nParty))) + r;

  individual(individual(:, 2+nParameter+(1:nParty)) > 1) = 1;
  individual(individual(:, 2+nParameter+(1:nParty)) < 0) = 0;

  r = normrnd(0, positionDeviation, nChild, 2); 
  individual(:, [1, 2]) = [newX, newY] + r;

end
