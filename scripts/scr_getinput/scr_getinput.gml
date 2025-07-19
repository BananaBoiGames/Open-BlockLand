function scr_getinput()
{
	key_up = (keyboard_check(global.key_up) || gamepad_button_check(0, global.key_upC))
	key_up2 = (keyboard_check_pressed(global.key_up) || gamepad_button_check_pressed(0, global.key_upC))
	key_right = (keyboard_check(global.key_right) || gamepad_button_check(0, global.key_rightC))
	key_right2 = (keyboard_check_pressed(global.key_right) || gamepad_button_check_pressed(0, global.key_rightC))
	key_left = (-((keyboard_check(global.key_left) || gamepad_button_check(0, global.key_leftC))))
	key_left2 = (-((keyboard_check_pressed(global.key_left) || gamepad_button_check_pressed(0, global.key_leftC))))
	key_down = (keyboard_check(global.key_down) || gamepad_button_check(0, global.key_downC))
	key_down2 = (keyboard_check_pressed(global.key_down) || gamepad_button_check_pressed(0, global.key_downC))
	key_jump = (keyboard_check_pressed(global.key_jump) || gamepad_button_check_pressed(0, global.key_jumpC))
	key_jump2 = (keyboard_check(global.key_jump) || gamepad_button_check(0, global.key_jumpC))
	key_slap = (keyboard_check(global.key_slap) || gamepad_button_check(0, global.key_slapC))
	key_slap2 = (keyboard_check_pressed(global.key_slap) || gamepad_button_check_pressed(0, global.key_slapC))
	key_taunt = (keyboard_check(global.key_taunt) || gamepad_button_check(0, global.key_tauntC))
	key_taunt2 = (keyboard_check_pressed(global.key_taunt) || gamepad_button_check_pressed(0, global.key_tauntC))
	key_attack = (keyboard_check(global.key_attack) || gamepad_button_check(0, global.key_attackC) || gamepad_button_check(0, gp_face2) || gamepad_button_check(0, gp_shoulderrb))
	key_attack2 = (keyboard_check_pressed(global.key_attack) || gamepad_button_check_pressed(0, global.key_attackC) || gamepad_button_check_pressed(0, gp_face2) || gamepad_button_check_pressed(0, gp_shoulderrb))
	key_shoot = (keyboard_check(global.key_shoot) || gamepad_button_check(0, global.key_shootC))
	key_shoot2 = (keyboard_check_pressed(global.key_shoot) || gamepad_button_check_pressed(0, global.key_shootC))
	key_start = (keyboard_check_pressed(global.key_start) || gamepad_button_check_pressed(0, global.key_startC))
	key_escape = (keyboard_check_pressed(vk_escape) || gamepad_button_check(0, gp_select))
	gamepad_set_axis_deadzone(0, 0.5)
	if keyboard_check_pressed(vk_f1)
	{
	    global.panic = 1
	    with (obj_tv)
	    {
	        message = "ESCAPE ACTIVATED"
	        showtext = 1
	        alarm[0] = 150
	    }
	}
	if keyboard_check_pressed(vk_f2)
	{
	    with (obj_tv)
	    {
	        message = "CONTROLS RESET"
	        showtext = 1
	        alarm[0] = 150
	    }
	    scr_initinput()
	}
	if keyboard_check_pressed(vk_f3)
	{
	    obj_player1.state = states.timesup
	    audio_stop_all()
	    scr_soundeffect(mu_timesup)
	    room = timesuproom
	    obj_player1.image_index = 0
	}
	if keyboard_check_pressed(vk_f4)
	{
	    with (obj_tv)
	    {
	        message = "PLUS 100 POINTS"
	        showtext = 1
	        alarm[0] = 150
	    }
	    global.collect += 100
	}
	if keyboard_check_pressed(vk_f5)
	{
	    with (obj_tv)
	    {
	        message = "MINUS 100 POINTS"
	        showtext = 1
	        alarm[0] = 150
	    }
	    if (global.collect >= 100)
	        global.collect -= 100
	    else
	        global.collect = 0
	}
	if keyboard_check_pressed(vk_f6)
	{
	    with (obj_tv)
	    {
	        message = "GOT KEY"
	        showtext = 1
	        alarm[0] = 150
	    }
	    global.key_inv = 1
	}
	if keyboard_check_pressed(vk_f7)
	{
	    with (obj_tv)
	    {
	        message = "SHOTGUN POWERUP"
	        showtext = 1
	        alarm[0] = 150
	    }
	    global.shotgunammo += 5
	    global.gotshotgun = 1
	    obj_player1.shotgunAnim = 1
	}
}
