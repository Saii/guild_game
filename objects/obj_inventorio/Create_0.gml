/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

randomize();

inventory = new Inventory();
inventory_items = noone;
mostrar_descricao=noone;
inventory.item_add("Heroi",1,spr_heroi)
inventory.item_add("Heroi",2,spr_heroi)
inventory.item_add("Heroi",3,spr_heroi)
inventory.item_add("Vilao",10,spr_vilao)
show_debug_message(inventory)

inventory.item_subtract("Heroi",1);
inventory.item_subtract("Vilao",1);

show_debug_message(inventory)


// UI information

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

janela_inventario = function() {

var _check = position_meeting(mouse_x,mouse_y,obj_inventorio)


if (_check and mouse_check_button_released(mb_left) and global.inventario_ui=false){

global.inventario_ui=true


}

}

janela_inventorio_abrir = function(){
	
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
	
var inventory_numero = inventory.item_get();
var pos_x = 0;
var pos_y = 0;

if(mouse_check_button_released(mb_left) and global.inventario_ui==true) {		
	
	#region INVENTORY	
		for (var row = 0; row < inventory_rows; row++) {				
			pos_y = ui_padding_y + (ui_border_size * 13) + (row * (ui_inventory_margin + ui_inventory_box));
			for (var column = 0; column < inventory_columns; column++) {
				pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
				if(is_between(mx, pos_x, pos_x + ui_inventory_box)) {
					if(is_between(my, pos_y, pos_y + ui_inventory_box)) {
						var inventory_index = (row * inventory_columns) + column;
						// now we need to check if we have an inventory item here
						
						if(inventory_index <= array_length(inventory_numero) - 1) {
						show_message($" O nome do heroi eh: {inventory_numero[inventory_index].nome}");	
						mostrar_descricao = inventory_numero[inventory_index];
						show_debug_message(mostrar_descricao.nome)
						global.status_heroi = true;
							//inventory.item_subtract(inventory_items[inventory_index].nome, 1);
						} else {						
							show_debug_message("No inventory item here !");
						}
					}
				}
				
			}
		}
	#endregion
}

}

mostrar_status = function (){
	

}