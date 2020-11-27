function partyColors = InitializePartyColors()

str = '#FF0000';
partyColor1 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#00FF00';
partyColor1 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#00FF00';
partyColor3 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#FFFF00';
partyColor4 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#FF00FF';
partyColor5 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#00FFFF';
partyColor6 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;

partyColors = [partyColor1, partyColor2, partyColor3, partyColor4, partyColor5, partyColor6];

end

