% Prints the information of a graph as required in the PDF.

function graph_information (g)

    fprintf('Graph information:\n');
    fprintf('------------------\n');
    
    i = 1;
    while (i <= length(g.nodes))
        fprintf('%d %c\n', i, node_name(g, i));
        
        fprintf('\t');
        j = 1;
        nn = neighbor_nodes(g, i);
        while (j <= length(nn))
            fprintf('%d:%c(%.6f) ', nn(j), node_name(g, nn(j)), direct_cost(g, i, nn(j)));
            j = j + 1;
        end
        
        fprintf('\n');
        
        i = i + 1;
    end
    
    fprintf('----------------------------\n');
    
end