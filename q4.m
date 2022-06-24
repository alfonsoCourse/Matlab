close all;
clear;
clc;

img = imread("Threshold_Binary.bmp");
[M,N] = size(img);
T1 = 0.9;  %min threshold value
T2 = 0.99;  % max treshold value
conn = 4;

%Hysteresis thresholding
%https://uk.mathworks.com/matlabcentral/fileexchange/44648-hysteresis-thresholding-for-3d-images-or-2d

[tri, hys]= hysteresis3d(img, T1, T2 , conn);
figure('Name', 'hysteresis3d');
imshow(hys)
imwrite(hys, sprintf('Hysteresis_thresholding.bmp'));

% Majority Filter

winSize  = 2.5; % This value can be modified to adjust window size
img2 = img;

for i = 1 + floor(winSize/2):M - floor(winSize/2) 
    for j = 1 + floor(winSize/2):N - floor(winSize/2) 
        window = img(i-floor(winSize/2):i+floor(winSize/2),j-floor(winSize/2):j+floor(winSize/2));
        window = window(:);
        outputValue = mode(window);
        img2(i,j) = uint8(outputValue);
        
    end 
end

figure('Name', 'Majority Filter');
imshow(img2);

selectedPixels = sum(img2==1,'all'); %Add pixels

cc = bwconncomp(img2); %Find connected components on the image
clusters  = cc.NumObjects;

imwrite(img2, sprintf('Majority Filter %.2f.bmp',winSize)); %store image with the windwos size up to of 2 decialms
