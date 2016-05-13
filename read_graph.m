function [g] = read_graph()

    Tnode = struct('name', '', 'latitude', 0.0, 'longitude', 0.0, 'type', ''); % Tnode struct definition (needed to define Tgraph)
    Tsegment = struct('source', 0, 'destination', 0, 'weight', 0.0); % Tsegment struct definition (needed to define Tgraph)
    Tgraph = struct('nodes', Tnode, 'segments', Tsegment); % Tgraph struct definition
    
    %  Read NavPoints
    NP = read_navPoints();
    navpoints = Tnode;
    
    i = 1;
    while (i <= length(NP))
        navpoints(i).name = NP(i).NavPointName;
        navpoints(i).latitude = NP(i).lat;
        navpoints(i).longitude = NP(i).long;
        navpoints(i).type = 'navpoint';
        i = i + 1;
    end
    
    % Read Segments
    segments = Tsegment;
    f = fopen('Segments.txt', 'r');
    
    i = 1;
    fprintf('Reading Segments.');
    while(~feof(f))
        line = fgetl(f);
        elements = strsplit(line);
        segments(i).source = elements(1);
        segments(i).destination = elements(2);
        segments(i).weight = elements(3);
        i = i + 1;
        
        if (mod(i, 500)==0) % Every 500 iterations, print a dot
            fprintf('.');
        end
    end
    fprintf('\nDone!\n\n');
    
    % Return data
    g = Tgraph;
    g.nodes = navpoints;
    g.segments = segments;
end