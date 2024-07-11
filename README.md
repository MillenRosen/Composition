Arranging Music with MATLAB
====
Matlab can be used as an arranger to create musical compositions. It's not as convenient as other arranging software though, it's fun to learn about sound principles in this way. I have written some functions, see utils, starting from the most primitive way to eventually realise a piece of music. You need to follow these steps to do this:

## 1. Get the midi file from your DAW.
Using FL Studio as an example, you can export midi files from Piano Roll. Then use the midi2track function to generate a matrix containing the track information. (Of course, you can also write the matrix manually, but it may be too much trouble).

## 2. Designing the timbre
You can start by writing separate implicit functions to plot the waveform of the sound in one amplitude, and the envelope of the note. The ADSR1 and ADSR2 functions are provided to quickly generate the envelopes. Individual notes are then obtained using the fnote, fnote2 and fnote3 functions. For easy insertion, you can customise the loop to generate the notes of each scale consecutively. Or you can generate noise or fixed pitch notes as drum beats.

## 3. Determining the tempo
This may require a bit of thinking about the relationship between time and beat, but you can also use the tick2time, beat2time functions to convert the corresponding time directly. In order to insert notes later, you need to generate an array of ctime to keep track of the time accumulated for each tick. If the conversion scheme is 1 beat = 60/BPM second = 96 ticks, and if the whole song has a fixed tempo of 120 BPM, with 4*16 beats, then the ctime should be written like this:

        BPM=120*ones(96*4*16); %BPM per tick.
        deltatime=60/96./BPM; %time for each tick
        ctime=cumsum(deltatime); % cumulative time per tick

## 4. Inserting notes into a piece of music
The soundTrack function makes it easy and quick to insert notes into the timeline, provided you have done all the previous preparations.

## 5. Mixing and effects
I've also written simple functions for Compressor, Delay, and Equlizer. You can also use the more advanced functions of the Signal Processing Toolbox to make the sound fuller.

In the project I also provided three Matlab live scripts for sound design, reading midi files and actually writing a song. You can refer to them to write your own music.

### Have fun!
### And feel free to contact me! <lity78@mail2.sysu.edu.cn>

