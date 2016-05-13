function[g2]=complete_graph(g,airports)

    i=length(g.nodes) + 1; %we need to kwnow how many nodes are
    
    n=1;
    
    while (n<= length (Airports))
      g.nodes(i).name=Airports(n).name
      g.nodes(i).latitude=Airports(n).latitude
      g.nodes(i).long=Airports(n).long
      g.nodes(i).type='airport'
      n = n + 1;
      i = i + 1;
      
    end
    n = 1;
    
    i=lenth (g.segments)+ 1
    while (n<=length(Airport))