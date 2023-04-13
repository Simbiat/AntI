// Inherit the parent event
event_inherited();

//Default values
audio_emitter = audio_emitter_create();
audio_customBus = audio_bus_create();
audio_emitter_bus(audio_emitter, audio_customBus);
music_file = bensound_highoctane;
music_offset = 0;
effectsReset();