clf
load map1;
%figure; imagesc(map);
%rrt = RRT(); rrt.plan();
%rrt.visualize();
%p = rrt.path([0 0 0], [0 2 0]); plot2(p');

rrt = RRT(map, 'xrange', [1 100], 'yrange', [1 100],'goal',[80,90],'npoints', 5000);
rrt.plan();
p = rrt.path([20,40,0], [80,90,0]); 

