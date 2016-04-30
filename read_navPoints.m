function [NP] = read_navPoints()
    TnavPoint = struct ('NavPointID', 0, 'NavPointName', ' ', 'long', 0.0, 'lat', 0.0);
    NavPoint=TnavPoint;
    
    f = fopen('NavPoints.txt' , 'r');
    
    n = 1;
    
    if(f == -1)
        disp('ERROR');
    end
    
    while (~feof)
       NavPoint.NavPointID = fscanf(f, '%d', 1);    %Llegeix ID
       fscanf(f, '%s', 1);
       NavPoint.NavPointName = fscanf(f, '%s', 1);  %Llegix nom
       fscanf(f, '%s', 1);
       NavPoint.long = fscanf(f, '%g', 1);   %Llegeix lon
       fscanf(f, '%s', 1);
       NavPoint.lat = fgetl(f, '%s');   %Llgeix lat (com és l'ultim agafa tota la linia)
       
       NavPoints(n) = Navpoint;
       
       n = n + 1;
    end
    
    NP=NavPoints;
end

       
        
    