% Creates a graph with the nodes specified in the PDF's figure
clear all
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

% Testing that the functions we wrote work as expected...
a_index=node_index(g, 'A'); %Returns the index of the node named 'A'
g_index=node_index(g, 'G'); %Returns the index of the node named 'G'
c1=direct_cost(g, a_index, g_index); %Returns the cost of flying from 'A' to 'G'
disp(c1);   %There is no possible route (non-existing segment). Result: -1

b_index=node_index(g, 'B'); %Returns the index of the node named 'B'
c2=direct_cost(g, b_index, g_index);    %The weight of the route is 6. Result: 6
disp(c2);

N=neighbor_nodes(g, a_index)    %Returns the indexes of the neighbors of node 'A'. Result: [b,e,f] indexes (node neighbors)
cn=closest_node(g, a_index);     %Returns the index of the closest node to node 'A'. Result: b_index (closest node)
disp(cn);
cnn=node_name(g, cn);            %Returns the name of the closest node to node 'A'. Result: 'B' (closest node)
disp(cnn);