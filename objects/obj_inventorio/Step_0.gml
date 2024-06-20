/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

janela_inventario();
janela_inventorio_abrir();
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
	
var inventory_numero = inventory.item_get();
var pos_x = 0;
var pos_y = 0;
	



if(mouse_check_button_released(mb_left) and global.inventario_fechado==true) {
		if(is_between(mx,1200,1240)){
			if(is_between(my,40,90)){
			
		global.inventario=false;
		global.inventario_fechado=false;
		global.status_heroi = false;
		global.inventario_ui=false;
			}	
		}

}