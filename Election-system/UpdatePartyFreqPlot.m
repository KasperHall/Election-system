function UpdatePartyFreqPlot(hAxes, government)

  nParty = length(hAxes.Children);
  [~, col] = find(government);
  
  % Children are sorted in reverse order
  for i = 1:size(col, 1)
    partyIndex = col(i);
    oldVal = hAxes.Children(nParty-(partyIndex-1)).YData;
    hAxes.Children(nParty-(partyIndex-1)).YData = oldVal + 1;
  end



end