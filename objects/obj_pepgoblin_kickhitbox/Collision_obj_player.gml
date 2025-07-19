with (other.id)
{
    if (instance_exists(other.baddieID) && state != states.tumble)
    {
        state = states.tumble
        xscale = other.baddieID.image_xscale
        movespeed = 14
        vsp = 0
    }
}
