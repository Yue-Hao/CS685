function [xc, yc] = plot_circle(xo,yo,d)

r = d;
xc = xo;
yc = yo;

th = 0:pi/50:2*pi;
xunit = r * cos(th) + xc;
yunit = r * sin(th) + yc;
plot(xunit, yunit);

end