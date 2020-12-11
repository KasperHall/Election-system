function [newCountryParameters, government, votes] = RunElection(parties, ...
  populationOpinions, countryParameters, votingSystem, greedParameter, ...
  countryParameterChangeRate, compatibilityMatrix, nToBeElected)
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
    
    %Election system used in the US
    if votingSystem == "FPP"
        [nOfVotes, votes] = CountVotes(populationOpinions, greedParameter);
        
        % atm the same number of votes leads to the first tied party in the list to win
        [~, index] = max(nOfVotes);
        government(index) = 1;
    
        % Change parameters countryParameterChangeRate toward the new leading party
        changeInParameters = countryParameters - parties(index,:);
        newCountryParameters = countryParameters - (changeInParameters * countryParameterChangeRate);
    end
    
    %Election system used in sweden
    if votingSystem == "PLPR"
        
        [nOfVotes, votes] = CountVotes(populationOpinions, greedParameter);
        nParties = size(populationOpinions,2);
        nIndividuals = size(populationOpinions,1);
        nOfVotes = nOfVotes/nIndividuals;
        
        % From the party with the most votes, choose additional
        % compatible parties to rule the county, choose additional parties
        % until they have the majority of the votes
        [value, index] = max(nOfVotes);
        governmentParties = (index);
        while value < 0.5 
            [~, idx] = max(compatibilityMatrix(index,:));
            governmentParties = [governmentParties,idx];
            val = nOfVotes(idx);
            value = value + val;
            compatibilityMatrix(index,idx) = 0;
        end 
        
        % Decide the size of each party in the government 
        nRulingParties = size(governmentParties,2);
        for i = 1:nRulingParties 
            government(governmentParties(i)) = nOfVotes(governmentParties(i))/value;
        end
        
%         % Update the country parameters, not sure this is the way to go.
%         newCountryParameters = countryParameters;
%         for i = 1:nRulingParties
%             changeInParameters = countryParameters - parties(governmentParties(i),:);
%             newCountryParameters = newCountryParameters - (changeInParameters * countryParameterChangeRate);
%         end

        % Modified country update

        policy = government * parties;
        changeInParameters = countryParameters - policy;
        newCountryParameters = countryParameters - changeInParameters * countryParameterChangeRate;
        
    end
    
    
    if votingSystem == "STV"
        nParties = size(parties,1);
        if nToBeElected > nParties
            error("Number of elected parties can not be higher than the number of parties");
        end
       
        [~,votes] = CountVotes(populationOpinions, greedParameter);
        
        government = ones(1,nParties);
        for i = 1:(nParties-nToBeElected)
            [nOfVotes,~] = CountVotes(populationOpinions, greedParameter);
            [~,indexes] = sort(nOfVotes);
            for j = 1:nParties
                if government(indexes(j))
                    index = indexes(j);
                    break;
                end
            end
            populationOpinions(:,index) = -1;
            government(index) = 0;  
        end
        
        government = government/nToBeElected;
        elected = find(government ~= 0);
        
        changeInParameters = countryParameters - (sum(parties(elected,:), 1)/nToBeElected);
        newCountryParameters = countryParameters - (changeInParameters * countryParameterChangeRate);

        
    end

        
end