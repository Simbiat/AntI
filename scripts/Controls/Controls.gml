/// @description Functions related to player control
//Function to process button presses
function processActions()
{
	if tryingToJump() {
		daveShoot();
		daveJump();
		return;
	}
}