if sprite_index == spr_waveform {
	if warning == 0 {
		//Change sprite
		sprite_index = spr_button_prompts;
		//Reset scale
		image_xscale = 1;
		image_yscale = 1;
		//Reset angle
		image_angle = 0;
		//Randomize button prompt
		image_index = irandom_range(0, 3);
	} else {
		warning--;
		//Spin
		image_angle += 5;
		//Enlarge
		image_xscale += 0.025;
		image_yscale += 0.025;
	}
} else {
	if !wrong && !right {
		if timer <= 0 {
			obj_game.combo = 0;
			instance_destroy();	
		} else if timer <= input_buffer {
			//Hide the button if its TTL has expired, but do not destroy it yet
			image_alpha = 0;
			timer--;
		} else {
			//Check if we pressed a button to jump
			if tryingToJump() {
				switch (image_index) {
				    case 1:
				        //Expect "right"
						if pressedRight() {
							right = true;
						} else {
							wrong = true;
						}
				        break;
				    case 2:
				        //Expect "down"
						if pressedDown() {
							right = true;
						} else {
							wrong = true;
						}
				        break;
				    case 3:
				        //Expect "left"
						if pressedLeft() {
							right = true;
						} else {
							wrong = true;
						}
				        break;
				    default:
				        //Expect "up"
						if pressedUp() {
							right = true;
						} else {
							wrong = true;
						}
				        break;
				}
				if wrong && timer > ttl + input_buffer {
					//If wrong input is detected within small input buffer at the start of the prompt - ignore it, assume accident
					wrong = false;
				}
				if wrong && instance_exists(obj_player) {
					obj_game.combo = 0;
					if !obj_player.is_grounded {
						punish();
					}
				}
				if right {
					obj_game.combo++;
					//Add points
					obj_game.points += obj_game.combo*100;
					screenshake(2, 1, 0.25, false, true, true, false);
				}
				if initial && (right || wrong) {
					obj_game.initialPromptUsed = true;
					//Spawn first enemy
					spawn();
				}
			}
			//Reduce timer
			timer--;
		}
	//Means a button was pressed during existence of the object
	} else {
		//Gradually
		if image_alpha > 0 {
			image_alpha--;
		} else {
			instance_destroy();	
		}
	}
}