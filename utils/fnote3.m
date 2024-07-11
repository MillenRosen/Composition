function s = fnote3(pitch,n,time,wave,Mod,loudness)
%Note generator (exponential change of pitch)
%Input
% pitch - （midinote）
% time - (s)
% wave - waveform
% Mod - volume envelope
% loudness - (%)
[T,time]=beat2time(60,time);
s=zeros(1,length(time));
f=@(x) exp(-x*n);
k=(pitch(1)-pitch(end))/(f(1)-f(length(time)));
p=k*f(1:length(time))
for t=1:length(time)
    s(t)=wave(freq(p(t))*mod(time(t),1/freq(p(t))));% Copying of shapes
end
s=s.*Mod(time./T); % Envelope of volume
s=s*loudness;
end