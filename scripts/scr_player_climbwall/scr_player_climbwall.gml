function scr_player_climbwall()
{
	if (windingAnim < 200)
	    windingAnim++
	move = key_left + key_right
	suplexmove = 0
	vsp = (-wallspeed)
	if (wallspeed < 24 && move == xscale)
	    wallspeed += 0.05
	crouchslideAnim = true
	sprite_index = spr_player_machclimbwall
	if ((!key_attack) || (move != xscale && move != 0))
	{
	    state = states.normal
	    movespeed = 0
	}
	if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
	{
	    sprite_index = spr_player_superjumpland
	    scr_soundeffect(sfx_groundpound)
	    image_index = 0
	    state = states.Sjumpland
	    machhitAnim = false
	}
	if (!(scr_solid((x + xscale), y)))
	{
	    instance_create(x, y, obj_jumpdust)
	    vsp = 0
	    if (movespeed >= 8)
	        state = states.mach2
	    if (movespeed >= 12)
	    {
	        state = states.mach3
	        sprite_index = spr_player_mach4
	    }
	}
	if key_jump
	{
	    movespeed = 8
	    state = states.mach2
	    sprite_index = spr_player_secondjump1
	    image_index = 0
	    vsp = -11
	    xscale *= -1
	}
	if ((grounded && wallspeed <= 0) || wallspeed <= 0)
	{
	    state = states.jump
	    sprite_index = spr_fall
	}
	image_speed = 0.6
	if (!instance_exists(obj_cloudeffect))
	    instance_create(x, (y + 43), obj_cloudeffect)
}
