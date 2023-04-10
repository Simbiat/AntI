// Inherit the parent event
event_inherited();

function changeDirection() {
	if facing == "left" {
		targetX = clamp(x - room_width/dividerX, sprite_width/2, room_width - sprite_width/2);
	} else {
		targetX = clamp(x + room_width/dividerX, sprite_width/2, room_width - sprite_width/2);
	}
	targetY = random_range(sprite_height/2,  900 - sprite_height/2);
}

function noseLocation()
{
	noseY = y + 6;
	if facing == "left" {
		noseX = x - sprite_width/2 + 5;
	} else {
		noseX = x + sprite_width/2 - 5;
	}
}

function suckNotes()
{
	//Remove "suckedIn" flag from all bullets on screen
	with obj_bullet {
		suckedIn = false;
	}
	//Get the bullets in area
	var notes = ds_list_create();
	//We can use the same rectangle coordinates for both left and right movement, because 
	//when changing "facing" value we also switch scaling by -1, which is applied to sprite width and height
	var notesCount = collision_rectangle_list(x - sprite_width/4, y - sprite_height/2, x - sprite_width*1.5, y + sprite_height/2, obj_bullet, false, true, notes, false);
	if notesCount > 0 {
	    for (var i = 0; i < notesCount; ++i;) {
			var bullet = notes[| i];
	        with bullet {
				suckedIn = true;
				suckX = other.noseX
				suckY = other.noseY;
			}
	    }
	}
	ds_list_destroy(notes);
}

changeDirection();