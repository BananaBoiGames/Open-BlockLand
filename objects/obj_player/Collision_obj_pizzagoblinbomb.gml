if (hurted == 0 && cutscene == 0 && state != states.bombpep && (other.grounded == 0 || state == states.handstandjump))
{
    bombpeptimer = 100
    state = states.bombpep
    image_index = 0
    sprite_index = spr_bombpep_intro
    instance_destroy(other.id)
}
