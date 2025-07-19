function scr_player_door()
{
	hsp = 0
	mach2 = 0
	jumpAnim = true
	dashAnim = true
	landAnim = false
	moveAnim = true
	stopAnim = true
	crouchslideAnim = true
	crouchAnim = true
	machhitAnim = false
	if (floor(image_index) == (image_number - 1))
	    image_speed = 0
	if (floor(image_index) == (image_number - 1) && (!instance_exists(obj_fadeout)) && (sprite_index == spr_player_downpizzabox || sprite_index == spr_player_uppizzabox))
	    instance_create(x, y, obj_fadeout)
}
