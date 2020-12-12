function votePlot = InitializeVotePlot(voteCount, hAxes, partyColors)

  votePlot = plot(hAxes, voteCount);
  
  % Implement the colors
  for i = 1:size(voteCount, 2)
    set(votePlot(i), 'Color', partyColors(i, :));
  end
  
  set(hAxes, 'Color', 'k');
  ylim(hAxes, [0, 1]);
  xlabel(hAxes, 'Generation');
  ylabel(hAxes, 'Vote count');
  title(hAxes, 'Vote distribution');

end