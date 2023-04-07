//Black-in transition
layer_sequence_create("BlackInOut", room_width/2, room_height/2, seq_black_in);
layer_sequence_create("BlackInOut", room_width/2, room_height/2, asset_get_index("seq_char_enter_"+string(obj_res_manager.charid)));
alarm[0] = 120;