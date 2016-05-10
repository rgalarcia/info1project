% Given a node, this function returns the neighbors of the node
% (this is, the nodes to which this node is connected through a segment)
function [list_of_node_indexes] = neighbor_nodes (g, src_index)
    V = [];
    i = 1;
    n = 1;
    while (n <= length(g.segments)) % Loop algorithm
        if (g.segments(n).source == src_index) 
            V(i) = g.segments(n).destination; %neighbor
            i = i+1;
        end
        n = n+1;
    end

    list_of_node_indexes = V;

end