function ssd = SSD_pint(p1, im1, p2, im2, s)

patch1 = im1(p1(1)-s:p1(1)+s,p1(2)-s:p1(2)+s);
patch2 = im2(p2(1)-s:p2(1)+s,p2(2)-s:p2(2)+s);

ssd = sum(sum((patch1-patch2).^2));

end