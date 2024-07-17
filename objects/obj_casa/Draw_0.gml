/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

if (desenhar){

draw_sprite_stretched(spr_Inventory_Box,image_index,x-100,y-250,200,200)

draw_sprite_stretched(spr_Inventory_Box_minus,image_index,x-90,y-200,40,40)
draw_sprite_stretched(spr_Inventory_Box_plus,image_index,x+30,y-200,40,40)

draw_text(x-50,y-230,"Moradores")
draw_set_font(fn_Ubuntu)
draw_text_transformed(x-30,y-210,num_moradores,2,2,0);
draw_set_font(-1)
draw_text(x,y,level)


}