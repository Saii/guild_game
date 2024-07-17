/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (slotDrag!= -1){
draw_set_alpha(0.5)
draw_sprite_stretched(heroi_sprite,-1,mouse_x,mouse_y,64,64);
draw_set_alpha(1)

}


var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

draw_text(mouse_x,mouse_y,_mx)
draw_text(mouse_x,mouse_y+30,_my)
