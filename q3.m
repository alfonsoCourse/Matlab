close all;
clear;
clc;

RGB = imread(uigetfile('*'));
BW = q3_threshold(RGB); 

%Disconnected clusters 
%https://uk.mathworks.com/help/images/ref/bwconncomp.html

dc = bwconncomp(BW); 
Disconected_Clusters = dc.NumObjects;

%Selected pixels 
Pixels = sum(BW (:));

%Binary image
imwrite(BW,"Threshold_Binary.bmp");

%Hadamard image
GreyImg = rgb2gray(RGB); 
hadamard = immultiply(BW,GreyImg); 
imwrite(hadamard,"Hadamard_Image.bmp");


