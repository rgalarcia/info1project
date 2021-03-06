function [porDonde] = shortest_path (g, nStart, nEnd, verbose)

    path_list = []; % We create a vector/list of paths
    path = create_path(); % We create the very first path to later insert it into the list
    path = add_node_to_path(path, node_index(g, nStart), 0); %	It consists of the specified origin node, with weight 0
    
    path_list{1} = path; % The first path is inserted into the list of paths
    
    if (verbose)
        % If verbose mode enabled, we print the graph information
        graph_information(g);
    end
    
    endofloop = false; % End of loop is achieved if the route is found or there is not possible route
    while (~endofloop)
        
        if (verbose)
            % We print the information of the routes in the list for
            % every iteration whenever the verbose mode is enabled
            w = 1;
            while (w <= length(path_list))
                print_path(g, path_list{w}.points);
                w = w + 1;
            end
            fprintf('----------------------------\n');
            fprintf('----------------------------\n');
        end
        
        if (isempty(path_list)) % Oops, there is no possible route
            fprintf('No possible route to the desired destination\n');
            endofloop = true; % Bye bye
            porDonde = -1;
        else
            
            %%% SITUATION %%%
            % So, apparently we are inside a loop.
            % We are provided with a list of paths.
            % Right now, we have to find, from this list of paths,
            % the one which has the minimum cost.
            % If its last node is our destination node,
            % Once we find it, we must add the neighbors of its last node
            % to the list of paths, but only if some conditions are met.
            % And then delete the path that we found to be the one with
            % the minimum possible cost.
            %%% /SITUATION %%%
            
            minimum_path = path_minimum_weight(path_list); % Which is the traitor?
            mp_lastnode = path_list{minimum_path}.points(length(path_list{minimum_path}.points)).node; % Which is its last node?
            
            if (mp_lastnode == node_index(g, nEnd)) % Its last node is the one we want to reach!
                % We found the best possible route
                porDonde = path_list{minimum_path};
                endofloop = true; % Hoorray!
            else
                %%% So, the last node of the minimum cost path is not the
                %%% destination. No problem, we will go ahead.
                
                prov_path = path_list{minimum_path}; % We temporary save the path
                path_list = remove_path(path_list, minimum_path); % We get rid of it

                % But we still check its neighbors
                neighbors = neighbor_nodes(g, mp_lastnode);

                j = 1;
                while (j <= length(neighbors))
                    
                    % We calculate the cost of the path if we add this new node
                    
                    CostePrevistoP1 = path_weight_node(prov_path.points, mp_lastnode);
                    CostePrevistoP2 = direct_cost(g, mp_lastnode, neighbors(j));
                    CostePrevisto = CostePrevistoP1 + CostePrevistoP2;
                    
                    % We look if the current neighbor exists
                    % in any of the paths of the path vector
                    k = 1;
                    i = 1;
                    found = false;
                    found_costs = [];
                    found_indexes = [];
                    
                    while (k <= length(path_list))
                        cost = path_weight_node(path_list{k}.points, neighbors(j));
                        if (cost ~= -1)
                            found = true; % We found it!
                            found_costs(i) = cost; % We add the costs of getting to the neighbour
                            found_indexes(i) = k; % We add the indexes of the paths that get to the neighbor
                            i = i + 1;
                        end
                        k = k + 1;
                    end
                    
                    insert = false; % Insert determines whether the considered path should be inserted in the list
                    
                    if (found)
                        % If there is a path that already gets to the neighbor 
                        k = 1;
                        while (k <= length(found_costs))
                            if (found_costs(k) <= CostePrevisto)
                                % We do nothing (we already have a better way
                                % to reach the neighbour node in the list of
                                % paths)
                                insert = false;
                            else
                                % This is a better way to reach the
                                % neighbor node that any path in the list
                                path_list = remove_path(path_list, found_indexes(k)); % We get rid of the other path
                                insert = true; % We have to remember later that this path has to be added to the list of paths
                            end
                            
                            k = k + 1; % We check the next path that gets to the neighbor
                        end
                    end
                    
                    if (~found || insert)
                        % There is no path to get to this neighbor inside the list's paths.
                        % Or, this path is a better way of getting to the neighbor that the paths in the list.
                        % We add this path to the list of paths.
                        
                        new_path = prov_path;
                        new_path = add_node_to_path(new_path, neighbors(j), CostePrevisto);
                        path_list{length(path_list)+1} = new_path;
                    end
                    
                    j = j + 1; % Let's check the next neighbor node
                    
                end % End of the loop that checks and decides whether to insert every single ne
                
            end % End of the condition which makes sure that we did not actually finally find the route
            
            % We calculated which was the minimum cost path
            % of the list inside this code snippet
            
        end % End of the condition which makes sure that the list of paths is not empty
    end % End of the algorithm's loop
end % End of the function