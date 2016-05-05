% This function reads a file with a list of airports
% and its information and returns a Tairports structure
% with the processed data

function [Airports] = read_airports()

    TnavPoints = struct('NavPointID', 0, 'NavPointName', ' ', 'long', 0.0, 'lat', 0.0);
    Tairports = struct('name', ' ', 'SIDS', TnavPoints, 'STARS', TnavPoints, 'long', 0.0, 'lat', 0.0);
    Airports = Tairports;
    
    f = fopen('Airports.txt', 'r');
    
    if (f == -1)
        disp('ERROR');
    else
        r = 1;  %row 1
        while (~feof(f))
            % We read the name of the airport
            Airports(r).name = fgetl(f);
            
            % We read the line with the list of
            % SIDS procedures of the airport
            V = strsplit(fgetl(f));
            V = cellstr(V);
            
            n = 1;
            while (n <= length(V))
                TnavPoints.NavPointName = V{n};
                Airports(r).SIDS(n) = TnavPoints;
                n = n + 1;
            end
            
            % We read the line with the list of
            % STARS procedures of the airport
            V = strsplit(fgetl(f));      %crea: V=['ANAMA';'GONOS';'NOTAR';'VALGA'] : cadena de caracters
            V = cellstr(V);              %cadena de caracters --> vector de strings
            
            n = 1;
            while (n <= length(V))
                TnavPoints.NavPointName = V{n};
                Airports(r).STARS(n) = TnavPoints;
                n = n + 1;
            end
            
            r = r + 1;
        end
    end
end