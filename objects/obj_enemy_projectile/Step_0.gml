// Inherit the parent event
event_inherited();

//Slowly remove object
if destroyedSprite != noone && sprite_index == destroyedSprite {
	image_alpha -= 0.01;
}
//Fully remove it
if image_alpha <= 0 {
	instance_destroy();	
}