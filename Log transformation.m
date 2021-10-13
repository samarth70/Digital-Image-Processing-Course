[img,cmap]=imread('style1.jpg');
imgGray=rgb2gray(img);
[m,n]=size(img);
##Negative Transformation
L=2^8
negativeImg=(L-1)-imgGray;

##Log Transformation
a = double(img)/255; % Normalized Image
c = 2; 
logImg = c*log(1 + (a)); % Log Transform


## Contrast stretched image
a=0.01;
b=0.99;
y=img;
for i=1:m
for j=1:n
if y(i,j)<=a
zz(i,j)=0.5*y(i,j);
else if y(i,j)<=b
zz(i,j)=2*(y(i,j)-a)+0.5*a;
else 
zz(i,j)=0.5*(y(i,j)-b)+0.5*a+2*(b-a);
end
end
end
end

imshow(zz)
title('contrast stretched image')


##subplot(1,3,1),imshow(imgGray),title('Identity Transformation');
##subplot(1,3,2),imshow(negativeImg),title('Negative Transformation');
##subplot(1,3,3),imshow(logImg),title('Log Transformation');
