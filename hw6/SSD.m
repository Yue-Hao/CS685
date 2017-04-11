function s = SSD(p, im1, S, im2)

window_size = 2;

min_ssd = SSD_pint(p,im1,S(1,:),im2,window_size);
s = 1;
for i = 1 : size(S,1)
    ssd = SSD_pint(p,im1,S(i,:),im2,window_size);
    if ssd < min_ssd
        min_ssd = ssd;
        s = i;
    end
end

end