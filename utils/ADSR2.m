function m = ADSR2(Attack,Decay,Sustain,Release,Max,Amplitude,n)
%Note ADSR envelope function
%Input
% Attack - attack time
% Decay - decay time
% Sustain - sustain time
% Release - release time
% Max - peak
% Amplitude - size of amplitude
% n - decay factor

Time=Attack+Decay+Sustain+Release;
tt=cumsum([Time.\Attack Time.\Decay Time.\Sustain Time.\Release]);
f=@(q) exp(-q*n);% decay function
k1=(Max-Amplitude)./(f(tt(1))-f(tt(2)));
b1=Max-k1*f(tt(1));
k2=Amplitude./(f(tt(3))-f(tt(4)));
b2=Amplitude-k2*f(tt(3));
m=@(x) (0<x).*(x<=tt(1)).*Max.*sin(pi*x/2/tt(1))...
    +(tt(1)<x).*(x<=tt(2)).*(k1*f(x)+b1)...
    +(tt(2)<x).*(x<=tt(3)).*Amplitude...
    +(tt(3)<x).*(x<=tt(4)).*(k2*f(x)+b2);
end