% This function reads a file with a list of navpoints
% and its information and returns a t structure
% with the processed data

function [NP] = read_navPoints()

    TnavPoints = struct('NavPointID', 0, 'NavPointName', ' ', 'long', 0.0, 'lat', 0.0);
    NavPoint = TnavPoints;
    
    f = fopen('NavPoints.txt' , 'r');
    
    if(f == -1)
        disp('ERROR');
        NP = [];
    else
        n = 1;
        fprintf('Reading data.');
        while (~feof(f))
           NavPoint.NavPointID = fscanf(f, '%d', 1);    % Llegeix ID
           NavPoint.NavPointName = fscanf(f, '%s', 1);  % Llegix nom
           NavPoint.lat = fscanf(f, '%f', 1);           % Llegeix lat
           NavPoint.long = fscanf(f, '%f', 1);          % Llgeix long (com �s l'ultim agafa tota la linia)
           NavPoints(n) = NavPoint;
           
           if (mod(n, 500)==0) % Every 500 iterations, print a dot
               fprintf('.');
           end
           
           n = n + 1;
        end
        fprintf('\nDone!\n\n');
    end
    
    NP = NavPoints;  % vector de structures
end