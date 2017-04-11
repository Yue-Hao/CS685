im = imread('house1.jpg');
imgray = rgb2gray(im);

imsmall = imresize(imgray,0.25);
subplot(2,2,1); 
imagesc(imsmall); colormap gray; axis image;
title('original image')

%Use this image to test the conv2 routine, which convolves the image with a 2D filter
imresult1 = edge(imgray,'Canny',0.0);
[L num] = bwlabel(imresult1);
subplot(2,2,2);
imagesc(imresult1); colormap gray; axis image;
title(strcat('threshold = 0.0, no. of components = ',num2str(num)));

%Use this image to test the conv2 routine, which convolves the image with a 2D filter
filter = ones(7,7);
imresult2 = edge(imgray,'Canny',0.3);
[L num] = bwlabel(imresult2);
subplot(2,2,3);
imagesc(imresult2); colormap gray; axis image;
title(strcat('threshold = 0.3, no. of components = ',num2str(num)));

%Use this image to test the conv2 routine, which convolves the image with a 2D filter
filter = ones(11,11);
imresult3 = edge(imgray,'Canny',0.7);
[L num] = bwlabel(imresult3);
subplot(2,2,4);
imagesc(imresult3); colormap gray; axis image;
title(strcat('threshold = 0.7, no. of components = ',num2str(num)));
