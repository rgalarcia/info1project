function [g2] = complete_graph(g,Airports)

  %  Read NP & locate_airports
    NP = read_navPoints();
    Airports = locate_airports(Airports,NP);
    
    i = length(g.nodes);
    j = length(g.segments)+1;
    n = 1;
    navpoints = g.nodes;
    segments = g.segments;
    while (n <= length(Airports))
        navpoints(i).name = Airports(n).name;
        navpoints(i).latitude = Airports(n).lat;
        navpoints(i).longitude = Airports(n).long;
        navpoints(i).type = 'airport';
        segments(j).source = i;
        segments(j).destination = Airports(n).SIDS.NavPointID;
        segments(j).weight = 10;
        segments(j+1).source = i;
        segments(j+1).destination = Airports(n).STARS.NavPointID;
        segments(j+1).weight = 10;
        n = n + 1;
        i = i + 1;
        j = j + 2;
    end 
    fprintf('\nDone!\n\n');
    
    % Return data
    %g2 = Tgraph;
    g2.nodes = navpoints;
    g2.segments = segments;
end