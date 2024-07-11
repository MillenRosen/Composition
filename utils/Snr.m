function Snr = Snr(s,s1)
%Signal-to-Noise Ratio (SNR)
%Input
% s1 - pure signal
% s - denoised signal
%Output
% Snr - Signal-to-Noise Ration
Snr=snr(s,s1-s);
end