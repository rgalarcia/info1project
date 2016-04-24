% Given a node, this functions tries to find whether it is present in a
% specified graph, and if so, return the index where it can be found
function [index] = node_index (g,node_name)
    index = -1; 
    i = 1;
    while (i <= length(g.nodes) && (index == -1))
        if (g.nodes(i) == node_name)
            index = i;
        end
        i = i + 1;
    end
end 


