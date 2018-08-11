%This file should segment the audio data Network to process

%% Open the relevant directory to process the wave files
filePattern = fullfile('t2','set_a','*.wav');
dirListings = dir(filePattern);
dir_len = length(dirListings);
fileID = fopen('set_a_timing.csv');
data = textscan(fileID,'%s %s %s %s','Delimiter',',');
categories ={'Artifact','Extrahls','Murmur','Normal','Unlabelled'};

%% Process every file in the directory
for i = 1:dirlen
    [y,fs] = audioread(strcat('t2\set_a\',dirListings(d).name));
    
end

%% Test module for the spectrogram
[y,fs] = audioread(strcat('t2\set_a\','normal__201108011118.wav'));

F =linspace(1,1000,2000);

% subplot(2,1,1);
spectrogram(y,500,[],F,fs,'yaxis')
colormap gray;
fig = gcf;
frame = getframe(fig);
imwrite(frame.cdata,strcat('t','.png'),'png')

% subplot(2,1,2);
% [y2,fs2] = audioread(strcat('t2\set_a\','murmur__201108222258.wav'));
% spectrogram(y2,500,[],F,fs2,'yaxis')
% colormap gray;

x_dat = str2double(data{1,4}(368:391));
%plot(y);
%hold;
%plot(x_dat,y(x_dat),'*','r');

%% Test module for the segmation