function scr_player_jump()
{
	if (momemtum == 0)
	    hsp = move * movespeed
	else
	    hsp = xscale * movespeed
	if (dir != xscale)
	{
	    dir = xscale
	    movespeed = 2
	    facehurt = 0
	}
	if (move != xscale)
	    movespeed = 2
	move = key_left + key_right
	if (movespeed == 0)
	    momemtum = 0
	if scr_solid((x + hsp), y)
	{
	    movespeed = 0
	    mach2 = 0
	}
	if (move != 0 && movespeed < 6)
	    movespeed += 0.5
	if (movespeed > 6)
	    movespeed -= 0.1
	if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
	    movespeed = 0
	if (dir != xscale)
	    dir = xscale
	landAnim = true
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == false)
	{
	    vsp /= 10
	    jumpstop = 1
	}
	if (ladderbuffer > 0)
	    ladderbuffer--
	if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == true)
	{
	    vsp = grav
	    jumpstop = 1
	}
	if (grounded && input_buffer_jump < 8 && (!key_down) && (!key_attack) && vsp > 0 && (!((sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall))))
	{
	    scr_soundeffect(sfx_jump)
	    sprite_index = spr_jump
	    if (shotgunAnim == 1)
	        sprite_index = spr_shotgun_jump
	    instance_create(x, y, obj_highjumpcloud2)
	    stompAnim = false
	    vsp = -11
	    state = states.jump
	    jumpAnim = true
	    jumpstop = 0
	    image_index = 0
	    movespeed = 2
	    freefallstart = 0
	}
	if (grounded && vsp > 0 && (!key_attack))
	{
	    scr_soundeffect(sfx_step)
	    if key_attack
	        landAnim = false
	    input_buffer_secondjump = 0
	    state = states.normal
	    jumpAnim = true
	    jumpstop = 0
	    image_index = 0
	    freefallstart = 0
	    movespeed = 2
	}
	if (grounded && (sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall))
	{
	    with (obj_baddie)
	    {
	        if point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), ((__view_get(0, 0)) + (__view_get(2, 0))), ((__view_get(1, 0)) + (__view_get(3, 0))))
	        {
	            vsp = -7
	            hsp = 0
	        }
	    }
	    with (obj_camera)
	    {
	        shake_mag = 10
	        shake_mag_acc = 30 / room_speed
	    }
	    image_index = 0
	    state = states.freefallland
	}
	if (key_down && character == "P")
	{
	    image_index = 0
	    state = states.freefallprep
	    vsp = -5
	}
	if key_jump
	    input_buffer_jump = 0
	if (character == "P")
	{
	    if (vsp > 5)
	        fallinganimation++
	    if (fallinganimation >= 40 && fallinganimation < 80)
	        sprite_index = spr_player_facestomp
	    if (fallinganimation >= 80)
	        sprite_index = spr_player_freefall
	}
	if (stompAnim == false)
	{
	    if (jumpAnim == true)
	    {
	        if (floor(image_index) == (image_number - 1))
	            jumpAnim = false
	    }
	    if (jumpAnim == false)
	    {
	        if (sprite_index == spr_airdash1)
	            sprite_index = spr_airdash2
	        if (sprite_index == spr_shotgun_jump)
	            sprite_index = spr_shotgun_fall
	        if (sprite_index == spr_jump)
	            sprite_index = spr_fall
	        if (sprite_index == spr_player_Sjumpstart)
	            sprite_index = spr_player_Sjump
	        if (sprite_index == spr_player_shotgunjump1)
	            sprite_index = spr_player_shotgunjump2
	        if (sprite_index == spr_shotgun_shootair)
	            sprite_index = spr_shotgun_fall
	    }
	}
	if (stompAnim == true)
	{
	    if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
	        sprite_index = spr_stomp
	}
	if (move != 0)
	    xscale = move
	image_speed = 0.35
	if (character == "N" && key_jump && sprite_index != spr_playerN_glide)
	{
	    jumpstop = 0
	    sprite_index = spr_playerN_glide
	    vsp = -11
	}
	if (key_slap2 && character == "N" && (!instance_exists(obj_bomb)))
	{
	    with (instance_create(x, y, obj_bomb))
	    {
	        vsp = -5
	        hsp = other.xscale * 5
	    }
	}
	if (key_taunt2 && character == "P" && global.shotgunammo > 0)
	{
	    shotgunAnim = 1
	    state = states.shotgun
	    image_index = 0
	    sprite_index = spr_player_shotgun
	    instance_create(x, y, obj_shotgunbullet)
	    global.shotgunammo -= 1
	}
	if ((!key_attack) || move != xscale)
	    mach2 = 0
	if (key_attack && grounded && fallinganimation < 40)
	{
	    movespeed = 6
	    sprite_index = spr_mach1
	    jumpAnim = true
	    state = states.mach1
	    image_index = 0
	}
}
