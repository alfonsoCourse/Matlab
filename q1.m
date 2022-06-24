close all;
clear;
clc;

img = imread(uigetfile('*'));
Greyimg = double(rgb2gray(img));

%Range

range = max(Greyimg(:)) - min(Greyimg(:));
disp("RANGE : " + range);

%Normalised Range
t = 8 ;

NormaliseRange = range / ((2^t) - 1);

disp("Normalised Range: " + NormaliseRange);

%Michelson Contrast 

MichelsonContrast = range / (max(Greyimg(:)) + min(Greyimg(:)));

disp("Michelson Contrast: " + MichelsonContrast );

%Simple Arithmetic Mean 

M = height(Greyimg);
N = width(Greyimg);

SimpleArithMean = sum(Greyimg(:))/(M*N);
disp("Simple Arithmetic Mean: " + SimpleArithMean);


%RMS Contrast

RMS = sqrt((1/(M*N))*sum(sum((Greyimg-SimpleArithMean).^2)));
disp("RMS Contrast: " + RMS);

%Harmonic Mean 

% https://uk.mathworks.com/help/stats/harmmean.html 
Harmonic   = harmmean(double(Greyimg(:)));

disp("Harmonic Mean: " + Harmonic);

%Geometric Mean 

% https://uk.mathworks.com/help/stats/geomean.html

Geometric   = geomean(double(Greyimg(:)));
disp("Geometric Mean: " + Geometric);

%Midrange

MidRange = ((max(Greyimg(:)) + min(Greyimg(:)))/2);

disp ("Midrange: " + MidRange);

%10% Winsorised Mean 

%https://www.investopedia.com/terms/w/winsorized_mean.asp

imgArray = Greyimg(:);
Array = sort(imgArray);

all = numel(Array);

P = all * 0.1;
Array(1:P) = Array(P);
Array(all - P:all) = Array(all - P);

percentile = mean(Array);

disp("Winsorised Mean: " + percentile);

%10% Trimmed Mean 

%https://uk.mathworks.com/help/stats/trimmean.html
trimmed = trimmean(Greyimg, 10,'all');
disp("Trimmed Mean: " + trimmed);