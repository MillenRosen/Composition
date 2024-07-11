function s = fnote2(pitch,time,wave,Mod,loudness)
%Note generator (linear change of pitch)
%Input
% pitch - （midinote）
% time - (s)
% wave - waveform
% Mod - volume envelope
% loudness - (%)
[T,time]=beat2time(60,time);
s=zeros(1,length(time));
p=linspace(pitch(1),pitch(end),length(time));
for t=1:length(time)
    s(t)=wave(freq(p(t))*mod(time(t),1/freq(p(t))));% Copying of shapes
end
s=s.*Mod(time./T); % Envelope of volume
s=s*loudness;
end