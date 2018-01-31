function [filtered_img] = sharp_filter(input_img,mask)

w = mask; % Mask Window

[Mi,Ni] = size(input_img); % Input Image's Dimension
[m,n] = size(mask);        % Mask Window's Dimension

f = padarray(input_img,[m-1 n-1]); % Padding the input image by m-1 & n-1 dimension
[M,N] = size(f);                   % Padded Image's Dimension
filtered_img = zeros(M,N);         % Output Image with New Dimension

sM = (m+1)/2;  % Starting Index of Mask 
sN = (n+1)/2;

eM = sM-1;     % Ending Index of Mask  E
eN = sN-1;

w = w';        % Converting Weight Matrix to Weight Vector
w1 = w(:);     % w1 is the weight vector

for i = sM:M-eM
    for j = sN:N-eN
        summ = 0;
        iw=1;
        for ii = i-eM:i+eM  
            for jj = j-eN:j+eN
                summ = summ + w1(iw)*f(ii,jj);
                iw = iw+1;
            end
        end
        filtered_img(i,j) = (summ); % Assigning Laplacian Equation Value in the Middle Position of the window
    end
end
filtered_img = filtered_img(m:m+Mi-1,n:n+Ni-1); % Cropping Image to Previos Dimension
end