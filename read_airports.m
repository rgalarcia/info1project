function [Airports] = read_airports()
    Tnavpoint=struct('NavPointID', 0, 'NavPointName', ' ', 'long', 0.0, 'lat', 0.0);
    Tairports = struct('name',' ', 'SIDS', Tnavpoint, 'STARTS', Tnavpoint, 'long', 0.0, 'lat', 0.0);
    
    Airports = Tairports;
    
    f = fopen('Airports.txt', 'r');
    
    r = 1;
    
    if(f == -1)
        disp('ERROR');
    end
    
    while (~feof(f))
        Airports.name = fgetl(f);

        Airports.SIDS.NavPointName = strsplit(fgetl(f)); 

        Airports.STARTS.NavPointName = strsplit(fgetl(f));
        
        Airports(r) = Airport;

        r = r + 1;
    end
    
    Aiports = Airport;
end