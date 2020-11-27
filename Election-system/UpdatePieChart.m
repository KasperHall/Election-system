function UpdatePieChart(pieAx, partyColors, government, votes)
  
  pie(pieAx, votes(government));
  colormap(pieAx, partyColors(government, :))

end