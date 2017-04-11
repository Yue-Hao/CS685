%Read the image of the house, convert the image to gray level and resize it as:

im = imread('house1.jpg');
imgray = rgb2gray(im);
imsmall = imresize(imgray,0.25);
subplot(2,2,1); 
imagesc(imsmall); colormap gray; axis image;
title('original image')

%Use this image to test the conv2 routine, which convolves the image with a 2D filter
filter = ones(3,3);
imresult1 = conv2( imsmall, filter, 'same');
subplot(2,2,2);
imagesc(imresult1); colormap gray; axis image;
title('filter size = 3 x 3')

%Use this image to test the conv2 routine, which convolves the image with a 2D filter
filter = ones(7,7);
imresult2 = conv2( imsmall, filter, 'same');
subplot(2,2,3);
imagesc(imresult2); colormap gray; axis image;
title('filter size = 7 x 7')

%Use this image to test the conv2 routine, which convolves the image with a 2D filter
filter = ones(11,11);
imresult3 = conv2( imsmall, filter, 'same');
subplot(2,2,4);
imagesc(imresult3); colormap gray; axis image;
title('filter size = 11 x 11')