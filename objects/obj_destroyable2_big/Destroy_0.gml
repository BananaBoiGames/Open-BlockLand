if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigpizzadebris
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigpizzadebris
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigpizzadebris
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigpizzadebris
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigpizzadebris
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigpizzadebris
    with (instance_create((x + 32), (y + 32), obj_debris))
        sprite_index = spr_bigpizzadebris
    with (instance_create((x + 32), (y + 32), obj_pizzaslice))
        hsp = 2
    with (instance_create((x + 32), (y + 32), obj_pizzaslice))
        hsp = -2
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
    ds_list_add(global.saveroom, id)
}
