function scr_player_freefallland()
{
	mach2 = 0
	jumpAnim = true
	dashAnim = true
	landAnim = false
	moveAnim = true
	stopAnim = true
	crouchslideAnim = true
	crouchAnim = false
	machhitAnim = false
	movespeed = 0
	facehurt = 1
	start_running = 1
	alarm[4] = 14
	vsp = 0
	hsp = 0
	sprite_index = spr_player_bodyslamland
	if (floor(image_index) == (image_number - 1) && (!(superslam > 30)))
	    state = states.normal
	if (floor(image_index) == (image_number - 1) && superslam > 30)
	{
	    state = states.machfreefall
	    vsp = -7
	}
	image_speed = 0.35
}
