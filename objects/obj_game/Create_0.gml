// Set game width, height and scale
var width = 1920, height = 1080, scale = min(1, display_get_width() / 1920);

// Set window size and surface resolution
window_set_size(width*scale, height*scale);
surface_resize(application_surface, width*scale, height*scale);

// Move window to center of display
window_set_position(display_get_width()/2-(width*scale)/2, display_get_height()/2-(height*scale)/2);

// Set correct size for GUI layer
display_set_gui_size(width*scale, height*scale);

randomise();

//Generate font from sprite
if !variable_global_exists("score_font") {
    global.score_font = font_add_sprite_ext(spr_score_font, "0123456789", true, 2);
}


function addLife()
{
	//Prevent exceeding the maximum of lives
	if daves < max_daves {
		//Add life icon instance
		if instance_exists(obj_life) {
			instance_create_layer(room_width - 36 - obj_life.sprite_width/1.5 * daves, room_height - 50, "UI", obj_life);
		} else {
			instance_create_layer(room_width - 36, room_height - 50, "UI", obj_life);
		}
		//Add life
		daves += 1;
	}
}

//Default values
music_file = bensound_highoctane;
music_offset = 2.5;
