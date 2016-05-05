% This function receives a yet-to-fill Airports vector and a NavPoints
% vector and completes the Airports one with the information that can
% be found in NavPoints (such as the ID, location of SIDS and STARS;
% and the location of the airport -location of the first SID-).

function Airports_full = locate_airports(Airports, NP)
    
    n = 1;
    j = 1; % Loading var
    while (n <= length(Airports))
        if (j == 1)
            fprintf('Processing data.');
        end
        
        i = 1; % SIDS CODE
        while (i <= length(Airports(n).SIDS))
            [lat,lon,id] = find_navPoint(NP, Airports(n).SIDS(i).NavPointName); % We retrieve the basic data of a navPoint
            Airports(n).SIDS(i).long = lon; % And we write it to the Airports vector
            Airports(n).SIDS(i).lat = lat;
            Airports(n).SIDS(i).NavPointID = id;
            i = i + 1;
            
            j = j + 1;
            if (mod(j, 100)==0) % Every 100 iterations, put a dot
                fprintf('.');
            end
        end
        
        i = 1; % STARS CODE
        while (i <= length(Airports(n).STARS))
            [lat,lon,id] = find_navPoint(NP, Airports(n).STARS(i).NavPointName);
            Airports(n).STARS(i).long = lon;
            Airports(n).STARS(i).lat = lat;
            Airports(n).STARS(i).NavPointID = id;
            i = i + 1;
            
            j = j + 1;
            if (mod(j, 100)==0) % Every 100 iterations, put a dot
                fprintf('.');
            end
        end
        
        % The airports location is the location of the first SID
        Airports(n).long = Airports(n).SIDS(1).long;
        Airports(n).lat = Airports(n).SIDS(1).lat;
        
        n = n + 1;
    end
    fprintf('\nDone!\n\n');
    
    Airports_full = Airports;
end   