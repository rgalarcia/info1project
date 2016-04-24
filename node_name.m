% Given the index of a node which is supposed to exist in a graph,
% this function returns the name of the node or, if it can not find it,
% returns the string 'ERROR' instead.
function [name] = node_name (g, node_index)
    if (node_index <= length(g.nodes))
        name = g.nodes(node_index);
    else
        name = 'ERRO';
    end
end


