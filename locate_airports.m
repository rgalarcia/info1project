% This function receives a yet-to-fill Airports vector and a NavPoints
% vector and completes the Airports one with the information that can
% be found in NavPoints (such as the ID, location of SIDS and STARS;
% and the location of the airport -location of the first SID-).

function Airports_full = locate_airports(Airports, NP)
    
    n = 1;
    while (n <= length(Airports))
        
        i = 1; % SIDS CODE
        while (i <= length(Airports(n).SIDS))
            [lat,lon,id] = find_navPoint(NP, Airports(n).SIDS(i).NavPointName); % We retrieve the basic data of a navPoint
            Airports(n).SIDS(i).long = lon; % And we write it to the Airports vector
            Airports(n).SIDS(i).lat = lat;
            Airports(n).SIDS(i).NavPointID = id;
            i = i + 1;
        end
        
        i = 1; % STARS CODE
        while (i <= length(Airports(n).STARTS))
            [lat,lon,id] = find_navPoint(NP, Airports(n).STARTS(i).NavPointName);
            Airports(n).STARTS(i).long = lon;
            Airports(n).STARTS(i).lat = lat;
            Airports(n).STARTS(i).NavPointID = id;
            i=i+1;
        end
        
        % The airports location is the location of the first SID
        Airports(n).long = Airports(n).SIDS(1).long;
        Airports(n).lat = Airports(n).SIDS(1).lat;
        
        n = n + 1;
    end
    
    Airports_full = Airports;
end   