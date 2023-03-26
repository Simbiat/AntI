// When you release the mouse, this event is called
// In this event the frame changes and the button sound is played
// Children objects can inherit this event to program their own click behaviour
selected = true;
pressed = true;
alarm[0] = 10;
if sound_press != noone {
	audio_play_sound(sound_press, 0, 0);	
}