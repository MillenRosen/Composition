function [T,t] = beat2time(BPM,c)
%Converting BPM into corresponding note durations and vectors
%Input
% BPM - Beat Per Minute
% c - Note (Input 1/4 if it's a 1/4 note)
%Output
% T - Note duration(s)
% t - Time vector with sampling rate fs from 0 to T

fs=44100;dt=1/fs;
beat=60/BPM;
T=beat*c;
t=0:dt:T;
end
