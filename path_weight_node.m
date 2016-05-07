function[result]=path_weight_node(p,ind)
    n = 1;
    found = (0==1);
    while (n<=length(p.points)) && (!found)
        in=p.ponints(n).node
        if (in==ind)
            found = (0==0);
            result=p.points(n).weight;
        end
        n = n + 1;
    end
end