% 2D Fourier Transformation in Spatial Domain
clc; clear; close all;
row = 2; 
col = 2;
img = zeros(256,256);
img(78:178, 78:178) = 1;

subplot(row,col,1);
imshow(img);
title('Original Image');

f_img = fftshift(fft2(img)); % FFT and Shifting the DC Component to Center 
subplot(row,col,2);
imshow((f_img));
title('Fourier Transformed Image with Shifting');

f_img1 = log(1+abs(f_img));
fm = max(f_img1(:));
f_img1 = im2uint8(f_img1/fm); % Manual Scaling() / f_img1 = uint8(255*(f_img1/fm));
subplot(row,col,3);           % Page - 79,80,162
imshow(f_img1);
title('Fourier Transformed Image(Manual Scaling)');

f_img2 = mat2gray(log(1+abs(f_img))); % Builtin Function for Automatic Scaling

subplot(row,col,4);
imshow(f_img2);
title('Fourier Transformed Image(Automatic Scaling)');

