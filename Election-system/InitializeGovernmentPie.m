function pieAx = InitializeGovernmentPie(government, partyColors)

  pieAx = axes('Position',[0.83 0.82 0.15 0.15]);
  pie(pieAx, ones(1, sum(government)));
  colormap(pieAx, partyColors(logical(government), :))
  title('Goverment dist')
  
end