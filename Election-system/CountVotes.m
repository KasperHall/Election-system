function [nOfVotes,votes] = CountVotes(populationOpinions, greedParameter)

        votes = zeros(1,size(populationOpinions,1));
    
        for i = 1:size(populationOpinions,1)
            [~, index] = max(populationOpinions(i,:));
            if rand < greedParameter
                index = randi([1, size(populationOpinions,2)]);
            end
            votes(i) = index;
        end
        nOfVotes = accumarray(votes(:),1);
        
end
        
  