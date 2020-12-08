function individual = GenerateIndividual(parent1, parent2, ...
  neighbourhoodSize, gridSize, nParameter, nParty, parameterDeviation, ...
  opinionDeviation, positionDeviation)

  nChild = size(parent1, 1);
%   individual = -ones(size(parent1)); 

  p1PosX = parent1(:, 1);
  p1PosY = parent1(:, 2);
  p2PosX = parent2(:, 1);
  p2PosY = parent2(:, 2);
  xMin = ((p1PosX + p2PosX)./2);%-neighbourhoodSize;
  xMax = ((p1PosX + p2PosX)./2);%+neighbourhoodSize;
  yMin = ((p1PosY + p2PosY)./2);%-neighbourhoodSize;
  yMax = ((p1PosY + p2PosY)./2);%+neighbourhoodSize;
  newX = xMin + rand(nChild, 1) .* (xMax - xMin);
  newY = yMin + rand(nChild, 1) .* (yMax - yMin);

  % Hard boundary
  newX(newX > gridSize/2) = gridSize/2;
  newX(newX < -gridSize/2) = -gridSize/2;

  newY(newY > gridSize/2) = gridSize/2;
  newY(newY < -gridSize/2) = -gridSize/2;

  r1 = normrnd(0, parameterDeviation, nChild, nParameter);
  iFrom1 = logical(randi([0, 1], nChild, nParameter));

  newParameters = (iFrom1 .* parent1(:, 2+(1:nParameter))...
    + (~iFrom1) .* parent2(:, 2+(1:nParameter))) + r1;

  newParameters(newParameters > 1) = 1;
  newParameters(newParameters < 0) = 0;

  r2 = normrnd(0, opinionDeviation, nChild, nParty); 
  iFrom2 = logical(randi([0, 1], nChild, nParty));
  newOpinions = (iFrom2 .* parent1(:, 2+nParameter+(1:nParty))...
    + (~iFrom2) .* parent2(:, 2+nParameter+(1:nParty))) + r2;

  newOpinions(newOpinions < 0) = 0;
  newOpinions(newOpinions > 1) = 1;
  newOpinions = newOpinions ./ sum(newOpinions, 2);
  newOpinions(isnan(newOpinions)) = 1./size(newOpinions, 2);

  r3 = normrnd(0, positionDeviation, nChild, 2);
  newPositions = [newX, newY] + r3;
  
  individual = [newPositions, newParameters, newOpinions];
end
