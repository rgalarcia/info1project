% Given a path (list of nodes) and the index of a node, this
% function finds the node inside the path and retuns its cost.
% If it does not find the node, it returns -1.

function [result] = path_weight_node (p, ind)
    
    n = 1;
    found = false;
    result = -1; % If we do not find the node, we return -1
    
    while (n <= length(p) && ~found) % Search algorithm
        
        in = p(n).node; % We check each node of the path
        
        if (in == ind) % If this is the node we were looking for
            found = true;
            result = p(n).weight; % We return the weight
        end
        
        n = n + 1;
    end
    
end