function scr_player_mach1()
{
	dir = xscale
	move = key_left + key_right
	landAnim = false
	if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + 1), y, obj_slope))))
	{
	    mach2 = 0
	    state = states.normal
	    movespeed = 0
	}
	if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x - 1), y, obj_slope))))
	{
	    mach2 = 0
	    state = states.normal
	    movespeed = 0
	}
	machhitAnim = false
	crouchslideAnim = true
	if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
	    hsp = xscale * movespeed
	else if place_meeting(x, (y + 1), obj_railh)
	    hsp = xscale * movespeed - 5
	else if place_meeting(x, (y + 1), obj_railh2)
	    hsp = xscale * movespeed + 5
	if (xscale == 1 && move == -1)
	{
	    sprite_index = spr_mach1
	    momemtum = 0
	    mach2 = 0
	    movespeed = 6
	    image_index = 0
	    xscale = -1
	}
	if (xscale == -1 && move == 1)
	{
	    sprite_index = spr_mach1
	    momemtum = 0
	    mach2 = 0
	    movespeed = 6
	    image_index = 0
	    xscale = 1
	}
	if grounded
	{
	    if (movespeed <= 8)
	        movespeed += 0.075
	    if (movespeed >= 8)
	    {
	        state = states.mach2
	        with (instance_create(x, y, obj_jumpdust))
	            image_xscale = other.xscale
	    }
	}
	if (!grounded)
	    sprite_index = spr_airdash2
	if (!key_attack)
	{
	    state = states.normal
	    image_index = 0
	}
	if (key_down && grounded)
	{
	    sprite_index = spr_crouchslip
	    state = states.crouchslide
	    mach2 = 0
	}
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
	{
	    vsp /= 10
	    jumpstop = 1
	}
	if (grounded && vsp > 0)
	    jumpstop = 0
	if (place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
	    movespeed = 0
	    state = states.normal
	}
	image_speed = 0.5
	if (key_jump && grounded && key_attack)
	{
	    sprite_index = spr_airdash2
	    dir = xscale
	    momemtum = 1
	    vsp = -11
	    jumpAnim = true
	    image_index = 0
	}
	if ((!instance_exists(obj_dashcloud)) && grounded)
	{
	    with (instance_create(x, y, obj_dashcloud))
	        image_xscale = other.xscale
	}
	if (key_slap2 && key_down)
	{
	    image_index = 0
	    state = states.freefallprep
	    vsp = -4
	}
	if (grounded && sprite_index != spr_mach1)
	{
	    sprite_index = spr_mach1
	    image_index = 0
	}
}
