function s = sample_normal_distribution(b)

s = 0;

for i = 1:12
    s = s+(rand()*2*b-b);
end

s = s/2;

end