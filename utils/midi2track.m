function track = midi2track(midifile)
% Track Encoder ------ You need to use your DAW generate MIDI files. 
%Input
% midifoile - use 'readmidi' to get a midifile
%Output
% track - a matrix that contains A matrix containing Note & Rythm message

track=midifile.track(2).messages;t=1;ctick=0;
for i=1:length(track)
    if midifile.track(2).messages(i).type==144        
        ctick=ctick+track(i).deltatime;
        mididata{t}=[track(i).data;track(i).deltatime;ctick;1];
        t=t+1;
    end
    if midifile.track(2).messages(i).type==128 
        ctick=ctick+track(i).deltatime;
        mididata{t}=[track(i).data;track(i).deltatime;ctick;0];
        t=t+1;
    end
end

for i=1:length(mididata)
    midinote(i,:)=mididata{i}';
end
track=midinote;
end