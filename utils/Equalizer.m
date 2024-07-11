function s1 = Equalizer(s,fband,Gain)
%Equalizer
%Input
% s - original signal
% fband - range of frequency(Hz)
% Gain - (%)
x=s./length(s);
Fx=fft(x);
shiftFs=fftshift(Fx);
fs=44100;
f=linspace(-fs/2,fs/2-1,length(s));
L=length(fband);
if mod(L,2)==1,error('error'),end
for i=1:L/2
    Lf=(fband(2*i-1)<abs(f)).*(abs(f)<fband(2*i));
    shiftFs(shiftFs.*Lf~=0)=shiftFs(shiftFs.*Lf~=0)*(1+Gain(i)/100);
end
Fst=ifftshift(shiftFs);
xt=ifft(Fst);
s1=xt.*length(s);