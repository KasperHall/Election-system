function [newCountryParameters, government, votes] = RunElection(parties, ...
  populationOpinions, countryParameters, votingSystem)
    % Parties = nParties x Their set parameters
    % Opinions = nIndividuals x their opinions on the parties
    % parameters = the parameters of the country
    % system = choosen election system
    %
    % newCountryParameters = updated parameters 1 x nParamiters
    % government = nParties x 1 vector with values showing the size of the
    % party in the government ( for now 1 party has all the power (FPP))
    % Votes = nParties x 1 vector with the amount of votes each party gets 
    
    
    votes = zeros(size(parties,1),1);
    government = zeros(size(parties,1),1, 'logical');
    if votingSystem == "FPP"
        for i = 1:size(populationOpinions,1)
            [~, index] = max(populationOpinions(i,:));
            votes(index) = votes(index) + 1;
        end
        
    % atm the same number of votes leads to the first tied party in the list to win
    [~,index] = max(votes);
    government(index) = true;
    
    % Change parameters 20% toward the new leading party
    changeInParameters = countryParameters - parties(index,:);
    newCountryParameters = countryParameters - (changeInParameters * 0.2);
    end
    
    if votingSystem == "PLPR"
       
        %Election system used in sweden
        
    end

        
end