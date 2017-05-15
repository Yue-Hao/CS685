function pos = partical_filter(motions, measurements)

global N Particals w_fast w_slow

w = zeros(size(Particals,1),1);

% update
for i = 1 : N

    Particals(i,:) = move(Particals(i,:), motions);
    
    w(i) = measurement_prob(Particals(i,:), measurements);
    
end
w = w./sum(w);
[mw indx] = max(w);

a_slow = 0.01;
a_fast = 0.5;
w_avg = mean(w);
w_slow = w_slow + a_slow * (w_avg-w_slow);
w_fast = w_fast + a_fast * (w_avg-w_fast);

threshold = max(0.0,1.0 - w_fast/w_slow)

% resample

temp = zeros(size(Particals));
index = min(N, floor(rand(1) * N) + 1);

beta = 0.0;
mw = max(w);

for i = 1: N
    if rand(1) < threshold
        temp(i,:) = rand(1,3) .* [32 22 pi*2.0] - [16 11 pi];
    else
        beta = beta + rand(1) * 2.0 * mw;
        while beta > w(index)
           beta = beta - w(index);
           index = mod(index, N) + 1;           
        end
        temp(i,:) = Particals(index,:);
    end
end
if sum(measurements.lms) ~= 0
    Particals = temp;
end

pos = get_position();

end
