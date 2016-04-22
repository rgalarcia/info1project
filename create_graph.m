function [g] = create_graph() % This function creates an empty graph
    Tgraph = struct('nodes', [], 'segments', struct());
    g = Tgraph;
end