function UpdatePartyFreqPlot(hAxes, government)

  nParty = length(hAxes.Children);
%   [~, col] = find(government);
%   
%   % Children are sorted in reverse order
%   for i = 1:size(col, 1)
%     partyIndex = col(i);
%     oldVal = hAxes.Children(nParty-(partyIndex-1)).YData;
%     hAxes.Children(nParty-(partyIndex-1)).YData = oldVal + 1;
%   end

  timesSeated = sum(government > 0, 1);

  for partyIndex = 1:size(timesSeated, 2)
    oldVal = hAxes.Children(nParty-(partyIndex-1)).YData;
    hAxes.Children(nParty-(partyIndex-1)).YData = oldVal + timesSeated(partyIndex);
  end

end