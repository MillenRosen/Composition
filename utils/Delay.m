function [s1,d] = Delay(s,delaytime,BPM,times,n)
%Delay
%   the length of the genarate signal will be extented
%Input
% s - Original Signal
% delaytime - （beat）
% BPM - Beat Per Minute
% times - echoes times
% n - decay factor
%Outout
% s1 - siganl processed
% d - each signal of the echoes 
[T,t]=beat2time(BPM,delaytime);
f=@(x) exp(-x*n);
r=zeros(1,length(t));s1=[s repmat(r,1,times)];
for i=1:times;
    d{i}=[repmat(r,1,i) s repmat(r,1,times-i)].*f(i);
    s1=s1+d{i};
end
end