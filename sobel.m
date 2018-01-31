%Input Image
clc;
clear all;
close all;

A=imread('D:/DIP/CH03/Fig0342(a)(contact_lens_original).tif');
C=double(A);

%Implementation of the equation
for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        
        %Sobel mask for horizontally-direction:
        Gx(i,j)=1*C(i,j)+2*C(i,j+1)+1*C(i,j+2)-0*C(i+1,j)+0*C(i+1,j+1)-0*C(i+1,j+2)-1*C(i+2,j)-2*C(i+2,j+1)-1*C(i+2,j+2);
        %Sobel mask for vertically-direction:
        Gy(i,j)=-1*C(i,j)-0*C(i,j+1)+1*C(i,j+2)-2*C(i+1,j)+0*C(i+1,j+1)+2*C(i+1,j+2)-1*C(i+2,j)+0*C(i+2,j+1)+1*C(i+2,j+2);
        %The gradient of the image
        B(i,j)=sqrt(Gx(i,j).^2+Gy(i,j).^2);
      
    end
end

subplot(2,2,1);
imshow(A); title('Original image');
subplot(2,2,2);
B=uint8(B);
imshow(B); title('Sobel gradient');
subplot(2,2,3);
%Gy=uint8(Gy);
imshow(Gy); title('Sobel mask for vertical directions');
subplot(2,2,4);
%Gx=uint8(Gx);
imshow(uint8(Gx+Gy)); title('Sobel mask for horizontal directions');