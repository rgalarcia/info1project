function [sides] = airport_sids(Airports, airport_name)
    i = 1;
    while (i<=length(Airports))
        if (strcmp(Airports(i).name,airport_name))
            sides = Airports(i).SIDES;
        end   
        i = i + 1;
    end
end 