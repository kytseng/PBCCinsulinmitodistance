%% Histogram Analysis
% Kaylee Tseng
% Uses Imaris .csv output files
% Compile output files into a folder
close all
clear

addpath('test') % Adds folder w/ .csv files to path 
files = dir('test'); % reads file data from folder
filenames={files(:).name}'; 
csvfiles=filenames(endsWith(filenames,'.csv')); %isolates .csv files

n = length(csvfiles);
y = [0,0.6]; % y axis bounds for histogram, can adjust as needed

for i = 1:n
    x = readmatrix(csvfiles{i}); %reads data from each sheet
    data{i} = x(:,1); %extracts distance 
    figure
    histogram(data{i},'Normalization','probability','BinLimits',[0,5],'NumBins',10) %histogram parameters can be changed, see histogram MATLAB documentation
    xlabel('Shortest distance vesicle to mitochondria ({\mu}m)')
    ylim(y)
    ylabel('Probability')
    title(csvfiles{i})
end
% Each histogram outputs as its own figure, can also plot histograms into
% one big figure using the subplot function instead
