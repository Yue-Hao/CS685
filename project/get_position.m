function pos = get_position()

global Particals  N;

x = 0.0;
y = 0.0;
orientation = 0.0;

for i = 1: N

    x = x + Particals(i,1);
    y = y + Particals(i,2);

%    orientation = orientation + mod(Particals(i,3) - ...
%                  Particals(1,3) + 180 , 360) ...
%                 + Particals(1,3) - 180;
orientation = orientation + Particals(1,3);
end

pos(1) = x / N;
pos(2) = y / N;
pos(3) = orientation / N;
pos(3) = mod(pos(3)+180,360)-180;
end