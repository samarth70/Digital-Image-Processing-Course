[img,cmap]= imread("image1.jpeg");
[M,N]=size(img);
f_in=fft2(double(img));
D0=20;
u=0:(M-1);
idx=find(u>M/2);
u(idx)=u(idx)-M;
v=0:(N-1);
idy=find(v>N/2);
v(idy)=v(idy)-N;

[V,U]=meshgrid(v,u);
D=sqrt(U.^2+V.^2);

% Ideal high pass filter
H=double(D>D0);
G=H.*f_in;
out=real(ifft2(double(G)));

% Butterworth 
n=2;
H_butterworth=1./(1+(D0./D).^(2*n));
G_butterworth=H_butterworth.*f_in;
out_butterworth=real(ifft2(double(G_butterworth)));

% Gaussian
H_gaussian=exp((-1.*D.^2)/(2*D0*D0));
G_gaussian=(1-H_gaussian).*f_in;
out_gaussian=real(ifft2(double(G_gaussian)));

subplot(2,2,1),imshow(img),title('Original');
subplot(2,2,2),imshow(out,[]),title('Ideal high pass filter');
subplot(2,2,3),imshow(out_butterworth,[]),title('Butterworth high pass filter');
subplot(2,2,4),imshow(out_gaussian,[]),title('Gaussian High Pass filter');





