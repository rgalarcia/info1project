% The purpose of this function is to read a vector of Airports
% and output to a file the name and the location of each of the
% airports.

function write_airports (Airports)

    % We try to open the file where we will save data    
    filename = 'AirportsLoc.txt';
    f = fopen(filename, 'w+');
    % We make sure that the file was properly opened
    if (f == -1)
        fprintf('write_airports.m: An error was spotted while trying to open %s\n', filename);
        return;
    else % If the file was properly opened

        % Now we iterate throughout the structure reading name,
        % latitude and longitude for each airport, and writing the data
        % into the specified file, properly separated by lines
        i = 1;
        while (i <= Airports.length())
            fprintf(f, '%s\n', Airports(i).name);
            fprintf(f, '%f %f\n', Airports(i).lat, Airports(i).long);
            i = i + 1;
        end
    
    end
    
end