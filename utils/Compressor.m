function [s1,p] = Compressor(s,Threshold,Ratio,Attack,Release,Gain,Wet)
%Compressor
%Input
% s - Original Signal
% Threshold - (0~1)
% Radio - (%)
% Attack - (ms)
% Release - (ms)
% Gain - (%)
% Wet - (%)

offsets=(s>Threshold).*(s-(Threshold)).*(1-1/Ratio)...
    +(s<-Threshold).*(s-(Threshold)).*(1-1/Ratio);
[TA,tA]=beat2time(60,Attack/1000);
[TR,tR]=beat2time(60,Release/1000);
h1=1/length(tA);
h2=1/length(tR);
Mod=0;
len=400;
p=zeros(1,length(s));% Set a 'p' to record the amount of compression
for i=1:length(s)
    if (max(abs(s(i:i+len-1)))>Threshold)&&(Mod<=1)
        Mod=Mod+h1;
    end
    if (max(abs(s(i:i+len-1)))<=Threshold)&&(Mod>=0)
        Mod=Mod-h2;
    end
    if Mod<0
        Mod=0;
    end
    if (i+len)>=length(s)
        break
    end
    p(i)=Mod;
end
s1=s;
s1=s-p.*offsets;
s1=Wet/100*s1+(1-Wet/100)*s;
s1=s1.*(1+Gain/100);
end