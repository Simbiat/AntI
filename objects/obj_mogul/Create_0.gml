// Inherit the parent event
event_inherited();

function zigZag() {
	targetX = x - room_width/dividerX;
	if going == "up" {
		targetY = clamp(y - room_height/dividerY, sprite_height/2,  900 - sprite_height/2);
	} else {
		targetY = clamp(y + room_height/dividerY, sprite_height/2,  900 - sprite_height/2);
	}
	var expectedDirection = point_direction(x, y, targetX, targetY);
	if going == "up" {
		//Too close to ceiling
		if expectedDirection <= 180 && expectedDirection > 150 {
			going = "down";
			targetY = clamp(y + room_height/dividerY, sprite_height/2,  900 - sprite_height/2);
		}
	} else {
		//Too close to floor
		if expectedDirection <= 180 && expectedDirection > 150 {
			going = "up";
			targetY = clamp(y - room_height/dividerY, sprite_height/2,  900 - sprite_height/2);
		}
	}
}

zigZag();