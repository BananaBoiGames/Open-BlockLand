function scr_player_fireass()
{
	image_speed = 0.35
	if place_meeting((x + hsp), y, obj_solid)
	    image_xscale *= -1
	if (sprite_index == spr_player_fireass)
	{
	    move = key_left + key_right
	    if (move != 0)
	        xscale = move
	    hsp = move * movespeed
	    movespeed = 4
	    if place_meeting(x, (y + 1), obj_haystack)
	        vsp = -20
	    else if (grounded && vsp > 0)
	    {
	        movespeed = 6
	        sprite_index = spr_player_fireassground
	        image_index = 0
	    }
	}
	if (sprite_index == spr_player_fireassground)
	{
	    hsp = xscale * movespeed
	    if (movespeed > 0)
	        movespeed -= 0.25
	    if (floor(image_index) == (image_number - 1) || place_meeting((x + xscale), y, obj_solid))
	    {
	        sprite_index = spr_player_fireassend
	        hsp = 0
	        image_index = 0
	    }
	}
	if (sprite_index == spr_player_fireassend)
	{
	    if (floor(image_index) == (image_number - 1))
	    {
	        movespeed = 0
	        landAnim = false
	        alarm[5] = 2
	        alarm[7] = 60
	        hurted = 1
	        state = states.normal
	        sprite_index = spr_player_idle
	        image_index = 0
	    }
	}
}
