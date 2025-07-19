if (!(place_meeting(x, y, obj_destructibles)))
    depth = -8
with (obj_player)
{
    if (other.image_yscale == 1)
    {
        if (key_down && (!(place_meeting(x, (y + 1), obj_destructibles))) && place_meeting(x, (y + 1), other.id) && (state == states.crouch || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.Sjumpprep) && (!instance_exists(obj_fadeout)) && state != states.door && state != states.comingoutdoor)
        {
            mach2 = 0
            obj_camera.chargecamera = 0
            x = other.x
            obj_player1.targetDoor = other.targetDoor
            obj_player1.targetRoom = other.targetRoom
            if instance_exists(obj_player2)
            {
                obj_player2.targetDoor = other.targetDoor
                obj_player2.targetRoom = other.targetRoom
            }
            sprite_index = spr_player_downpizzabox
            image_index = 0
            state = states.door
        }
    }
    if (other.image_yscale == -1)
    {
        if (((key_up && (!(place_meeting(x, (y - 1), obj_destructibles))) && place_meeting(x, (y - 1), other.id) && (state == states.normal || state == states.jump || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.Sjumpprep)) || (state == states.Sjump && (!(place_meeting(x, (y - 1), obj_destructibles))) && place_meeting(x, (y - 1), other.id))) && (!instance_exists(obj_fadeout)) && state != states.door && state != states.comingoutdoor)
        {
            other.depth = -8
            mach2 = 0
            obj_camera.chargecamera = 0
            x = other.x
            obj_player1.targetDoor = other.targetDoor
            obj_player1.targetRoom = other.targetRoom
            if instance_exists(obj_player2)
            {
                obj_player2.targetDoor = other.targetDoor
                obj_player2.targetRoom = other.targetRoom
            }
            sprite_index = spr_player_uppizzabox
            image_index = 0
            state = states.door
        }
    }
}
if (place_meeting(x, (y + 1), obj_doorA) || place_meeting(x, (y - 1), obj_doorA))
    targetDoor = "A"
if (place_meeting(x, (y + 1), obj_doorB) || place_meeting(x, (y - 1), obj_doorB))
    targetDoor = "B"
if (place_meeting(x, (y + 1), obj_doorC) || place_meeting(x, (y - 1), obj_doorC))
    targetDoor = "C"
if (place_meeting(x, (y + 1), obj_doorD) || place_meeting(x, (y - 1), obj_doorD))
    targetDoor = "D"
