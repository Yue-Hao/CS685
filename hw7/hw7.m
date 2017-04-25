d0 = 3.9;
d1 = 4.5;
b0 = 1;
b1 = 1.5;
p0 = [10 8]';
p1 = [6 3]';
x0 = [12 4]';
x1 = [5 7]';

prob_0 = measurementModel(d0,p0,x0,b0)*measurementModel(d1,p0,x1,b1)
prob_1 = measurementModel(d0,p1,x0,b0)*measurementModel(d1,p1,x1,b1)