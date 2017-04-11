function matches = harris_match(file1, file2)

%file1 = 'house1.jpg';
%file2 = 'house2.jpg';

im1 = imread(file1);
im2 = imread(file2);

% make grayscale
if size(im1,3) > 1, im1g = rgb2gray(im1) ; else im1g = im1 ; end
if size(im2,3) > 1, im2g = rgb2gray(im2) ; else im2g = im2 ; end

% --------------------------------------------------------------------
%                                                         SIFT matches
% --------------------------------------------------------------------

f1 = harris_corners(im1g, 7,1.5);
f2 = harris_corners(im2g, 7,1.5);

matches = 1:size(f1,1);
matches = [matches;matches];

im1g_t = im1g';
im2g_t = im2g';

for i = 1:size(f1,1)
    matches(2,i) = SSD(f1(i,:),im1g_t,f2,im2g_t);
end

% --------------------------------------------------------------------
%                                                         Show matches
% --------------------------------------------------------------------

dh1 = max(size(im2,1)-size(im1,1),0) ;
dh2 = max(size(im1,1)-size(im2,1),0) ;

imagesc([padarray(im1,dh1,'post') padarray(im2,dh2,'post')]) ;
o = size(im1,2) ;
f1 = f1';
f2 = f2';
line([f1(1,matches(1,:));f2(1,matches(2,:))+o], ...
     [f1(2,matches(1,:));f2(2,matches(2,:))]) ;
title([file1 ' | ' file2]) ;
axis image off ;

drawnow ;

end
