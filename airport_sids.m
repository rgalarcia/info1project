function [sids]=airport_sids(Airports, airport_name)
i=1;
while (i<=length(Airports))
    if (strcmp(Airports(i).name,airport_name))
        sids=Airports(i).SIDS;
    end   
    i=i+1;
end
end 