function [g2] = add_segment(g1,segment)
 g2=g1;
 if (seg.source~<0 || seg.destination ~<0 || seg.weight~>0)
  fprintf('there are an error with something');
 else
  k=length (g1)+1;
  g2(k)=(segment);
  end
end