% Ideal Low Pass Filter, Page- 269,274
clc; clear; close all;
row = 2; 
col = 2;
[x,y] = meshgrid(-128:127, -128:127);

z = sqrt(x.^2 + y.^2); % Equation of Circle

subplot(row,col,1);
imshow(uint8(z));
title('Original Image');

C0 = 15;              % Cut Off Frequecy C0
ideal_filter = z<C0;  % Thresholding to Generate B/W Image for Creating Filter Function

subplot(row,col,2);
imshow((ideal_filter)); % im2uint8
title('Ideal Low Pass Filter with Radius C0');

f_ideal_filter = fftshift(fft2(ideal_filter));
f_ideal_filter1 = log(1+abs(f_ideal_filter));
f_ideal_filter2 = mat2gray(f_ideal_filter1); 
subplot(row,col,3);
imshow((f_ideal_filter2)); % With Ringinging Effect
title('Ideal Low Pass Filter(FFT)');






