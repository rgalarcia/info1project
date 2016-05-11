function [porDonde] = shortest_path (g, nStart, nEnd, verbose)

    path_list = []; % We create a vector/list of paths
    path = create_path(); % We create the very first path to later insert it into the list
    path = add_node_to_path(path, node_index(g, nStart), 0); %	It consists of the specified origin node, with weight 0
    
    i = 1;
    path_list{i} = path; % The first path is inserted into the list of paths
    
    fprintf('Graph information:\n');
    fprintf('------------------\n');
    
    endofloop = false; % End of loop is achieved if the route is found or there is not possible route
    while (~endofloop)
        
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
            % Once we find it, we must add the neighbors of its last node
            % to the list of paths.
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
                
%                 disp('Prov_path: ');
%                 prov_path
%                 disp('Path_list: ');
%                 path_list
%                 disp('Mp_lastnode: ');
%                 mp_lastnode
%                 disp('node_name(Mp_lastnode): ');
%                 node_name(g, mp_lastnode)

                % But we still check its neighbors
                neighbors = neighbor_nodes(g, mp_lastnode);
                if (verbose)
                    fprintf('%d %c\n', mp_lastnode, node_name(g, mp_lastnode));
                end

                j = 1;
                while (j <= length(neighbors))
                    if (verbose)
                        fprintf('\t%d:%c(%g) ', neighbors(j), node_name(g, neighbors(j)), direct_cost(g, mp_lastnode, neighbors(j)) );
                    end
                    
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
                            found_costs(i) = cost;
                            found_indexes(i) = k;
                            i = i + 1;
                        end
                        k = k + 1;
                    end
                    
                    if (~found)
                        % The neighbor does not exist in the path
                        
                        new_path = prov_path;
                        new_path = add_node_to_path(new_path, neighbors(j), CostePrevisto);
                        path_list{length(path_list)+1} = new_path;
                        
                    else
                        % If the neighbor already exists in the path
                        k = 1;
                        while (k <= length(found_costs))
                            if (found_costs(k) < CostePrevisto)
                                % We do nothing (we already have a better way
                                % to reach the neighbour node in the list of
                                % paths)
                            else
                                path_list = remove_path(path_list, found_indexes(k)); % We get rid of it
                            end
                            
                            k = k + 1;
                        end
                        
                    end
                    
                    j = j + 1;
                end
                fprintf('\n');
            end
        end
    end
end