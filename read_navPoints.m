function [NP] = read_navPoints()
    TnavPoint = struct ('NavPointID', 0, 'NavPointName', ' ', 'long', 0.0, 'lat', 0.0);
    NavPoint=TnavPoint;
    f = fopen('NavPoints.txt' , 'r');
    n = 1;
    if(f == -1)
        disp('ERROR');
    end
    while (~feof(f))
       NavPoint.NavPointID = fscanf(f, '%d', 1);    %Llegeix ID
       NavPoint.NavPointName = fscanf(f, '%s', 1);  %Llegix nom
       NavPoint.lat = fscanf(f, '%f', 1);   %Llegeix lon
       NavPoint.long = fscanf(f, '%f', 1);   %Llgeix lat (com és l'ultim agafa tota la linia)
       NavPoints(n) = NavPoint;
       n=n+1;
    end
    NP=NavPoints;  %vector de structures 
end    