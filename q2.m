close all;
clear;
clc;

img = imread(uigetfile('*'));
[M,N] = size(img);
MN = M * N;

%Histogram of RGB values

R = imhist(img(:,:,1));
G = imhist(img(:,:,2));
B = imhist(img(:,:,3));

%Count Histogram-------------------------------
maxY = max(max([R, G, B]));
Count_Histogram_Graph = figure("Name", "Count Histogram");

hold on;
% Graph definition

xlabel("Luminance"); 
ylabel("Counts"); 
title("Count Histogram Graph");
axis square;

ylim([0, maxY]);
xlim([0, 255]); 

% Plotting

plot(R, "Red");
plot (G,"Green");
plot (B,"Blue")

hold off;

print("Count_Histogram_Graph", "-djpeg");

%Normalised Count Histogram -------------------------------------------
Normalised_Count_Histogram_Graph = figure("Name", "Normalised Count Histogram");

hold on;

%Graph Definition
xlabel("Luminance");
ylabel("Counts");
title("Normalised Count Histogram Graph");
axis square;

ylim([0,(maxY/MN)]);
xlim([0, 255]);

%Plotting 

plot((R/MN), "Red");
plot((G/MN), "Green");
plot((B/MN), "Blue");

hold off;

print("Normalised_Count_Histogram_Graph", "-djpeg");



%Cumulative Count Histogram --------------------------------

Cumulative_Count_Histogram = figure("Name", "Cumulative Count Histogram");

hold on;

%Calculations

cumR = cumsum(R);
cumG = cumsum(G);
cumB = cumsum(B);

maxcumY = max(max([cumR, cumG, cumB]));


%Graph Definition
xlabel("Luminance");
ylabel("Count");
title("Cumulative Count Histogram");
axis square;

ylim([0,maxcumY]);
xlim([0, 255]);


%Plotting

plot(cumR, "Red");
plot(cumG, "Green");
plot(cumB, "Blue");

hold off;

print("Cumulative_Count_Histogram", "-djpeg");

%Normalised Cumulative Count Histogram-------------------------------

Normalised_Cumulative_Count_Histogram = figure("Name", "Normalised Cumulative Count Histogram");

hold on;

%Graph Definition

xlabel("Luminance");
ylabel("Count");
title("Normalised Cumulative Count Histogram");
axis square;

ylim([0,maxcumY/MN]);
xlim([0, 255]);

%Plotting
plot(cumR/MN, "Red");
plot(cumG/MN, "Green");
plot(cumB/MN, "Blue");

hold off;

print("Normalised_Cumulative_Count_Histogram", "-djpeg");