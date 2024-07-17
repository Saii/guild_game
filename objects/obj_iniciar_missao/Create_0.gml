/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



missao_numero = noone;
mostrar_descricao=noone;
forca_missao=noone;

objeto="Objeto Iniciar Missao"

display_set_gui_size(1280, 720);

inventory_columns_heroi = 3;
inventory_rows_heroi = 2;
inventory_columns_missao = 1;
inventory_rows_missao = 6;
ui_padding_x = 64;
ui_padding_y = 64;
ui_panel_left = 640;
ui_border_size = 8;
ui_inventory_padding = 48;
ui_inventory_box = 64;
ui_inventory_margin = 16;
ui_top =1028

color_background = #55507a;
color_border = #36234a;
color_inventory_text = c_white;
color_inventory_highlight = c_white;




janela_iniciar_missao = function() {

var _check = position_meeting(mouse_x,mouse_y,obj_iniciar_missao)


if (_check and mouse_check_button_released(mb_left) and global.iniciar_missao=false){

global.iniciar_missao=true
global.alocar_missao_ui=true
obj_mouse.objetoAtual =objeto;

}

}

janela_selecionar_missao_iniciar = function(){


	
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
	
var missao_comprada_numero = obj_missao.missao.missao_get();
var pos_x = 0;
var pos_y = 0;

if(mouse_check_button_released(mb_left) and global.alocar_missao_ui==true) {		
	
	
		for (var row = 0; row < inventory_rows_missao; row++) {				
			pos_y = ui_padding_y + (ui_border_size * 8) + (row * (ui_inventory_margin + ui_inventory_box));
			for (var column = 0; column < inventory_columns_missao; column++) {
				pos_x = ui_padding_x + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
				if(is_between(mx, pos_x-40, (pos_x-40) + ui_inventory_box)) {
					if(is_between(my, (pos_y-10), (pos_y-10) + ui_inventory_box)) {
						var missao_comprada_index = (row * inventory_columns_missao) + column;
						// now we need to check if we have an inventory item here
						
						if(missao_comprada_index  <= array_length(missao_comprada_numero) - 1) {
						show_message($" O nome da missao eh: {missao_comprada_numero[missao_comprada_index].nome}");	
						mostrar_descricao = missao_comprada_numero[missao_comprada_index];
						show_debug_message(mostrar_descricao.nome)
						global.status_iniciar = true;
							//inventory.item_subtract(inventory_items[inventory_index].nome, 1);
						} else {						
							show_debug_message("Sem missao aqui");
						}
					}
				}
				
			}
		}
	
}
}

fechar_iniciar_missao = function () {
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if(mouse_check_button_released(mb_left) and global.alocar_missao_ui==true) {
		if(is_between(mx,1200,1240)){
			if(is_between(my,40,90)){
			global.alocar_missao_ui=false;
			global.status_iniciar = false;
			global.iniciar_missao=false
			}	
		}

}

}

enviar_missao = function (){
missao_numero = obj_missao.missao.missao_get();
heroi_numero= obj_herois.heroi.heroi_get();

if(keyboard_check_released(vk_enter)){
for ( var missoes_compradas_array =0; missoes_compradas_array < array_length(missao_numero);missoes_compradas_array++){
	forca_missao=0;
	for( var herois_comprados_array=0; herois_comprados_array <array_length(heroi_numero); herois_comprados_array++){
		if(missao_numero[missoes_compradas_array].missao_comprada==true){
				if(missao_numero[missoes_compradas_array].missao_id==heroi_numero[herois_comprados_array].id_missao){
				forca_missao += heroi_numero[herois_comprados_array].forca
				show_debug_message("A forca da missao " +string(forca_missao) + "NOME DA MISSAO " + string(missao_numero[missoes_compradas_array].nome))
				}

			}

}
}

}
}


