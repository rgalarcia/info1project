function Airports_full=locate_airports(Airports,NP)
    n=1;
while (n<=length(Airports))
    i=1;
    while (i<=length(Airports(n).SIDS))
        [lat,lon,id]=find_navPoint(NP,Airports(n).SIDS(i).NavPointName);
        Airports(n).SIDS(i).long=lon;
        Airports(n).SIDS(i).lat=lat;
        Airports(n).SIDS(i).NavPointID=id;
        i=i+1;
    end
    i=1;
    while (i<=length(Airports(n).STARTS))
        [lat,lon,id]=find_navPoint(NP,Airports(n).STARTS(i).NavPointName);
        Airports(n).STARTS(i).long=lon;
        Airports(n).STARTS(i).lat=lat;
        Airports(n).STARTS(i).NavPointID=id;
        i=i+1;
    end
    Airports(n).long=Airports(n).SIDS(1).long;
    Airports(n).lat=Airports(n).SIDS(1).lat;
    n=n+1
end
Airports_full=Airports;
end 

    