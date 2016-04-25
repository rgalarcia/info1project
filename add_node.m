% This function adds a node to an existing graph
function [g2] = add_node(g1, node_name)
    g2 = g1;
    
    % We check whether node_name is already present in g1 or not
    i = 1;
    found = false;
    while (i <= length(g1.nodes) && ~found) % Search algorithm
        if (g1.nodes(i) == node_name)
            found = true;
        end
        i = i + 1;
    end
    
    % If node_name was not present in g1, we add it to g2
    if (~found)
        index = length(g2.nodes) + 1;
        g2.nodes(index) = node_name;
    end
    
end