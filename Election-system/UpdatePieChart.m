function UpdatePieChart(pieAx, partyColors, government)
  
  if size(government, 1) > 1
    pie(pieAx, government(end, :));
    colormap(pieAx, partyColors(1:size(government, 2), :))
  else
    pie(pieAx, government);
    colormap(pieAx, partyColors(1:size(government, 2), :))
  end

end