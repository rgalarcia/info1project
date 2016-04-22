function[dst_index]=closest_node(g,src_index)
n=1;
min=+inf;
while(n<=length(g.segments))
    if(g.segments(n).source==src_index)
        if(g.segments(n).weight<min) 
           min=g.segments(n).weight; %new minim weight
        end
    end
    n=n+1;
end