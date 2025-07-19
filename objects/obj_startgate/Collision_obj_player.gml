with (obj_player1)
{
    if (key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != states.victory && state != states.comingoutdoor)
    {
        backtohubstartx = x
        backtohubstarty = y
        backtohubroom = room
        mach2 = 0
        obj_camera.chargecamera = 0
        image_index = 0
        state = states.victory
    }
}
if (floor(obj_player1.image_index) == (obj_player1.image_number - 1) && obj_player1.state == states.victory)
{
    with (obj_player1)
    {
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        if (!instance_exists(obj_fadeout))
            instance_create(x, y, obj_fadeout)
    }
}
