if sprite_index == spr_waveform {
	if warning == 0 {
		//Change sprite
		sprite_index = spr_button_prompts;
		//Reset scale
		image_xscale = 2;
		image_yscale = 2;
		//Reset angle
		image_angle = 0;
		//Randomize button prompt
		button = choose("up", "down", "left", "right");
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
			if !initial {
				obj_game.prompts_missed++;
			}
			instance_destroy();
		} else if timer <= input_buffer {
			//Hide the button if its TTL has expired, but do not destroy it yet
			image_alpha = 0;
			timer--;
		} else {
			//Check if we pressed a button to jump
			if initial {
				if tryingToJump() {
					if pressedJump() {
						right = true;
					} else {
						wrong = true;
					}
					obj_game.initialPromptUsed = true;
					obj_game.generate_enemies = true;
					//Spawn first enemy
					spawn();
				}
			} else {
				if tryingToMusic() {
					switch (button) {
					    case "right":
					        //Expect "right"
							if pressedRight() {
								right = true;
							} else {
								wrong = true;
							}
					        break;
					    case "down":
					        //Expect "down"
							if pressedDown() {
								right = true;
							} else {
								wrong = true;
							}
					        break;
					    case "left":
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
							obj_game.prompts_incorrect++;
						if !obj_player.is_grounded {
							punish();
							musicDistort();
						}
					}
					if right {
						if !obj_player.is_grounded {
							musicNormalize();
							obj_game.combo++;
							obj_game.prompts_correct++;
							//Add points
							obj_game.points_prompts += obj_game.combo*obj_game.score_multiplier;
							addHPForScore();
							if obj_game.combo == 55 || obj_game.combo == 45 || obj_game.combo == 35 || obj_game.combo == 25 || obj_game.combo == 15 || obj_game.combo == 7 || obj_game.combo == 2 {
								//Generate combo object
								instance_create_layer(x, y, "ComboText", obj_combo_text);
								//Add HP for S, SS, SSS
								if obj_game.combo == 55 || obj_game.combo == 45 || obj_game.combo == 35 {
									obj_game.hp++;
								}
							} else {
								//Show flying text
								instance_create_layer(x, y, "UI", obj_points, {points: obj_game.combo*obj_game.score_multiplier});
							}
							screenshake(1, 1, 0.25, false, true, true, false, 0.1);
						}
					}
				}
			}
			//Reduce timer
			timer--;
		}
	//Means a button was pressed during existence of the object
	} else {
		//Gradually
		if image_alpha > 0 {
			image_alpha -= 0.1;
		} else {
			instance_destroy();	
		}
	}
}
//Set the image index for the button prompt, if button was selected
buttonSpriteSelect();