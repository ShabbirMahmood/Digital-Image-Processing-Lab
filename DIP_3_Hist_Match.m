 % Histogram Matching/Specification
clc;
clear all;
close all;

row = 2;
col = 3;

img2 = imread('D:/DIP/CH03/Fig0316(4)(bottom_left).tif');
img1 = imread('D:/DIP/CH03/cameraman.tif');


mapped_gray_level = zeros(1,256,'uint8');
%mapped_gray_level = zeros(256,1,'uint8');

hist1 = imhist(img1);
hist2 = imhist(img2);
L = 256;

cdf1 = (L-1)*cumsum(hist1 / numel(img1)); % cdf of img1
cdf2 = (L-1)*cumsum(hist2 / numel(img2)); % cdf of img2

%cdf1 = uint8(cdf1);
%cdf2 = uint8(cdf2);

for i = 1:256  
    diff = abs(cdf1(i) - cdf2);
    [~,index] = min(diff);
    mapped_gray_level(i) = index - 1;
end

% for i = 1:256  
%     diff = abs(cdf1(i) - cdf2);
%     index = find(diff==min(diff));   % will find all the indices of minimum differences
%     max_ind = max(diff);
%     mapped_gray_level(i) = max_ind - 1;
% end

img_out = mapped_gray_level((img1)+1); % Output Image

subplot(row,col,1);
imshow(img1);
title('Input Image');

subplot(row,col,2);
imshow(img2);
title('Desired Image');

subplot(row,col,3);
imshow(img_out);
title('Histogram Matched Image');
impixelinfo; %****

subplot(row,col,4);
imhist(img1);
title('Histogram of Input Image');

subplot(row,col,5);
imhist(img2);
title('Histogram of Desired Image');

subplot(row,col,6);
imhist(img_out);
title('After Histogram Matching');



