function UpdatePieChart(pieAx, partyColors, government)
  
  pie(pieAx, government);
  colormap(pieAx, partyColors(1:length(government), :))

end