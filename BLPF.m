function [ output_img2 ] = BLPF(input_img,D0,n)  % (Butterworth Low Pass Filter of Order n) Page-273
[M,N] = size(input_img);
% Performing FFT to Input Iamge
f_img = fftshift(fft2(input_img));
%f_img1 = log(1+abs(f_img));
%f_img2 = mat2gray(f_img1);

% Creating ILPF with C0 = Cut Off Frequency
[u,v] = meshgrid(-floor(M/2):floor(M-1)/2, -floor(N/2):floor(N-1)/2); % Image Size Must be in Even Numbers (M & N are Even)

BW_Low_filter = 1./(1.+((sqrt(u.^2+v.^2)./D0)).^(2*n)); % Equation of Butterworth D(u,v) = (u.^2+v.^2) for Non Padded Image
%BW_Low_filter = 1./(1.+(D0./(sqrt(u.^2+v.^2))).^(2*n)); % High Pass

% Performing Filtering in Frequency Domain
output_img = f_img .* BW_Low_filter; % Convolution in Spatial Domain = Multiplication in Frequency Domain
output_img1 = ifft2(output_img);
output_img2 = mat2gray(abs(output_img1));

end

