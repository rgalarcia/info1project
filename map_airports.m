% This function receives a vector of airports and two letters that identify
% a country (countryId). It iterates throughout the list of airports,
% fecthing those who are located in the specified country. Then, it writes
% a KML file with all the airports present in that country, so that the
% data can be graphically displayed using the Google Earth software.

function map_airports (Airports, countryId)
    
    filename = 'AirportsMap.kml';
    f = fopen(filename, 'w+');
    
    % KML file creation
    fprintf(f, '<?xml version="1.0" encoding="UTF-8"?>\n');
    fprintf(f, '<kml xmlns="http://www.opengis.net/kml/2.2">\n');
    
    i = 1;
    while (i <= length(Airports))
        cntry = strcat(Airports(i).name(1), Airports(i).name(2));
        
        % If this airport's country is the one we are looking for, we
        % insert the airport's data into the KML file.
        if (cntry == countryId)
            
            name = Airports(i).name;
            lat = Airports(i).lat;
            long = Airports(i).long;

            fprintf(f, '<Placemark>\n');
            fprintf(f, '<name>\n');
            fprintf(f, '%s\n', name);
            fprintf(f, '</name>\n');

            fprintf(f, '<description>\n');
            fprintf(f, '%s Airport\n', name);
            fprintf(f, '</description>\n');
            fprintf(f, '<Point>\n');
            fprintf(f, '<coordinates>%f, %f, 0</coordinates>\n', lat, long);
            fprintf(f, '</Point>\n');
            fprintf(f, '</Placemark>\n');
        
        end
        
        i = i + 1;
    end
    
    fprintf(f, '</kml>');
end