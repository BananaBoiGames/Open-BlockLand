function scr_player_crouch()
{
	move = key_left + key_right
	if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
	    hsp = move * movespeed
	else if place_meeting(x, (y + 1), obj_railh)
	    hsp = move * movespeed - 5
	else if place_meeting(x, (y + 1), obj_railh2)
	    hsp = move * movespeed + 5
	movespeed = 4
	mask_index = spr_crouchmask
	turning = 0
	if ((!grounded) && (!key_jump))
	{
	    jumpAnim = false
	    state = states.crouchjump
	    movespeed = 4
	    crouchAnim = true
	    image_index = 0
	}
	if (key_jump && grounded && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
	{
	    scr_soundeffect(sfx_jump)
	    vsp = -8
	    state = states.crouchjump
	    movespeed = 4
	    image_index = 0
	    crouchAnim = true
	    jumpAnim = true
	}
	if (key_slap2 && character == "N" && (!instance_exists(obj_bomb)))
	    instance_create(x, y, obj_bomb)
	if (grounded && (!key_down) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && (!key_jump))
	{
	    state = states.normal
	    movespeed = 0
	    crouchAnim = true
	    jumpAnim = true
	    image_index = 0
	    mask_index = spr_player_mask
	}
	if (crouchAnim == false)
	{
	    if (move == 0)
	    {
	        if (shotgunAnim == 0)
	            sprite_index = spr_crouch
	        else
	            sprite_index = spr_shotgun_duck
	    }
	    if (move != 0)
	        sprite_index = spr_crawl
	}
	if (crouchAnim == true)
	{
	    if (move == 0)
	    {
	        if (shotgunAnim == 0)
	            sprite_index = spr_couchstart
	        else
	            sprite_index = spr_shotgun_goduck
	        if (floor(image_index) == (image_number - 1))
	            crouchAnim = false
	    }
	}
	if (move != 0)
	{
	    xscale = move
	    crouchAnim = false
	}
	if scr_slope()
	{
	    movespeed = 14
	    with (instance_place((x + xscale), (y + 1), obj_slope))
	        other.xscale = (-sign(image_xscale))
	    state = states.tumble
	    sprite_index = spr_player_machroll
	}
	image_speed = 0.6
}
