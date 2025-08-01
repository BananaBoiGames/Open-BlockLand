function scr_player_knightpepslopes()
{
	alarm[5] = 2
	alarm[7] = 60
	hurted = 1
	hsp = xscale * movespeed
	if (sprite_index == spr_knightpep_downslope)
	    movespeed += 0.5
	if (!scr_slope())
	    sprite_index = spr_knightpep_charge
	if scr_slope()
	    sprite_index = spr_knightpep_downslope
	if (sprite_index == spr_knightpep_charge)
	    movespeed -= 0.1
	if scr_solid((x + sign(hsp)), y)
	{
	    with (instance_create(x, y, obj_knightdebris))
	        image_index = 0
	    with (instance_create(x, y, obj_knightdebris))
	        image_index = 1
	    with (instance_create(x, y, obj_knightdebris))
	        image_index = 2
	    with (instance_create(x, y, obj_knightdebris))
	        image_index = 3
	    with (instance_create(x, y, obj_knightdebris))
	        image_index = 4
	    with (instance_create(x, y, obj_knightdebris))
	        image_index = 5
	    if (x != other.x)
	        obj_player.hsp = (sign(x - other.x)) * 5
	    else
	        obj_player.hsp = 5
	    vsp = -3
	    scr_soundeffect(sfx_bumpwall)
	    scr_soundeffect(sfx_loseknight)
	    image_index = 0
	    obj_player.image_index = 0
	    obj_player.flash = 1
	    state = states.bump
	}
	if (movespeed <= 0 && sprite_index == spr_knightpep_charge)
	{
	    sprite_index = spr_knightpep_idle
	    state = states.knightpep
	}
	image_speed = 0.4
}
