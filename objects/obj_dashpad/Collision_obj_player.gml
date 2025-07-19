with (obj_player)
{
    if (grounded && (state == states.mach1 || state == states.mach2))
    {
        xscale = other.image_xscale
        mach2 = 100
        machhitAnim = false
        state = states.mach3
        flash = 1
        sprite_index = spr_player_mach4
        instance_create(x, y, obj_jumpdust)
        movespeed = 14
    }
    if (grounded && state == states.mach3)
    {
        flash = 1
        if (movespeed < 14)
            movespeed = 14
        instance_create(x, y, obj_jumpdust)
    }
}
