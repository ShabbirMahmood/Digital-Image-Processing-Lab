function y = my_hist(img)
[rr,cc] = size(img);
gray_level = zeros(1,256);
for i = 1:rr
    for j = 1:cc
        index = img(i,j);
        gray_level(index+1) = gray_level(index+1) + 1;
    end
end

y = gray_level;
end
% User Defined Function for Histogram