clc; clear; close all;
row = 2; 
col = 2;

img = imread('D:/DIP/CH03/Fig0333(a)(test_pattern_blurring_orig).tif');
% img = imread(D:/DIP/CH02/(Fig0240(a)(apollo 17_boulder_noisy).tif');


subplot(row,col,1);
imshow(img);
title('Before Filtering');
[M,N] = size(img);

 % Input Image;Cut Off Frequency

out_img1 = ILPF(img,30);    % Input Image/Cut Off Frequency
%out_img2 = ILPF(img,60);
out_img2 = BLPF(img,60,2);  % Input Image/Cut Off Frequency/Filter Order
out_img3 = GLPF(img,10); 

subplot(row,col,2);
imshow(out_img1);
title('ILPF with C0=30');

subplot(row,col,3);
imshow(out_img2);
title('BLPF with C0=60');

subplot(row,col,4);
imshow(out_img3);
title('GLPF with C0=10');