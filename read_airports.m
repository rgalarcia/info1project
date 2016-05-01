function [Airports] = read_airports()
    Tnavpoint=struct('NavPointID', 0, 'NavPointName', ' ', 'long', 0.0, 'lat', 0.0);
    Tairports = struct('name',' ', 'SIDS', Tnavpoint, 'STARTS', Tnavpoint, 'long', 0.0, 'lat', 0.0);
    Airports = Tairports;
    f = fopen('Airports.txt', 'r');
    r = 1;  %row 1
    
    if(f == -1)
        disp('ERROR');
    end
    while (~feof(f))
        Airports(r).name = fgetl(f);
        V=strsplit(fgetl(f));
        V=cellstr(V)
        n=1
        while (n<=length(V))
            Tnavpoint.NavPointName=V{n}
            Airports(r).SIDS(n) = Tnavpoint;
            n=n+1
        end
        V=strsplit(fgetl(f));     %crea: V=['ANAMA';'GONOS';'NOTAR';'VALGA'] : cadena de caracters
        V=cellstr(V)              %cadena de caracters --> vector de strings
        n=1
        while (n<=length(V))
            Tnavpoint.NavPointName=V{n}
            Airports(r).STARTS(n) = Tnavpoint;
            n=n+1
        end
        r= r+1;
    end
end