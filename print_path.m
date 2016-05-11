% Prints the content of a path in the console

function print_path (g, p)

    i = 1;
    fprintf('%d: ', p(length(p)).node); % Total cost of the path
    
    while (i <= length(p)) % Elements of the path
        
        name = g.nodes(p(i).node);
        fprintf('%c ', name);
        i = i + 1;
        
    end
    
    fprintf('\n');

end