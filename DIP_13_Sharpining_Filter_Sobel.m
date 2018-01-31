% Spatial Filtering Page-165-168 High Pass Filter
% Non Linear(Gradiant)Sharpnening Filter- (Sobel Operator)
clc; clear; 
row = 2;
col = 2;

img = imread('D:/DIP/CH03/Fig0342(a)(contact_lens_original).tif');

subplot(row,col,1);
imshow(img);
title('Before Filtering');

w1=[-1 -2 -1; 0 0 0; 1 2 1]; % Sobel Mask-1 for Horizontal Direction
w2=[-1 0 1; -2 0 2; -1 0 1]; % Sobel Mask-2 for Vertical Direction
                   
Gx = sharp_filter(double(img),w1); % Must Convert to Double
Gy = sharp_filter(double(img),w2);

Mxy = sqrt(Gx.^2 + Gy.^2); % Gradiant Image(Magnitude of the Gradiant)

subplot(row,col,2);
imshow((uint8(Gx)));
title('After Horizontal Masking');

subplot(row,col,3);
imshow(uint8(Gy));
title('After Vertical Masking');

subplot(row,col,4);
imshow(uint8(Mxy));
title('Gradiant Image');
