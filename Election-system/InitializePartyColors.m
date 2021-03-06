function partyColors = InitializePartyColors()

str = '#FF0000';  % Red
partyColor1 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#00FF00';  % Lime
partyColor2 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#0000FF';  % Blue
partyColor3 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#FFFF00';  % Yellow
partyColor4 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#FF00FF';  % Magenta
partyColor5 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#00FFFF';  % Cyan
partyColor6 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#757575';  % Gray
partyColor7 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#F49907';  % Orange
partyColor8 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#800080';  % Purple
partyColor9 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
str = '#008000';  % Green
partyColor10 = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;

partyColors = [partyColor1; partyColor2; partyColor3; partyColor4; ...
               partyColor5; partyColor6; partyColor7; partyColor8; ...
               partyColor9; partyColor10];
end


