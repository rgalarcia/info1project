% Given a path 'p', and a new node (with index 'n' & weight 'w'),
% this function returns a new path 'p2' with the mentioned node
% inserted in it.

function [p2] = add_node_to_path (p, n, w)
    
    p2 = p; % We copy p into p2
    
    p2(length(p2)+1).node = n; % We add a new node of index n to p2
    p2(length(p2)+1).weight = w; % We add a new node of weight w to p2
    
end