function [newParameters, government, votes] = RunElection(parties, opinions, parameters, system)
    % Parties = nParties x Their set parameters
    % Opinions = nIndividuals x their opinions on the parties
    % parameters = the parameters of the country
    % system = choosen election system
    
    
    % newParameters = updated parameters 1 x nParamiters
    % government = nParties x 1 vector with values showing the size of the
    % party in the government ( for now 1 party has all the power (FPP))
    % Votes = nParties x 1 vector with the amount of votes each party gets 
    
    
    votes = zeros(size(parties,1),1);
    government = zeros(size(parties,1),1);
    if system == "FPP"
        for i = 1:size(opinions,1)
            [~, index] = max(opinions(i,:));
            votes(index) = votes(index) + 1;
        end
    
    [~,index] = max(votes); % atm the same number of votes leads to the first tied party in the list to win
    government(index) = 1;
    
    %change parameters 20% toward the new leading party
    changeInParameters = parameters - parties(index,:);
    newParameters = parameters - (changeInParameters * 0.2);
    end
    
    if system == "PLPR"
       
        %Election system used in sweden
        
    end

        
end