Airports = read_airports(); % Read the list of airports and save it into Airports

if (isempty(Airports))
   disp ('There was an error while trying to process the airports information.');
end

NavPoints = read_navPoints(); % Read the list of navpoints and save it into NavPoints

if (isempty(NavPoints))
   disp ('There was an error while trying to process the navpoints information.');
end

% Fill Airports completely with the complementary information found in NavPoints
Airports = locate_airports(Airports, NavPoints);
barcelona.sids = airport_sids(Airports, 'LEBL'); % Return the vector of SIDS for BCN
barcelona.stars = airport_stars(Airports, 'LEBL'); % Return the vector of STARS for BCN

if (isempty(barcelona.sids))
    disp('SIDS not found for LEBL (BCN) airport');
end

if (isempty(barcelona.stars))
    disp('STARS not found for LEBL (BCN) airport');
end

sids % Show SIDS
stars % Show STARS

write_airports(Airports) % Saves airports location data into an external file (AirportsLoc.txt)
plot_airports(Airports) % Plots the airports for each country
map_airports(Airports, 'LE') % Generates a KML file for Google Earth containing the airports of a country ('LE' = Spain)