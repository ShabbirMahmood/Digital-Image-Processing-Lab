% Histogram Matching/Specification
clc;
close all;

row = 2;
col = 3;

img = imread('D:/DIP/CH03/cameraman.tif');
img_double = double(img);

for i=1:8
    bit_plane = mod(floor(img_double/(2^(i-1))),2); % Right Shift by One Bit(Floor to make Binary Image )
    figure, imshow(bit_plane);
    impixelinfo;
end



impixelinfo;