function [nOfVotes,votes] = CountVotes(populationOpinions, greedParameter)

        votes = zeros(1,size(populationOpinions,1));
    
        for i = 1:size(populationOpinions,1)
            [~, index] = max(populationOpinions(i,:));
            if rand < greedParameter
                possibleIndexes = find(populationOpinions(i,:) ~= -1);
                indLength = size(possibleIndexes,2);
                index = randi(indLength);
                index = possibleIndexes(index);
            end
            votes(i) = index;
        end
%         nOfVotes = accumarray(votes(:),1);
        [gC, gR] = groupcounts(votes(:));
        nOfVotes = zeros(size(populationOpinions, 2), 1);
        nOfVotes(gR) = gC;
end
        
  