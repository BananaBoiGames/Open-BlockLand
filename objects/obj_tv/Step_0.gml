if (room == rank_room || room == timesuproom || room == boss_room1)
    alpha = 0
if (room == entrance_1)
{
    global.srank = 5750
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
}
if (room == floor1_room0)
{
    global.srank = 14000
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
}
if (room == floor2_room0)
{
    global.srank = 3000
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
}
if (room == floor3_room0)
{
    global.srank = 2300
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
}
if (room == floor4_room0)
{
    global.srank = 1480
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
}
if (room == floor5_room1)
{
    global.srank = 2430
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
}
if (room == golf_room1)
{
    global.srank = 3900
    global.arank = global.srank - global.srank / 4
    global.brank = global.srank - global.srank / 4 * 2
    global.crank = global.srank - global.srank / 4 * 3
}
if (showtext == 1)
{
    xi = 500 + (random_range(1, -1))
    if (yi > 500)
        yi -= 5
}
if (showtext == 0)
{
    xi = 500 + (random_range(1, -1))
    if (yi < 600)
        yi += 1
}
if (!((obj_player.state == states.knightpep && obj_player.state == states.knightpepattack && obj_player.state == states.knightpepslopes)))
    once = 0
if (obj_player.y < 200 && obj_player.x > (room_width - 200))
    alpha = 0.5
else
    alpha = 1
if (global.collect > global.arank && shownranka == 0)
{
    image_speed = 0
    message = "YOU GOT ENOUGH FOR RANK A"
    showtext = 1
    alarm[0] = 200
    tvsprite = spr_tvranka
    shownranka = 1
}
else if (global.collect > global.brank && shownrankb == 0)
{
    image_speed = 0
    message = "YOU GOT ENOUGH FOR RANK B"
    showtext = 1
    alarm[0] = 200
    tvsprite = spr_tvrankb
    shownrankb = 1
}
else if (global.collect > global.crank && shownrankc == 0)
{
    image_speed = 0
    message = "YOU GOT ENOUGH FOR RANK C"
    showtext = 1
    alarm[0] = 200
    tvsprite = spr_tvrankc
    shownrankc = 1
}
else if (obj_player.sprite_index == spr_player_levelcomplete)
{
    image_speed = 0.1
    alarm[0] = 50
    chose = 1
    tvsprite = spr_tvclap
    once = 1
}
else if (obj_player.state == states.hurt)
{
    image_speed = 0.1
    showtext = 1
    if (chose == 0)
        message = choose("OW!", "OUCH!", "OH!", "WOH!")
    alarm[0] = 50
    chose = 1
    tvsprite = spr_tvhurt
    once = 1
}
else if (obj_player.state == states.timesup)
{
    alarm[0] = 50
    image_speed = 0.1
    tvsprite = spr_tvskull
}
else if (global.hurtcounter >= global.hurtmilestone)
{
    alarm[0] = 150
    image_speed = 0.1
    if (obj_player.character == "P")
        character = "PEPPINO"
    else
        character = "THE NOISE"
    message = "YOU HAVE HURT " + string(character) + " " + string(global.hurtmilestone) + " TIMES..."
    if (tvsprite != spr_tvtalking1 && tvsprite != spr_tvtalking2 && tvsprite != spr_tvtalking3 && tvsprite != spr_tvtalking4)
        tvsprite = choose(spr_tvtalking1, spr_tvtalking2, spr_tvtalking3, spr_tvtalking4)
    global.hurtmilestone += 3
}
else if (obj_player.state == states.skateboard)
{
    showtext = 1
    message = "SWEET DUDE!!"
    alarm[0] = 50
    tvsprite = spr_tvrad
    once = 1
}
else if (obj_player.state == states.slipnslide)
{
    image_speed = 0.1
    showtext = 1
    message = "OOPS!!"
    alarm[0] = 50
    tvsprite = spr_tvbanana
    once = 1
}
else if (global.combo != 0 && global.combotime != 0 && (tvsprite == spr_tvdefault || tvsprite == spr_tvcombo || tvsprite == spr_tvescape))
{
    tvsprite = spr_tvcombo
    image_speed = 0
    if (global.combo >= 4)
        imageindexstore = 3
    else
        imageindexstore = global.combo - 1
}
else if (global.combotime == 0 && tvsprite == spr_tvcombo)
{
    tvsprite = spr_tvcomboresult
    image_index = imageindexstore
    alarm[0] = 50
}
else if (room == Realtitlescreen)
{
    image_speed = 0.1
    tvsprite = spr_tvbanana
    alarm[0] = 2
    if (obj_mainmenuselect.optionselected == 0)
    {
        showtext = 1
        message = "FILE 1"
    }
    if (obj_mainmenuselect.optionselected == 1)
    {
        showtext = 1
        message = "FILE 2"
    }
    if (obj_mainmenuselect.optionselected == 2)
    {
        showtext = 1
        message = "FILE 3"
    }
    if (obj_mainmenuselect.optionselected == 3)
    {
        showtext = 1
        message = "OPTION"
    }
}
if (obj_player.state == states.keyget)
{
    showtext = 1
    message = "GOT THE KEY!"
    alarm[0] = 50
}
if instance_exists(obj_noise_pushbutton)
{
    if (obj_noise_pushbutton.hsp != 0 && global.panic == 0)
    {
        showtext = 1
        message = "UH OH..."
        alarm[0] = 50
    }
}
