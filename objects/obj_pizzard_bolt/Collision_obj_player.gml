with (other.id)
{
    if (state != states.knightpep && hurted == 0)
    {
        hsp = 0
        movespeed = 0
        state = states.knightpep
        image_index = 0
        sprite_index = spr_knightpep_thunder
        instance_destroy(other.id)
    }
}
