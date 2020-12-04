function [newCountryParameters, government, votes] = RunElection(parties, ...
  populationOpinions, countryParameters, votingSystem, greedParameter, ...
  countryParameterChangeRate)
    % Parties = nParties x Their set parameters
    % Opinions = nIndividuals x their opinions on the parties
    % parameters = the parameters of the country
    % system = choosen election system
    %
    % newCountryParameters = updated parameters 1 x nParamiters
    % government = nParties x 1 vector with values showing the size of the
    % party in the government ( for now 1 party has all the power (FPP))
    % Votes = nParties x 1 vector with the amount of votes each party gets 
    
    votes = zeros(1,size(populationOpinions,1));
    government = zeros(size(parties,1),1, 'logical');
    if votingSystem == "FPP"
        for i = 1:size(populationOpinions,1)
            [~, index] = max(populationOpinions(i,:));
            if rand < greedParameter
                index = randi([1, size(populationOpinions,2)]);
            end
            votes(i) = index;
        end
        
    % atm the same number of votes leads to the first tied party in the list to win
    nrOfVotes = accumarray(votes(:),1);
    [~, index] = max(nrOfVotes);
    government(index) = true;
    
    % Change parameters countryParameterChangeRate toward the new leading party
    changeInParameters = countryParameters - parties(index,:);
    newCountryParameters = countryParameters - (changeInParameters * countryParameterChangeRate);
    end
    
    if votingSystem == "PLPR"
       
        %Election system used in sweden
        
    end

        
end