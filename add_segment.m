function [g2] = add_segment(g1,segment)
%Description: Given a graph g1 and a segment, returns a new graph
%g2 with the new segment.
%If the segment is not correct (non existing nodes or zero/negative distance) then an error is
%shown in console and the returned g2 is equal to g1.
 g2=g1;
 if (node_name=='ERROR' || segment.w<=0)
  printf("there are an error with something")
  end
 else
  k=length (g1);
  g2(k+1)=(segment)
  end
end