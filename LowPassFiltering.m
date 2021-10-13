#To perform frequency domain low pass filtering on an image using Ideal,gaussian,and butterworth low passs filter

[img,cmap]= imread('image7.png');

[M, N] = size(img);
  
% fft2 (2D fast fourier transform)
FT_img = fft2(double(img));
  
% Assign the order value
n = 2; % one can change this value accordingly
  
% Assign Cut-off Frequency
D0 = 20; % one can change this value accordingly
  
% Designing filter 1
u = 0:(M-1);
idx = find(u > M/2);
u(idx) = u(idx) - M;
v = 0:(N-1);
idy = find(v > N/2);
v(idy) = v(idy) - N;
 

[V, U] = meshgrid(v, u);
  
% Calculating Euclidean Distance
D = sqrt(U.^2 + V.^2);

% determining the filtering mask
H_ideal=double(D<=D0);
G_ideal=H_ideal.*FT_img;

  
% determining the filtering mask
H = 1./(1 + (D./D0).^(2*n));
  
% Convolution between the Fourier Transformed 
% image and the mask
G = H.*FT_img;
   
% ifft2 (2D inverse fast fourier transform)   
output_image = real(ifft2(double(G))); 
    
% Displaying Input Image and Output Image 
subplot(2, 2, 1), imshow(img,[]),title('ORIGINAL IMAGE'); 
subplot(2, 2, 2), imshow(output_image, [ ]),title('BUTTERWORTH LOW PASS FILTERING');

subplot(2, 2, 3), imshow(real(ifft2(double(G_ideal))), [ ]),title('IDEAL LOW PASS FILTERING');

subplot(2, 2, 4), imshow(output_image,[]),title('GAUSSIAN LOW PASS FILTERING');
