function [stars] = airport_stars(Airports, airport_name)

    n = 1;

    while (n<=length(Airports))
        if(strcmp(Airports(n).name,airport_name))
            
            stars = Airports(n).STARTS;
            
        end
        n = n + 1;
    end
end