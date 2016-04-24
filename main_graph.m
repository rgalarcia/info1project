%set g has the Tgraph of the figure
g=create_graph();
g=add_node(g,'A');
g=add_node(g,'B');
g=add_node(g,'C');
g=add_node(g,'D');
g=add_node(g,'E');
g=add_node(g,'F');
g=add_node(g,'G');
g=add_node(g,'H');

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

%test some data from g
a_index=node_index(g,'A');
g_index=node_index(g,'G');
c1=direct_cost(g, a_index, g_index);
disp(c1);   %test incorrect (-1)

b_index=node_index(g,'B');
c2=direct_cost(g, b_index, g_index);    %test correct (6)

N=neighbor_nodes(g, a_index);    %test [b,e,f] indexes
cn=closest_node(g, a_index);    %test returns b_index