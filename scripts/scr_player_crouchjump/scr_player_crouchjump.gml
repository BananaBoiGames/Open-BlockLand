function scr_player_crouchjump()
{
	move = key_left + key_right
	fallinganimation++
	if (fallinganimation >= 40 && fallinganimation < 80)
	{
	    sprite_index = spr_player_facestomp
	    state = states.jump
	}
	mask_index = spr_crouchmask
	hsp = move * movespeed
	movespeed = 4
	if ((!key_jump2) && jumpstop == 0 && jumpAnim == true)
	{
	    vsp /= 2
	    jumpstop = 1
	}
	if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == true)
	{
	    vsp = grav
	    jumpstop = 1
	}
	if (grounded && key_down)
	{
	    state = states.crouch
	    jumpAnim = true
	    crouchAnim = true
	    image_index = 0
	    jumpstop = 0
	    scr_soundeffect(sfx_step)
	}
	if (grounded && (!key_down) && (!(scr_solid(x, (y - 16)))))
	{
	    movespeed = 0
	    state = states.normal
	    jumpAnim = true
	    landAnim = true
	    crouchAnim = true
	    image_index = 0
	    jumpstop = 0
	    mask_index = spr_player_mask
	    scr_soundeffect(sfx_step)
	}
	if grounded
	{
	    state = states.crouch
	    jumpAnim = true
	    crouchAnim = true
	    image_index = 0
	    jumpstop = 0
	    scr_soundeffect(sfx_step)
	}
	if (jumpAnim == true)
	{
	    sprite_index = spr_crouchjump
	    if (floor(image_index) == (image_number - 1))
	        jumpAnim = false
	}
	if (jumpAnim == false)
	    sprite_index = spr_crouchfall
	if (move != 0)
	    xscale = move
	image_speed = 0.35
}
