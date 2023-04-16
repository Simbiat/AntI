if value != targetValue {
	if value < targetValue {
		if points {
			font_color = c_green;
		}
		var change = clamp(abs(targetValue/(room_speed/2)), 0, targetValue - value);
		value += change;
		if (points || (bonus && bonus_multiplier != 0)) && instance_exists(go_total_points) {
			if !points {
				change = change*bonus_multiplier;
			}
			with go_total_points {
				value += change;
				targetValue = value;
				font_color = c_green;
			}
		}
	} else if value > targetValue {
		if points {
			font_color = c_red;
		}
		var change = clamp(abs(targetValue/(room_speed/2)), 0, value - targetValue);
		value -= change;
		if (points || (bonus && bonus_multiplier != 0)) && instance_exists(go_total_points) {
			if !points {
				change = change*bonus_multiplier;
			}
			with go_total_points {
				value -= change;
				if value < 0 {
					value = 0;	
				}
				targetValue = value;
				font_color = c_red;
			}
		}
	}
} else {
	font_color = c_white;
	if !finished {
		if points && instance_exists(go_total_points) {
			with go_total_points {
				font_color = c_white;
			}
		}
		finished = true;	
		//Trigger next sequence
		if next_sequence != noone {
			layer_sequence_create("GameOver", room_width/2, room_height/2, next_sequence);
		}
	}
}