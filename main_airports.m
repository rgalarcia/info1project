Airports = read_airports();
if Airports==[]
   disp ('Im an error')
end

NavPoints = read_navPoints();
if NavPoints==[]
  disp('Im a error')
end

Airports=locate_airports(Airports,NavPoints)

barcelona.sids=airport_sids(Airports,LEBL

barcelona.stars=airport_stars(Airports,LEBL)

if barcelona.sids==[]
  disp('im an error')
end
if barcelona.stars==[]
  disp('Im an error')
end
