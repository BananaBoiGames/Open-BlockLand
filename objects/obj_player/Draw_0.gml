if (shotgunAnim == 1)
{
    smallnumber = font_add_sprite_ext(spr_smallnumber, "1234567890", 1, 0)
    draw_set_font(smallnumber)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    draw_text(x, (y - 80), global.shotgunammo)
}
pal_swap_set(spr_palette, paletteselect, 0)
draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
shader_reset()
if flash
{
    shader_set(shd_hit)
    draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
    shader_reset()
}
