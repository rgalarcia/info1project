% This function creates and returns an empty graph
function [g] = create_graph()
    Tsegment = struct('source', 0, 'destination', 0, 'weight', 0); % Tsegment struct definition (needed to define Tgraph)
    Tgraph = struct('nodes', [], 'segments', Tsegment); % Tgraph struct definition
    g = Tgraph;
end