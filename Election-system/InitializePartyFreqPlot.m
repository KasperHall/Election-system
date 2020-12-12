function InitializePartyFreqPlot(government, hAxes, partyColors)

  nParty = length(government);
  parties = 1:nParty;
  
  hold(hAxes, 'on');
  for i = parties
    bar(hAxes, i, 1);
    hAxes.Children(1).FaceColor = partyColors(i, :);
  end
  
  set(hAxes, 'XTick', []);
  xlabel(hAxes, 'Party')
  ylabel(hAxes, 'Times in government')
  title(hAxes, 'Government frequncy')
  
  hold(hAxes, 'off');
end