%This function looks for the navigation point with name navPoint_name and 
%returns its location and identifier. 
%If error, a message is shown and the returned  values are -1.
function [lat, lon, id]=find_navPoint(NP,navPoint_name)
lat=-1; %Si no els troba romana aquest valor. 
lon=-1; 
id=-1;
i=1;
found=false;
while (found==false && i<=length(NP))
 if strcmp(navPoint_name,NP(i).NavPointName)
     lat=NP(i).lat;   %Ara canvien. 
     lon=NP(i).long;
     id=NP(i).NavPointID;
     found=true;
 end
 i=i+1;
end 
if found==false
    fprintf('error')
end 
end 