% The purpose of this function is, given a vector of airports, plot
% the number of airports that are placed in each different country

function plot_airports (Airports)
    
    % If the airports struct is empty, then we have to throw an exception
    if (isempty(Airport))
        
        fprintf('Please provide a valid vector of airports.\n');
        return;
        
    else % Else, we continue to read the structure
        
        % The indices of both vectors are related:
        % airports(n) indicates the number of airports of 
        % the country country(n)
        
        countries = [];
        airports = [];

        i = 1;
        j = 1;
        
        % We iterate throughout the struct of airports
        while (i <= length(Airports))
            % The country of the actual airport
            cntry = strcat(Airports(i).name(1), Airports(i).name(2));
            
            % Saving data into the countries and airports vectors
            if (length(countries) == 0)
                countries(j) = cntry;
                airports(j) = airports(j) + 1;
                j = j + 1;
            elseif (countries(j) == cntry)
                airports(j) = airports(j) + 1;
            else
                j = j + 1;
                countries(j) = cntry;
                airports(j) = airports(j) + 1;
            end

            i = i + 1;
        end
        
        bar(countries, airports); % We plot the number of aiports of each country.
        
    end
    
end