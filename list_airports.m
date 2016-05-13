function list_airports(g)
    n = 1;
    i = 0;
    while (n <= length(g.nodes))
        if i==21;
            fprintf('-------------------------------------\n')
            i=0;
        end 
        if (strcmp(g.nodes(n).type,'airport'))
            Name = g.nodes(n).name;
            Index = n;
            fprintf('%s - %f \n',Name,Index);
            i = i + 1;
        end 
        n = n + 1;
end

        
        