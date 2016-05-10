% Given a vector of paths, finds the path with the minimum
% cost and returns its index (indp) inside the vector (pts)

function indp = path_minimun_weight (pts)
    
   min = +inf; % Used to decide which is the minimum cost and to store it
   n = 1; % Used to iterate through the vector of paths
   i = 1; % Used to store the index of the path with the minimum cost
   
   while (n <= length(pts))
       
       nop = length(pts{n}.points); % Number of points of a path
       
       if (pts{n}.points(nop).weight < min) % If the cost of this path is less than the minimum
           min = pts{n}.points(nop).weight;
           i = n;
       end
       
       n = n + 1;
   end
   
   indp = i;

end
