function UpdatePartyFreqPlot(hAxes, government)

  nParty = length(hAxes.Children);
  index = find(government);
  
  % Children are sorted in reverse order
  for i = index
    oldVal = hAxes.Children(nParty-(i-1)).YData;
    hAxes.Children(nParty-(i-1)).YData = oldVal + 1;
  end



end