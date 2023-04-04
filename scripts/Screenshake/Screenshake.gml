function screenshake(_time, _magnitude, _fade = 0.25, _left = true, _right = true, _top = true, _bottom = true, _vibration = 0) {
	if object_exists(obj_screenshake) {
		with obj_screenshake {
			shaking = true;
			time = _time;
			magnitude = _magnitude;
			fade = _fade;
			left = _left;
			right = _right;
			top = _top;
			bottom = _bottom;
			if _vibration < 0 {
				vibration = 0;
			} else if _vibration > 1 {
				vibration = 1;
			} else {
				vibration = _vibration;
			}
		}
	}
}