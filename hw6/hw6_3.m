im = rgb2gray(imread('house1.jpg'));
corners = harris_corners(im, 7,1.5);
subplot(2,2,1)
imshow(im); hold  on;
plot(corners(:,1), corners(:,2), 'ro');
title('house1.jpg');

im2 = rgb2gray(imread('house1-rotated.jpg'));
corners2 = harris_corners(im2, 7,1.5);
subplot(2,2,2)
imshow(im2'); hold  on;
plot( corners2(:,2),corners2(:,1), 'ro');
title('house1-rotated.jpg');

im = rgb2gray(imread('house1-2down.jpg'));
corners = harris_corners(im, 7,1.5);
subplot(2,2,3)
imshow(im); hold  on;
plot(corners(:,1), corners(:,2), 'ro');
title('house1-2down.jpg');

im = rgb2gray(imread('house1-4down.jpg'));
corners = harris_corners(im, 7,1.5);
subplot(2,2,4)
imshow(im); hold  on;
plot(corners(:,1), corners(:,2), 'ro');
title('house1-4down.jpg');
