% Spatial Filtering Page-158-163 High Pass Filter
% Linear Sharpnening Filter- (Laplacian)
clc; clear; close all;
row = 2;
col = 2;

img = imread('D:/DIP/CH03/Fig0338(a)(blurry_moon).tif');
%img1 = tofloat(img);
%img = imread('coins.png');
%img = imread('D:/DIP/CH03/Fig0342(a)(contact_lens_original).tif');

subplot(row,col,1);
imshow(img);
title('Before Filtering');

w1=[0 1 0; 1 -4 1; 0 1 0];   % Laplacian Mask-1
w2=[1 1 1; 1 -8 1; 1 1 1];   % Laplacian Mask-2

filtered1 = sharp_filter(double(img),w1); % Must Convert to Double
filtered2 = sharp_filter(double(img),w2);

sharped_iamge = double(img) - filtered1;  % Sharped image

subplot(row,col,2);
imshow((uint8(filtered1)));
title('After Laplacian Masking-1');

subplot(row,col,3);
imshow(uint8(filtered2));
title('After Laplacian Masking-1');

subplot(row,col,4);
imshow(uint8(sharped_iamge));
title('Sharped Image');
