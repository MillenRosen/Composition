function [] = frequency2(note,Axis)
%Spectrogram(log of modulus)
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

semilogx(ft,log(1+sqrt(absXt)),'r');
% impose logarithms on the y-coordinate, thus making the display obvious

% xlabel("f/Hz")
% ylabel(' ')
if nargin==2
axis(Axis)
end
grid on
end
