if (hurted == 0 && cutscene == 0 && state != states.Sjump && state != states.Sjumpprep && character == "P")
{
    if (state == states.knightpep || state == states.knightpepattack)
    {
        scr_soundeffect(sfx_loseknight)
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
    }
    hurted = 1
    vsp = -4
    image_index = 0
    sprite_index = spr_bombpep_end
    state = states.bombpep
    bombpeptimer = 0
}
if (character == "N")
{
    sprite_index = spr_player_superjump
    state = states.Sjump
    vsp = -15
}
