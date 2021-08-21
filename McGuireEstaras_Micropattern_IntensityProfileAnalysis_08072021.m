%% Section I: Clear Workspace

%clear all variables and close all figures

clear all %clears variables
close all %closes open figures/tables/etc.
clc % clears command window
%% Section II: Call Image and Define Diameter of Image

file=uigetfile('*.PNG'); %Prompts to select a PNG from working folder
Image=imread(file); %read the image into matlab as a matrix

%Diameter

x=[0 size(Image,2)]; %End point x
y=[size(Image,1)/2 size(Image,1)/2]; %endpoint Y

c=improfile(Image,x,y);%Intensity profile along horizontal diameter
%% Section III: Intensity Profile Subplot

%This section intends to show a rough intensity profile for chosen color...
%plotted with the diameter line superimposed on micropattern image

figure

%Superimpose diameter over micropattern image

subplot(2,1,1)
imshow(Image)
hold on
plot(x,y,'r')
title('Micropattern with Diameter')

%Plot RGB Color profile for micropattern
%For our experiement, R=SOX17, G=SOX2, & R+B(Pink)=Brachury

subplot(2,1,2) 
plot(c(:,1,1),'r') %red
hold on
plot(c(:,1,2),'g') %green
plot(c(:,1,3),'b') %blue
title('RGB Intensity Profile of Micropattern')
xlabel('Distance from Image Edge (Pixels)')
ylabel('Intensity (a.u.)')
savefig('INSERTNAME_Subplot.fig') %Save as matlab figure
%% Section IV: Save Intensity Profile Figure

figure
improfile(Image,x,y), grid on %RGB Intensity Profile
title('Intensity Profile of a Micropattern')
xlabel('Distance from Image Edge (Pixels)')
ylabel('Intensity (a.u.)')
savefig('INSERTNAME.fig') %Save as matlab figure
%% Section V: Extract Data Points from Figure

open INSERTNAME.fig %Open figure from Section IV
ax=gca; %Give current axes of figure
h=findobj(gca,'Type','line'); %Look at lines within axis
xdata=h.XData; %Acquire distance/x points
y1=h(1).YData; %Intensity Values Y1: Blue
y2=h(2).YData; %Intensity Values Y2: Green
y3=h(3).YData; %Intensity Values Y2: Red


%Save X and all Y values into an individual CSV file

writematrix(xdata,'xaxis_INSERTNAME.csv')
writematrix(y1,'blue_INSERTNAME.csv')
writematrix(y2,'green_INSERTNAME.csv')
writematrix(y3,'red_INSERTNAME.csv') 