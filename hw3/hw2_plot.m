load rrt_obj;
load path_obj;

p_local = rrt.local_planner([50,30,0],path(:,1)');

plot2(path');
hold on;
plot2(p_local');
xlim([0 120]);
ylim([0 100]);
