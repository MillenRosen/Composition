function s = fnote(pitch,time,wave,Mod,loudness)
%note generator
%Input
% pitch - （midinote）
% time - (s)
% wave - waveform
% Mod - volume envelope
% loudness - (%)
[T,time]=beat2time(60,time);
s=zeros(1,length(time));
for t=1:length(time)
    s(t)=wave(freq(pitch)*mod(time(t),1/freq(pitch)));% Copying of shapes
end
s=s.*Mod(time./T);% Envelope of volume
s=s*loudness;
end