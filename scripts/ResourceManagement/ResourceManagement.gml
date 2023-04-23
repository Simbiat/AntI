function charSelect(charid)
{
	with (obj_selectable_char) {
		selected = false;
	}
	obj_res_manager.charid = charid;
	var charObj = asset_get_index("obj_character_"+string(charid));
	with (charObj) {
		selected = true;
	}
	var hey = noone;
	if obj_res_manager.charid == 0 {
		hey = choose(snd_female_hey_01, snd_female_hey_02, snd_female_hey_03);
	} else {
		hey = choose(snd_male_hey_01, snd_male_hey_02, snd_male_hey_03);
	}
	play_sound(hey);
}

//Play sound only if music is not being played
function play_sound(sound_asset, loop = false)
{
	if sound_asset == snd_rocket_engine {
		//Otherwise the engine overpowers everything
		return audio_play_sound(sound_asset, 1, loop,  obj_res_manager.gain*0.05);
	} else {
		return audio_play_sound(sound_asset, 1, loop,  obj_res_manager.gain);
	}
}

function effectsReset()
{
	obj_res_manager.audio_bitcrusher = audio_effect_create(AudioEffectType.Bitcrusher, {factor: 20, mix: 0.75, bypass: true});
	obj_res_manager.audio_lpf = audio_effect_create(AudioEffectType.LPF2, {cutoff: 500, q: 1.5, bypass: true});
	obj_res_manager.audio_delay = audio_effect_create(AudioEffectType.Delay, {mix: 0.75, bypass: true});
	obj_res_manager.audio_customBus.effects[0] = obj_res_manager.audio_bitcrusher;
	obj_res_manager.audio_customBus.effects[1] = obj_res_manager.audio_lpf;
	obj_res_manager.audio_customBus.effects[2] = obj_res_manager.audio_delay;
}

function musicDistort(damage = false)
{
	//Reset the values of the effects
	effectsReset();
	if audio_is_playing(obj_res_manager.music_file) {
		if damage {
			obj_res_manager.audio_customBus.effects[0].bypass = false;
			obj_res_manager.audio_customBus.effects[1].bypass = false;
		}
		obj_res_manager.audio_customBus.effects[2].bypass = false;
		obj_game.alarm[6] = 5*room_speed;
	}
}

function musicGradualRestore()
{
	if audio_is_playing(obj_res_manager.music_file) && obj_game.alarm[6] > -1 {
		//Reduce mixing of bitcrusher, if used
		if obj_res_manager.audio_customBus.effects[0].bypass == false {
			if obj_res_manager.audio_customBus.effects[0].mix > 0.0 {
				obj_res_manager.audio_customBus.effects[0].mix -= 0.0025;
			} else {
				obj_res_manager.audio_customBus.effects[0].bypass = true;
			}
		}
		//Reduce LFP, if used
		if obj_res_manager.audio_customBus.effects[1].bypass == false {
			if obj_res_manager.audio_customBus.effects[1].cutoff < 22000 {
				obj_res_manager.audio_customBus.effects[1].cutoff += 10;
			} else {
				obj_res_manager.audio_customBus.effects[1].bypass = true;
			}
		}
		//Reduce mixing of delay, if used
		if obj_res_manager.audio_customBus.effects[2].bypass == false {
			if obj_res_manager.audio_customBus.effects[2].mix > 0.0 {
				obj_res_manager.audio_customBus.effects[2].mix -= 0.0025;
			} else {
				obj_res_manager.audio_customBus.effects[2].bypass = true;
			}
		}
	}
}

function musicNormalize()
{
	obj_res_manager.audio_customBus.effects[0].bypass = true;
	obj_res_manager.audio_customBus.effects[1].bypass = true;
	obj_res_manager.audio_customBus.effects[2].bypass = true;
}

function gradeToColor(grade = "d")
{
	switch (string_lower(grade)) {
	    case "d":
	        return make_color_rgb(175, 123, 123);
	        break;
		case "c":
	        return make_color_rgb(56, 154, 110);
	        break;
		case "b":
	        return make_color_rgb(94, 147, 225);
	        break;
		case "a":
	        return make_color_rgb(127, 64, 191);
	        break;
		case "s":
	        return make_color_rgb(232, 141, 28);
	        break;
		case "ss":
	        return make_color_rgb(247, 220, 111);
	        break;
		case "sss":
	        return make_color_rgb(43, 200, 216);
	        break;
	    default:
	        return c_white;
	        break;
	}
}

function gradeToNumber(grade = "d") {
	switch (string_lower(grade)) {
	    case "d":
	        return 1;
	        break;
		case "c":
	        return 2;
	        break;
		case "b":
	        return 3;
	        break;
		case "a":
	        return 4;
	        break;
		case "s":
	        return 5;
	        break;
		case "ss":
	        return 6;
	        break;
		case "sss":
	        return 7;
	        break;
	    default:
	        return 0;
	        break;
	}
}

function totalScore()
{
	var fullScore = obj_game.points_enemies +
			(obj_game.enemies_killed * 2) +
			(obj_game.enemies_dodged * 1) +
			obj_game.points_prompts +
			(obj_game.prompts_correct * 5) +
			(obj_game.prompts_incorrect * -10) +
			(obj_game.prompts_missed * -1) +
			(obj_game.combo_highest * 10) +
			(-obj_game.hp_lost * 500) +
			obj_game.points_time;
	if fullScore < 0 {
		fullScore = 0;	
	}
	return fullScore;
}