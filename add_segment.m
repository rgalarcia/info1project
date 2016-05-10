%This function adds a valid segment to an existing graph
function [g2] = add_segment (g1, segment)
     g2 = g1;
     
     % We take the maximum node of the segment and check whether it exists
     % in the specified graph
     if (segment.source >= segment.destination)
         max = segment.source;
     else
         max = segment.destination;
     end
        
     % If the maximum node can be found in the graph, the minimum too.
     % Then, if the weight of the segment is valid, the segment is valid.
     if (strcmp(node_name(g1, max), 'ERRO') || segment.weight <= 0)
        fprintf('The provided segment is not correct. Please check it.');
     else
        % We append the segment to g2.
        k = length(g1.segments);
        if (g1.segments(k).source == 0)
            g2.segments(k) = segment;
        else
            g2.segments(k+1) = segment;
        end
     end
end