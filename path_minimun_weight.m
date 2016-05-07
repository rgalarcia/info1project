function indp = path_minimun_weight (pts)
    
   min = +inf;
   n = 1;
   i = 1;
   while (n <= length(TPath))
       if(TPath(n).points.weight < min)
           min = TPath(n).points.weight;
           i = i + 1;
       end
       n = n + 1;
   end
   
   indp = TPath.points(i).node;

end
