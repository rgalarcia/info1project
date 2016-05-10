function [porDonde] = shortest_path (g, nStart, nEnd, verbose)

    path_list = []; % We create a vector of path
    path = create_path(); % We create the first path and add it to the list
    path = add_node_to_path(path, nStart, 0); % We fill the first path with the origin node
    
    i = 1;
    path_list(i) = path;
    while ()
        if (isempty(path_list)) % If the list of paths is empty, there is no possible route
            fprintf('No possible route to the desired destination\n');
        else
            % We calculate which of the paths of the 
            % list of paths has the minimum cost
            minimum_path = path_minimum_weight(path_list);
            
            % Does it lead to the desired destination?
            
            lastnode = path_list(minimum_path).points(length(path_list(minimum_path))).node;
            if (lastnode == nEnd)
                % We found the route
            else
            
                prov_path = path_list(minimum_path); % We temporary save the path
                path_list = remove_path(path_list, minimum_path); % We get rid of it

                % But we still check its neighbors
                neighbors = neighbor_nodes(g, lastnode);

                j = 1;
                while (j <= length(neighbors))

                    %TODO: Search if the j'th neighbor is inside the
                    %minimum cost path (the one we deleted)
                    if (neighbors(j) )
                        
                    else
                        
                    end
                    
                end
                
            end
        end
    end

end