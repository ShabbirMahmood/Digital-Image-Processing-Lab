% Spatial Filtering Page-149,152 Low Pass Filter
% Linear Smoothing Filter- (Averaging(Box), Weighted Averaging)
clc;
clear all;
close all;
row = 2;
col = 2;
img = imread('D:/DIP/CH03/Fig0333(a)(test_pattern_blurring_orig).tif');


subplot(row,col,1);
imshow(img);
title('Before Filtering');

%img = [0 0 0 0 0; 0 0 0 0 0; 0 0 1 0 0; 0 0 0 0 0; 0 0 0 0 0];
%w=[1 2 3; 4 5 6; 7 8 9];

w1=[1 1 1; 1 1 1; 1 1 1]*(1/9);                                     % 3*3 Box Mask
w2=ones(15,15)*(1/(15*15));  % 5*5 Box Mask
w3=[1 2 1; 2 4 2; 1 2 1]*(1/16);                                    % 3*3 Weighted Mask


filtered1 = average_filter(double(img),w1);
filtered2 = average_filter(double(img),w2);
filtered3 = average_filter(double(img),w3);


subplot(row,col,2);
imshow((uint8(filtered1)));
title('After 3*3 Box Filtering');

subplot(row,col,3);
imshow(uint8(filtered2));
title('After 15*15 Box Filtering');

subplot(row,col,4);
imshow(uint8(filtered3));
title('After 3*3 Weighted Filtering');
