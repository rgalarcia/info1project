% Given a path 'p', and a new node (with index 'n' & weight 'w'),
% this function returns a new path 'p2' with the mentioned node
% inserted in it.

function [p2] = add_node_to_path (p, n, w)
    
    p2 = p; % We copy p into p2
 
    if (p2.points(1).node == 0)
        p2.points(1).node = n; % if first node is 0, we have to rewrite
        p2.points(1).weight = w; 
    else 
        size = length(p2.points);
        p2.points(size+1).node = n; % We add a new node of index n to p2
        p2.points(size+1).weight = w; % We add a new node of weight w to p2
    end 
    
 end