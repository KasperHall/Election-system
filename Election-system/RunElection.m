function [newCountryParameters, government, votes] = RunElection(parties, ...
  populationOpinions, countryParameters, votingSystem, greedParameter, ...
  countryParameterChangeRate, compatibilityMatrix)
    % Parties = nParties x Their set parameters
    % Opinions = nIndividuals x their opinions on the parties
    % parameters = the parameters of the country
    % system = choosen election system
    %
    % newCountryParameters = updated parameters 1 x nParamiters
    % government = nParties x 1 vector with values showing the size of the
    % party in the government ( for now 1 party has all the power (FPP))
    % Votes = nParties x 1 vector with the amount of votes each party gets 
    
%     government = zeros(size(parties,1),1, 'logical');
    government = zeros(1, size(parties,1));
    votes = zeros(1,size(populationOpinions,1));
    
    if votingSystem == "FPP"
        [nOfVotes, votes] = CountVotes(populationOpinions, greedParameter);
        
        % atm the same number of votes leads to the first tied party in the list to win
        [~, index] = max(nOfVotes);
        government(index) = 1;
    
        % Change parameters countryParameterChangeRate toward the new leading party
        changeInParameters = countryParameters - parties(index,:);
        newCountryParameters = countryParameters - (changeInParameters * countryParameterChangeRate);
    end
    
    if votingSystem == "PLPR"
        
        [nOfVotes, votes] = CountVotes(populationOpinions, greedParameter);
        nParties = size(populationOpinions,2);
        nIndividuals = size(populationOpinions,1);
        for i = 1:nParties
            government(i) = nOfVotes(i)/nIndividuals;
        end
        [value, index] = max(government);
        governmentParties = (index);
        while value < 0.5 %needs majority
         [val, idx] = max(compatibilityMatrix(index,:));
         governmentParties = [governmentParties,idx];
         value = value + val;
         compatibilityMatrix(index,idx) = 0;
        end 
        
        
        for i = 1:size(governmentParties,2)
            changeInParameters = countryParameters - parties(governmentParties(i),:);
        end
            newCountryParameters = countryParameters - (changeInParameters * countryParameterChangeRate);
        
        
       
        %Election system used in sweden
        
    end

        
end