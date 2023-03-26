if !wrong && !right {
	if timer <= 0 {
		obj_game.combo = 0;
		instance_destroy();	
	} else if timer <= input_buffer {
		//Hide the button if its TTL has expired, but do not destroy it yet
		image_alpha = 0;
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
			if wrong && instance_exists(obj_player) {
				obj_game.combo = 0;
				screenshake(1, 2, 0.25, false, true, true, false);
				daveJump(true);
			}
			if right {
				obj_game.combo++;
				//Add points
				obj_game.points += obj_game.combo*100;
				screenshake(2, 1, 0.25, false, true, true, false);
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