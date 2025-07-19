if (other.image_index == 0 && state == states.normal && grounded && character == "P")
{
    momentum = 0
    movespeed = 0
    other.image_index = 1
    image_index = 0
    sprite_index = spr_knightpep_start
    state = states.knightpep
    hsp = 0
}
