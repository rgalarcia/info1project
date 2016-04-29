function[Airport_full]=locate_airports(Airports,NP)
 Airport_full=[]
 i=1;
 while (i<=length(Airports))
  [a,b,c]=find_navPoint(NP,Airports(i).SIDs)
  Airports(i).lat=a
  Airports(i).long=b
 end
 Airport_full=Airports
end