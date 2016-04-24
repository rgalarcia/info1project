% This function creates and returns an empty graph
function [g] = create_graph()
    Tsegment = struct('source', 0, 'destination', 0, 'weight', 0);
    Tgraph = struct('nodes', [], 'segments', Tsegment);
    g = Tgraph;
end