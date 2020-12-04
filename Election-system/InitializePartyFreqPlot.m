function InitializePartyFreqPlot(government, hAxes, partyColors)

  nParty = size(government, 1);
  parties = 1:nParty;
  
  hold(hAxes, 'on');
  for i = parties
    bar(hAxes, i, 1);
    hAxes.Children(1).FaceColor = partyColors(i, :);
  end
  hold(hAxes, 'off');
end