function m = ADSR1(Attack,Decay,Sustain,Release,Max,Amplitude)
%Note ADSR envelope function
%Input
% Attack - attack time
% Decay - decay time
% Sustain - sustain time
% Release - release time
% Max - peak
% Amplitude - size of amplitude

Time=Attack+Decay+Sustain+Release;
tt=cumsum([Time.\Attack Time.\Decay Time.\Sustain Time.\Release]);
m=@(x) (0<x).*(x<=tt(1)).*Max./tt(1).*x...
    +(tt(1)<x).*(x<=tt(2)).*((Amplitude-Max)/(tt(2)-tt(1)).*(x-tt(1))+Max)...
    +(tt(2)<x).*(x<=tt(3)).*Amplitude...
    +(tt(3)<x).*(x<=tt(4)).*((-Amplitude)/(tt(4)-tt(3)).*(x-tt(3))+Amplitude);
end