function UpdatePieChart(pieAx, partyColors, government, votes)
  
  pie(pieAx, government);
  colormap(pieAx, partyColors(1:length(government), :))

end