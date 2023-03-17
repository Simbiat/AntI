///@description Delay initial spawn
//Generate UI for lives
obj_game.daves = 0;
repeat (3) {
    obj_game.addLife(false);
}
spawn(obj_dave);
spawn(obj_zombie);
//spawn(obj_hunch);