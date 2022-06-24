close all;
clear;
clc;

img = imread(uigetfile('*.bmp'));

%Strel types
Disk = strel('disk', 3); 
Diamond = strel('diamond', 1); 
Square = strel('square', 20); 

% Dilate
DilatedBMP = imdilate(img,Diamond);
DilatedPixels = sum(DilatedBMP == 1, "all");
dcDilate = bwconncomp(DilatedBMP);
DilatedCluster = dcDilate.NumObjects;
imshow(DilatedBMP)
print("Dilate_Morphological_Operators ","-dbmp");

% Gradient
GradientBMP = imdilate(img,Diamond)-imerode(img,Diamond);
PixelsGradient = sum(GradientBMP == 1, "all");
dcGrad = bwconncomp(GradientBMP);
GradientClusters = dcGrad.NumObjects;
imshow(GradientBMP)
print("Gradient_Morphological_Operator ","-dbmp");

% Erode
ErodeBMP = imerode(img,Diamond);
selPixelsEro = sum(ErodeBMP == 1, "all");
dcErode = bwconncomp(ErodeBMP);
ErosionClusters = dcErode.NumObjects;
imshow(ErodeBMP)
print("Erode_Morphological_Operator ","-dbmp");

% Open
openBMP = imopen(img,Square);
PixelsOpen = sum(openBMP == 1, "all");
dcOpen = bwconncomp(openBMP);
OpenClusters = dcOpen.NumObjects;
imshow(openBMP)
print("Open_Morphological_Operator","-dbmp");

% Close
closeBMP = imclose(img,Square);
PixelsClose = sum(closeBMP == 1, "all");
dcClose = bwconncomp(closeBMP);
CloseClusters = dcClose.NumObjects;
imshow(closeBMP)
print("Close_Morphological_Operator ","-dbmp");













