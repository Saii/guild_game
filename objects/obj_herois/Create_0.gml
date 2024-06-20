/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

randomize();

heroi = new Heroi();
herois_adquiridos = noone;
mostrar_descricao_heroi=noone;
heroi.heroi_add("Fulano","Arqueiro",1,"D",10,10,10,10,10,spr_heroi);
heroi.heroi_add("Fulano 2","Arqueiro",1,"D",10,10,10,10,10,spr_heroi);




status_herois= {
nome:"Nome",
Classe:"Classe",

forca:10,
velocidade:10,
inteligencia:10,
res_fisica:10,
res_magia:10,
sorte: 10,
//pontos_de_vida: forca*10,
//pontos_de_mana: inteligencia*10,
//ataque_magico: inteligencia + res_magia/2,
//ataque_fisico: forca + res_fisica/2

}
display_set_gui_size(1280, 720);

inventory_columns = 6;
inventory_rows = 6;

ui_padding_x = 64;
ui_padding_y = 64;
ui_panel_left = 500;
ui_border_size = 8;
ui_inventory_padding = 48;
ui_inventory_box = 64;
ui_inventory_margin = 16;
ui_top =1028

color_background = #55507a;
color_border = #36234a;
color_inventory_text = c_white;
color_inventory_highlight = c_white;

 janela_herois = function() {

var _check = position_meeting(mouse_x,mouse_y,obj_herois);


if (_check and mouse_check_button_released(mb_left) and global.janela_heroi_fechada=false){

global.janela_heroi=true
global.janela_heroi_fechada=true;
global.heroi_ui=true;

}

}

janela_heroi_abrir = function(){
	
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
	
var heroi_numero = heroi.heroi_get();
var pos_x = 0;
var pos_y = 0;

if(mouse_check_button_released(mb_left) and global.heroi_ui==true) {		
	
	
		for (var row = 0; row < inventory_rows; row++) {				
			pos_y = ui_padding_y + (ui_border_size * 8) + (row * (ui_inventory_margin + ui_inventory_box));
			for (var column = 0; column < inventory_columns; column++) {
				pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
				if(is_between(mx, pos_x-40, (pos_x-40) + ui_inventory_box)) {
					if(is_between(my, (pos_y-10), (pos_y-10) + ui_inventory_box)) {
						var heroi_index = (row * inventory_columns) + column;
						// now we need to check if we have an inventory item here
						
						if(heroi_index <= array_length(heroi_numero) - 1) {
						//show_message($" O nome do heroi eh: {heroi_numero[heroi_index].nome}");	
						mostrar_descricao = heroi_numero[heroi_index];
						//show_debug_message(mostrar_descricao.nome)
						global.status_heroi = true;
							//inventory.item_subtract(inventory_items[inventory_index].nome, 1);
						} else {						
							show_debug_message("Sem herois aqui");
						}
					}
				}
				
			}
		}
	
}
}
