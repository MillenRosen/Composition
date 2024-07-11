function s= soundTrack(track,source,t,ctime,fs,Lnote,decayFactor)
% Write tracks to audios
%Input 
% track - encode from midi files
% source - one note or cells (The index must correspond to MIDI)
% t - (s) total time
% ctime - Accumulated time based on BPM
% fs - Sample Rate
% Lnote - length of a note (time*fs)
% decayfactor - Attenuation coefficient 

Pstart=1;Pend=1;%Set pointers for the start and end positions 
L=length(track);
s=zeros(2,fs*t);
for i=1:length(track)
    if track(i,1)>=108
        continue
    end
    if track(i,1)<=20
        continue
    end
    if track(i,5)==1
        cumulateTick=track(i,4)+1;

        %cumulate Tick -> Time
        cumulateTime=ctime(cumulateTick);

        t1=round(cumulateTime*fs);%Start time
        for j=max([Pend i])+1:L
            if track(j,5)==0
                Pend=j;
                cumulateTick=track(j,4)+1;

                %cumulate Tick -> Time
                cumulateTime=ctime(cumulateTick);
                t2=round(cumulateTime*fs);%End time
               
                %Insert a Note
                if iscell(source)
                    note=source{track(i,1)}'.*track(i,2)./127./2;
                else
                    note=source'.*track(i,2)./127./2;
                end

                [~,y]=max(size(note));
                if y==1,note=note';end% Ensure that the notes are horizontal

                try
                s(:,t1:t2)=s(:,t1:t2)+note(:,1:t2-t1+1);
                catch,
                    s(:,t1+1:t1+Lnote)=s(:,t1+1:t1+Lnote)+note;break
                end
                
                %Exponential decay tail
                fadeout=note(:,t2-t1+2:Lnote).*exp(-(0:Lnote+t1-t2-2)/decayFactor);
                s(:,t2+1:t1+Lnote-1)=s(:,t2+1:t1+Lnote-1)+fadeout;
                break
            end
        end
    end
end
end