% Contrast Stretching Page 106
row = 2;
col = 2;
img = imread('D:/DIP/CH03/Fig0354(a)(einstein_orig).tif');

subplot(row,col,1);
imshow(img);
title('Low Contrast Grayscale Image');

x1 = 0:255;
y1 = my_hist(img);    % User Defined Function imhist(img)

subplot(row,col,2);
stem(x1,y1,'marker','none');  %bar(x,y);
title('Histogram of Low Contrast Image');

P = img;    % Now P is the intesity matrix of Low Contrast Image

a = 0;          % Lower Limit of Expected Intensity Level
b = 255;        % Upper Limit of Expected Intensity Level
c = min(P(:));  % Lower Limit of the Input Image Intensity Level(Pixel Intensity)
d = max(P(:));  % Upper Limit of the Input Image Intensity Level(Pixel Intensity)

img_str = ( (P - c).*((b-a)/(d-c)) ) + a; % Contrast Stretching Function

subplot(row,col,3);
imshow(img_str);
title('Contrast Stretched Image');

x2 = 0:255;
y2 = my_hist(img_str);    % User Defined Function imhist(img)

subplot(row,col,4);
stem(x2,y2,'marker','none');  %bar(x,y);
title('Contrast Stretched Image Histogram');


% http://www.divilabs.com/2015/02/contrast-stretching-or-contrast.html