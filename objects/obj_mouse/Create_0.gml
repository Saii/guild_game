/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;



display_set_gui_size(1280, 720);

inventory_columns = 9;
inventory_rows = 5;

ui_padding_x = 64;
ui_padding_y = 64;
ui_panel_left = 320;
ui_border_size = 8;
ui_inventory_padding = 48;
ui_inventory_box = 64;
ui_inventory_margin = 16;
ui_top =1028

color_background = #55507a;
color_border = #36234a;
color_inventory_text = c_white;
color_inventory_highlight = c_white;

mouseOver = function () {

//Zerando funcionalidades
inventoryHover = -1;
slotHover = -1;

//Mouse Coordenadas

var _mx = mouse_x;
var _my = mouse_y;

with (obj_herois){

for (var row = 0; row < inventory_rows; row++) {
		var pos_y = ui_padding_y + (ui_border_size * 8) +	(row * (ui_inventory_margin + ui_inventory_box));
    for (var column = 0; column < inventory_columns; column++) {
		var pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
		
			
	if(point_in_rectangle
	(
	_mx,
	_my,
	pos_x,
	pos_y,
	pos_x+ui_inventory_box,
	pos_y+ui_inventory_box
	
	) and global.heroi_ui==true){
	heroi_numero= obj_herois.heroi.heroi_get();
	var heroi_index = (row * inventory_columns) + column;
		if(heroi_index <= array_length(heroi_numero) - 1) {
			// draw inventory sprite
			other.slotHover=heroi_index;
			other.inventoryHover= heroi_numero[heroi_index].nome
			
		}
	}

}


}}}
	
stateFree = function(){
	
	mouseOver();
	heroi_numero= obj_herois.heroi.heroi_get();
if(mouse_check_button(mb_left) and (slotHover != -1) and heroi_numero[slotHover]!= -1 ){

state = stateDrag;
itemDrag = heroi_numero[slotHover];
inventoryDrag = inventoryHover;
slotDrag = slotHover;
show_debug_message("O item drag eh " + string (itemDrag))
show_debug_message("O Inventory Drag eh " + string (inventoryDrag))
show_debug_message("O Slot Drag " + string (slotDrag))
show_debug_message("O Slot Hover " + string (slotHover))

}

}

stateDrag = function (){

mouseOver();
heroi_numero= obj_herois.heroi.heroi_get();
if (!mouse_check_button(mb_left)){

	if(slotHover != -1){
	
	obj_herois.heroi.heroi_swap(slotDrag,slotHover);
	
	state =stateFree;
	itemDrag = -1;
	inventoryDrag=-1;
	slotDrag=-1;
	}
}

}

state = stateFree;