% This function creates and returns an empty path of nodes

function [p] = create_path()

    % TNodePath defines a node in a path
    % A node is defined by its id (node) and the cost
    % to arrive to it from the beggining of the path (weight)
    
    TNodePath = struct('node', 0, 'weight', 0.0);
    
    % TPath defines a list of nodes in a path
    TPath = struct('points', TNodePath);
    
    p = TPath;
  
end