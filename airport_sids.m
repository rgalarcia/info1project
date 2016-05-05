% Given an airport name, this function looks for its SIDS
% procedures in an Airports structure and returns the list

function [sids] = airport_sids(Airports, airport_name)
    i = 1;
    
    while (i <= length(Airports))
        
        if (strcmp(Airports(i).name, airport_name))
            sids = Airports(i).SIDS;
        end   
        
        i = i + 1;
    end
end 