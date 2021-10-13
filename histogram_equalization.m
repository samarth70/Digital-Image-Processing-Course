
## To display a histogram of an image and to perform histogram equalization
[img,cmap]= imread('cameraman.jpg');


[x, y] = size(A);
frequency = 1 : 256;
  
count = 0;
  

% for every possible intensity value
% and count them
    
for i = 1 : 256
    for j = 1 : x
        for k = 1 : y
 
            if img(j, k) == i-1
                    count = count + 1;
            end
        end
    end
    frequency(i) = count;
  
    count = 0;
  
end
 
n = 0 : 255;

subplot(3,1,1);imshow(img);title('Original'); 


subplot(3,1,2);
stem(n, frequency);  
grid on;ylabel('No. of pixels');xlabel('Intensity Levels');title('HISTOGRAM OF THE IMAGE');

subplot(3,1,3),imhist(img,cmap),title('Original Histogram');


