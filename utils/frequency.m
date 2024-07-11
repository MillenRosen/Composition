function p = frequency(note,Axis)
%Spectrogram
%---Sample rate defaults to 44100---
%Input
% note - Input signal (line vector)
% Axis - Coordinate range

fs=44100;
x=note;
n=length(note);

X = fftshift(fft(x./(n))); 
% Deriving the discrete Fourier transform with fft

f=linspace(-fs/2,fs/2-1,n);
% According to the Nyquist sampling theorem, the maximum original signal 
% frequency is no greater than half the sampling frequency.

L=f>0;
% Drawing unilateral spectral amplitude plots

ft=f.*L;
absXt=abs(X).*L;
p = semilogx(ft,absXt);
xlabel("f/Hz")
% ylabel("Amplitude")

% Control the coordinate range
if nargin==2
axis(Axis);
end
grid on;
end
