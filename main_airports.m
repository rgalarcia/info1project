Airports = read_airports();
if (isempty(Airports))
   disp ('Im an error');
end

NavPoints = read_navPoints();
if (isempty(NavPoints))
  disp('Im a error');
end

Airports = locate_airports(Airports,NavPoints);

barcelona.sids = airport_sids(Airports,'LEBL');

barcelona.stars = airport_stars(Airports,'LEBL');

if (isempty(barcelona.sids))
  disp('Im an error');
end
if (isempty(barcelona.stars))
  disp('Im an error');
end
write_airports(Airports)
plot_airports(Airports) %el error ya esta dentro de la funcion
map_airports(Airports,LE)
