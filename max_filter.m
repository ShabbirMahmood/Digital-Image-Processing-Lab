function [filtered_img] = max_filter(input_img,mask)

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
[r,c] = size(w1);

for i = sM:M-eM
    for j = sN:N-eN
        array = zeros(r,c);
        iw=1;
        for ii = i-eM:i+eM  
            for jj = j-eN:j+eN
                array(iw) = w1(iw)*f(ii,jj);
                iw = iw+1;
            end
        end
        filtered_img(i,j) = (max(array)); % Assigning Average Value in the Midde Position of the window
    end
end
filtered_img = filtered_img(m:m+Mi-1,n:n+Ni-1); % Cropping Image to Previos Dimension
end