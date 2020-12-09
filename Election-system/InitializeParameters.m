function parameters = InitializeParameters(nParameter,nVotingSystems)
  
  parameters = zeros(1,nParameter,nVotingSystems);
  parameters(:,:,1) = rand(1, nParameter);
  for i = 2:nVotingSystems
    parameters(:,:,i) = parameters(:,:,1);
  end
end
