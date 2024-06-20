/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
janela_missao();
janela_missao_selecionar();
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var missao_numero = missao.missao_get();
var pos_x = 0;
var pos_y = 0;

if(mouse_check_button_released(mb_left) and global.missao_ui==true) {
		if(is_between(mx,1200,1240)){
			if(is_between(my,40,90)){
			
		global.missao_ui=false;
		global.missao_aberta=false;
		
			}	
		}

}

