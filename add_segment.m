%Description: Given a graph g1 and a segment, returns a new graph
%g2 with the new segment.
%If the segment is not correct (non existing nodes or zero/negative distance) 
%then an error is shown in console and the returned g2 is equal to g1.
function [g2] = add_segment (g1, segment)
 g2 = g1;
 if (segment.source >= segment.destination)
     max = segment.source;
 else
     max = segment.destination;
 end
 
 if (strcmp(node_name(g1, max), 'ERROR') || segment.weight <= 0)
    fprintf('The provided segment is not correct. Please check it.');
 else
    k = length(g1.segments);
    if (g1.segments(k).source==0)
        g2.segments(k) = segment;
    else
        g2.segments(k+1) = segment;
    end
 end
end