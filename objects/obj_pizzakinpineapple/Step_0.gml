if (room == rank_room || room == timesuproom)
    visible = false
if (obj_player.state == states.pizzathrow)
    visible = false
if (sprite_index == spr_toppinpineapple_intro && floor(image_index) == (image_number - 1))
    sprite_index = spr_pizzakinpineapple
if (global.pineapplefollow == 1 && sprite_index != spr_toppinpineapple_intro)
{
    image_alpha = obj_player.image_alpha
    if (obj_player.hsp != 0)
        sprite_index = spr_pizzakinpineapple_run
    else
        sprite_index = spr_pizzakinpineapple
    depth = -6
    if (global.sausagefollow == 1)
    {
        ds_queue_enqueue(followQueue, (obj_pizzakinsausage.x + image_xscale * 4))
        ds_queue_enqueue(followQueue, (obj_pizzakinsausage.y - 2))
    }
    else if (global.tomatofollow == 1)
    {
        ds_queue_enqueue(followQueue, (obj_pizzakintomato.x + image_xscale * 4))
        ds_queue_enqueue(followQueue, (obj_pizzakintomato.y - 2))
    }
    else if (global.cheesefollow == 1)
    {
        ds_queue_enqueue(followQueue, (obj_pizzakincheese.x + image_xscale * 4))
        ds_queue_enqueue(followQueue, (obj_pizzakincheese.y - 2))
    }
    else if (global.shroomfollow == 1)
    {
        ds_queue_enqueue(followQueue, (obj_pizzakinshroom.x + image_xscale * 4))
        ds_queue_enqueue(followQueue, (obj_pizzakinshroom.y - 2))
    }
    else
    {
        ds_queue_enqueue(followQueue, obj_player.x)
        ds_queue_enqueue(followQueue, obj_player.y)
    }
    LAG_STEPS = 10
    if (ds_queue_size(followQueue) > (LAG_STEPS * 2))
    {
        x = ds_queue_dequeue(followQueue) - image_xscale * 4
        y = ds_queue_dequeue(followQueue) + 2
    }
    image_xscale = obj_player.xscale
}
if (global.playerhealth == 1 && global.pineapplefollow == 1)
    sprite_index = spr_pizzakinpineapple_panic
