function [dst_index] = closest_node (g, src_index)
    n = 1;
    min = +inf;
    min_dstindex = 0;
    
    while (n <= length(g.segments))
        if (g.segments(n).source == src_index)
            if (g.segments(n).weight < min) 
               min = g.segments(n).weight; %new minim weight
               min_dstindex = g.segments(n).destination;
            end
        end
        n = n + 1;
    end
    
    if (min == +inf)
        dst_index = 'ERRO';
    else
        dst_index = min_dstindex;
    end

end