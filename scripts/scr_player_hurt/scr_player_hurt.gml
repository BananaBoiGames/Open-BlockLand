function scr_player_hurt()
{
	if (sprite_index == spr_hurtjump)
	    hsp = xscale * movespeed
	if (sprite_index == spr_hurt)
	    hsp = (-xscale) * movespeed
	if (movespeed > 0)
	    movespeed -= 0.1
	freefallsmash = 0
	combo = 0
	mach2 = 0
	bounce = 0
	jumpAnim = true
	dashAnim = true
	if grounded
	    landAnim = false
	else
	    landAnim = true
	jumpstop = 0
	moveAnim = true
	stopAnim = true
	crouchslideAnim = true
	crouchAnim = false
	machhitAnim = false
	hurted = 1
	turning = 0
	if instance_exists(obj_hook)
	    obj_hook.hooked = 0
	alarm[5] = 2
	alarm[7] = 60
	if grounded
	    vsp = -4
	if scr_solid((x + hsp), y)
	    xscale *= -1
	image_speed = 0.35
}
