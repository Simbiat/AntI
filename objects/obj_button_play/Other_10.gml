event_inherited();

// When this button is clicked
// The transition "start" sequence is played which starts the transition.
// Alarm 0 is set to run after 20 frames which switches the room to the game room.
// The 20 frames are to wait for the transition "start" animation to finish.
// When the game room starts, the transition "end" animation
// will play, which is the second half of the whole transition.

audio_stop_all();
alarm[0] = 20;