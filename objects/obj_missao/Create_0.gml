/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor





missao= new Missao();
missao_comprada = new Missao();
missao_numero = noone;
mostrar_descricao=noone;
missao.missao_set("Missao F","Colher flor",3,20,10,false);
missao.missao_set("Missao E","Matar Orc",2,30,20,false);
missao.missao_set("Missao D","Matar Ogro",2,100,30,false);
missao.missao_set("Missao C","Lidar com gangue de mercenarios",2,100,40,false);
missao.missao_set("Missao B","Matar Dragão",2,100,50,false);
missao.missao_set("Missao A","Liderar um exercito",2,100,60,false);
show_debug_message(missao.missao_get())
display_set_gui_size(1280, 720);

inventory_columns = 3;
inventory_rows = 2;

ui_padding_x = 64;
ui_padding_y = 64;
ui_panel_left = 320;
ui_border_size = 8;
ui_inventory_padding = 48;
ui_inventory_box = 194;
ui_inventory_margin = 16;
ui_top =1028

color_background = #55507a;
color_border = #36234a;
color_inventory_text = c_white;
color_inventory_highlight = c_white;

 janela_missao = function() {

var _check = position_meeting(mouse_x,mouse_y,obj_missao)

if (_check and mouse_check_button_released(mb_left) and global.missao_ui=false){

global.missao_ui=true


}

}

comprar_missao = function (_nome,_missao_comprada_array){


missao.missao_comprar(_nome,_missao_comprada_array);
show_message(missao_comprada)
}

janela_missao_selecionar = function () {

if(mouse_check_button(mb_left) and global.missao_ui==true) {		
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	var missao_numero = missao.missao_get();
	var pos_x = 0;
	var pos_y = 0;
	
	#region INVENTORY	
		
		for (var row = 0; row < inventory_rows; row++) {				
			pos_y = ui_padding_y + (ui_border_size * 13) + (row * (ui_inventory_margin + ui_inventory_box));
			for (var column = 0; column < inventory_columns; column++) {
				pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
				
				if(is_between(mx, pos_x, pos_x + ui_inventory_box)) {
					if(is_between(my, pos_y, pos_y + ui_inventory_box)) {
						var missao_index = (row * inventory_columns) + column;
						// now we need to check if we have an inventory item here
						
						if(missao_index <= array_length(missao_numero) - 1) {
							
							mostrar_descricao = missao_numero[missao_index];
							global.missao_aberta=true;
							comprar_missao(mostrar_descricao.nome,missao_comprada);
						} else {						
							show_debug_message("Sem missao aqui");
						}
					}
				}
			}
		}
	#endregion
}
}

fechar_missao_ui = function () {

if(mouse_check_button_released(mb_left) and global.missao_ui==true) {
		if(is_between(mx,1200,1240)){
			if(is_between(my,40,90)){
			
		global.missao_ui=false;
		global.missao_aberta=false;
		
			}	
		}

}

}