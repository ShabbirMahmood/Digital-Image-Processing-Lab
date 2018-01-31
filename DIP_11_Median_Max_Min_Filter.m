% Spatial Filtering Page-156 Low Pass Filter
% Non Linear(Order Statistic) Smoothing Filter- (Median, Max, Min)
clc;
clear all;
close all;
row = 2;
col = 2;
img = imread('D:/DIP/CH03/Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');

subplot(row,col,1);
imshow(img);
title('Before Filtering');

%w1=[1 1 1; 1 1 1; 1 1 1]*(1/9);         % 3*3 Box Averaging Mask
w2=ones(3,3);                    % 3*3 Box Median/Max/Min Mask



%filtered = average_filter(img,w1);
filtered1 = median_filter(double(img),w2);
filtered2 = max_filter(double(img),w2);
filtered3 = min_filter(double(img),w2);

subplot(row,col,2);
imshow(uint8(filtered1));
title('After 3*3 Median Filtering');

subplot(row,col,3);
imshow(uint8(filtered2));
title('After 3*3 Max Filtering');

subplot(row,col,4);
imshow(uint8(filtered3));
title('After 3*3 Min Filtering');

