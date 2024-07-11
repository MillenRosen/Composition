function f = freq(midinote)
%Returns the frequency according to the midi note
%Input
% midinote - midi note number (e.g. A4 440Hz has a number of 69) 

f=440*2^((1/12)*(midinote-69));
end