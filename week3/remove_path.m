% Given a vector of paths, this function
% removes a specified path from it

function pts2 = remove_path (pts, ind)
    
    j = 1;
    i = 1;
    % We copy each of the paths, except the 
    % specificated one, to a new Tpath structure
    while (i <= length(pts))
        if (i ~= ind)
            pts2(j) = pts(i);
            j = j + 1;
        end
        
        i = i + 1;
    end
    
    if (~exist('pts2'))
        pts2 = [];
    end

end