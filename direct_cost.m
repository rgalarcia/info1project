% This function tries to find the cost/weight of a specified segment
function [weight] = direct_cost(g, src_index, dst_index)

    i = 1;
    weight = -1; % If the weight is not found, the function must return -1
    
    while (i <= length(g.segments) && weight == -1) % Search algorithm
        
        % If this is the segment we were looking for
        if (g.segments(i).source == src_index && g.segments(i).destination == dst_index)
            weight = g.segments(i).weight; % Return the weight of this segment
        end
        
        i = i + 1;
    end

end