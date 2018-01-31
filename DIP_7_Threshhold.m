% Thresholding Transformation to generate B/W(Binary) Image
row = 1;
col = 2;
img = imread('D:/DIP/CH03/cameraman.tif');

subplot(row,col,1);
imshow(img);
title('Before Thresholding Grayscale Image');

L = 256;

img_thr = img > (L/2); % Threshold value is = L/2 = 128 (Generate matrix with 1 & 0 Value Logical)   

subplot(row,col,2);
imshow(img_thr);
title('After Thresholding B/W(Binary) Image');



