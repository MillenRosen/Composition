function [T,t] = tick2time(BPM,c,unit)
% Converts BPM into a vector of durations and times corresponding to notes
%Input
% BPM - Beat Per Minute
% c - Number of Ticks
% unit - ticks every beat
%Output
% T - Time Duration of a note(s)
% t - Time vector with sampling rate fs from 0 to T

fs=44100;dt=1/fs;
beat=60/BPM;
T=beat*c/unit;
t=0:dt:T;
end
