function [result] = my_hist_equ(img)  % Histogram Equalization Function
[rr,cc] = size(img);                % Size of image
N = rr*cc;                          % Total Number of points in the image
gray_level = my_hist(img);          % Histogram
p = gray_level / N;                 % Probability of Each Gray Level
L = 256;

s  = zeros(1,256,'uint8');          % New Gray Level Array(Type Casting****)
s(1) =(L-1)*p(1);                   % Assigning the first probability
                                    
for i = 2:256  
    s(i) = s(i-1) + (L-1)*p(i);     % Cumulative Sum of Probability
end
%j=0:255;
%plot(j,s);
%s = uint8(s);
result = zeros(rr,cc,'uint8'); %********** Output (Histogram Matched Image)
for i = 1:rr
    for j = 1:cc
        x = img(i,j);          % Input Image Intensity Level per Pixel
        result(i,j) = s(x+1);  % Assigning the Mapped Intensity Level to that Pixel
    end
end
end
