% Creates a graph with the nodes specified in the PDF's figure
g=create_graph();
g=add_node(g,'A');
g=add_node(g,'B');
g=add_node(g,'C');
g=add_node(g,'D');
g=add_node(g,'E');
g=add_node(g,'F');
g=add_node(g,'G');
g=add_node(g,'H');

% Creates segments between the nodes (see PDF's figure)
s=create_segment(node_index(g, 'A'), node_index(g, 'B'), 1);
g=add_segment(g, s);
s=create_segment(node_index(g, 'A'), node_index(g, 'E'), 4);
g=add_segment(g, s);
s=create_segment(node_index(g, 'A'), node_index(g, 'F'), 8);
g=add_segment(g, s);
s=create_segment(node_index(g, 'B'), node_index(g, 'C'), 2);
g=add_segment(g, s);
s=create_segment(node_index(g, 'B'), node_index(g, 'F'), 6);
g=add_segment(g, s);
s=create_segment(node_index(g, 'B'), node_index(g, 'G'), 6);
g=add_segment(g, s);
s=create_segment(node_index(g, 'C'), node_index(g, 'G'), 2);
g=add_segment(g, s);
s=create_segment(node_index(g, 'C'), node_index(g, 'D'), 1);
g=add_segment(g, s);
s=create_segment(node_index(g, 'D'), node_index(g, 'G'), 1);
g=add_segment(g, s);
s=create_segment(node_index(g, 'D'), node_index(g, 'H'), 4);
g=add_segment(g, s);
%ahora haremos el print
n=1;
while (n<=length(g.segments))
    fprintf('%s - %s \n',node_name(g,g.segments(n).source), node_name(g,g.segments(n).destination))
n = n + 1;
end