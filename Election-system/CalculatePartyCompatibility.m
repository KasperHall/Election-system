function compatibilityMatrix = CalculatePartyCompatibility(partyParameters, nParty)

    compatibilityMatrix = zeros(nParty);

    for i = 1:nParty
        for j = i+1:nParty 
            compatibility = ComputeHappiness(partyParameters(i,:),partyParameters(j,:));
            compatibilityMatrix(i,j) = compatibility;
            compatibilityMatrix(j,i) = compatibility;
        end
    end

end