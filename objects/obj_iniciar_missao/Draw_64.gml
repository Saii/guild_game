/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var g_width = display_get_gui_width();
var g_height = display_get_gui_height();


if(global.iniciar_missao == true){

// draw outside shadow
draw_set(c_black, 0.2);
draw_rectangle(
	ui_padding_x + ui_border_size,
	ui_padding_y + ui_border_size,
	(g_width - ui_padding_x) + ui_border_size,
	(g_height - ui_padding_y) + ui_border_size,
	false
);

// draw outside rectangle
draw_set(color_border, 1);
draw_rectangle(
	ui_padding_x,
	ui_padding_y,
	g_width - ui_padding_x,
	g_height - ui_padding_y,
	false
);

// draw rectangle inside
draw_set(color_background, 1);
draw_rectangle(
	ui_padding_x + ui_border_size,
	ui_padding_y + ui_border_size,
	g_width - ui_padding_x - ui_border_size,
	g_height - ui_padding_y - ui_border_size,
	false
);

// draw horizontal line
draw_set(color_border, 1);
draw_rectangle(
	ui_padding_x + ui_panel_left,
	ui_padding_y + ui_border_size,
	ui_padding_x + ui_panel_left + ui_border_size,
	g_height - ui_padding_y - ui_border_size,
	false
);

// draw text
draw_set_font(fn_Ubuntu);
text_align(fa_left, fa_top);
draw_set(color_inventory_text, 1);

draw_set(c_black, 0.5);
draw_text(
	ui_padding_x + (ui_border_size * 3) + 4,
	ui_padding_y + (ui_border_size * 4) + 4,
	"Missao"
);
draw_set(c_white, 1);
draw_text(
	ui_padding_x + (ui_border_size * 3),
	ui_padding_y + (ui_border_size * 4),
	"Missao"
);

draw_set(c_black, 0.5);
draw_text(
	ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
	ui_padding_y + (ui_border_size * 4) + 4,
	"Heroi"
);
draw_set(c_white, 1);
draw_text(
	ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin,
	ui_padding_y + (ui_border_size * 4),
	"Heroi"
);

draw_set(#232323, 1);
			draw_circle(
				 ui_inventory_box*19,				
				ui_border_size + ui_inventory_box,
				20,
				false
			);
text_align(fa_center, fa_middle);
draw_text_color(
				ui_inventory_box*19,				
				ui_border_size+ ui_inventory_box,
				"x",
				c_white,c_white,c_white,c_white,1
			);			


// reset text
draw_set_font(-1);

// mouse position
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

draw_set(c_white, 1);
draw_text(mouse_x-60,mouse_y,mx)
//draw_text(mouse_x-60,mouse_y+30,my)
//draw_text(mouse_x-60,mouse_y+60,ui_inventory_box*19)
//draw_text(mouse_x-60,mouse_y+90,ui_border_size+ ui_inventory_box)
draw_set(-1)


// draw inventory place holders
missao_numero = obj_missao.missao_comprada.missao_comprada_get();
heroi_numero = obj_herois.heroi.heroi_get();

for (var row = 0; row < inventory_rows_missao; row++) {
	var pos_y = ui_padding_y + (ui_border_size * 13) +	(row * (ui_inventory_margin + ui_inventory_box));


   for (var column = 0; column < inventory_columns_missao; column++) {
		var pos_x = ui_padding_x + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
		
		// draw offset sprite for shadow
		draw_sprite_ext(
			spr_Inventory_Box,
			0,
			pos_x + 4,
			pos_y + 4,
			1,
			1,
			0,
			c_black,
			0.4
		);
		
		// draw inventory box sprite
		draw_sprite_stretched_ext(spr_Inventory_Box, 0, pos_x, pos_y,64,64,c_white,1);
		
		//
		var missao_index = (row * inventory_columns_missao) + column;
		if(missao_index <= array_length(missao_numero) - 1) {
			// draw inventory sprite
			var pos_z = ui_padding_y + (ui_border_size * 13) +	(missao_numero[missao_index].requisito_heroi_numero * (ui_inventory_margin + ui_inventory_box));
			
			draw_set(c_white, 1);
			draw_text( pos_x + ui_inventory_box/2, pos_y+ ui_inventory_box/2,missao_numero[missao_index].nome);
			draw_reset();

		}
		
		
		//// if our mouse is between one of the columns let's highlight it
		if(is_between(mx, pos_x, pos_x + ui_inventory_box)) {
			if(is_between(my, pos_y, pos_y + ui_inventory_box)) {
				draw_set(color_inventory_highlight, 0.2);
				draw_rectangle(
					pos_x,
					pos_y,
					pos_x + ui_inventory_box,
					pos_y + ui_inventory_box,
					false
				);
				draw_reset();
			}
		}
				
	}
}

// Desenhar os slots de herois para as missões

for ( var missoes_compradas_array =0; missoes_compradas_array < array_length(missao_numero);missoes_compradas_array++){
	for (var row = 0; row < array_length(missao_numero); row++) {
		var pos_y = ui_padding_y + (ui_border_size * 13) +	(row * (ui_inventory_margin + ui_inventory_box));


   for (var column = 0; column < missao_numero[row].requisito_heroi_numero; column++) {
		var pos_x = ui_padding_x + ui_border_size + (ui_inventory_padding*2) + (column * (ui_inventory_margin + ui_inventory_box)) + ui_inventory_box;
		
		// draw offset sprite for shadow
		draw_sprite_ext(
			spr_Inventory_Box,
			0,
			pos_x + 4,
			pos_y + 4,
			1,
			1,
			0,
			c_black,
			0.4
		);
		
		// draw inventory box sprite
		//if(column <= missao_numero[missoes_compradas_array].requisito_heroi_numero){
		draw_sprite_stretched_ext(spr_Inventory_Box, 0, pos_x, pos_y,64,64,c_white,1);
		
		//}
		//
		
		//show_debug_message("A missao_compradas_array index eh: " + string(missoes_compradas_array))
		//show_debug_message("A Row eh: " + string(row))
		//show_debug_message("A Column eh: " + string(column))
		//show_debug_message("A missao_compradas_array index eh: " + string(missoes_compradas_array))
		//show_debug_message("A missao numero [] eh: " + string(missao_numero[missoes_compradas_array].requisito_heroi_numero))
		
	
		
		
		//// if our mouse is between one of the columns let's highlight it
		if(is_between(mx, pos_x, pos_x + ui_inventory_box)) {
			if(is_between(my, pos_y, pos_y + ui_inventory_box)) {
				draw_set(color_inventory_highlight, 0.2);
				draw_rectangle(
					pos_x,
					pos_y,
					pos_x + ui_inventory_box,
					pos_y + ui_inventory_box,
					false
				);
				draw_reset();
				}
			}
				
		}
	}
}

//Fim desenho Slot missoes


//  Inicio Desenhar os slots de herois para alocar nas missões

for ( var missoes_compradas_array =0; missoes_compradas_array < array_length(missao_numero);missoes_compradas_array++){
	
	for (var row = 0; row < array_length(missao_numero); row++) {
		var pos_y = ui_padding_y + (ui_border_size * 13) +	(row * (ui_inventory_margin + ui_inventory_box));


   for (var column = 0; column < missao_numero[row].requisito_heroi_numero; column++) {
		var pos_x = ui_padding_x + ui_border_size + (ui_inventory_padding*2) + (column * (ui_inventory_margin + ui_inventory_box)) + ui_inventory_box;
		
		
		
	
	
	
	var heroi_index = (column);
	var missao_index = array_length(missao_numero)

	
		if(heroi_index <= missao_numero[row].requisito_heroi_numero - 1) {
			
			// É necessário adicionar um loop para ir até o index existente dentro do heroi alocado para ver
			//se existe um sprite ou não dentro do heroi alocado
			
			sprite = missao_numero[row].heroi_alocado[heroi_index].sprite
			if(  sprite != -1){
			draw_sprite_stretched(missao_numero[row].heroi_alocado[heroi_index].sprite,image_index,pos_x,pos_y,64,64)
			}
			
		}
	
				
		}
	}
}

//Fim desenho Slot Heroi nas missoes

for (var row = 0; row < inventory_rows_heroi; row++) {
	var pos_y = ui_padding_y + (ui_border_size * 13) +	(row * (ui_inventory_margin + ui_inventory_box));
	
    for (var column = 0; column < inventory_columns_heroi; column++) {
		var pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
		
		// draw offset sprite for shadow
		draw_sprite_ext(
			spr_Inventory_Box,
			0,
			pos_x + 4,
			pos_y + 4,
			1,
			1,
			0,
			c_black,
			0.4
		);
		
		// draw inventory box sprite
		draw_sprite_stretched_ext(spr_Inventory_Box, 0, pos_x, pos_y,64,64,c_white,1);
		//show_debug_message("POS X" + string(pos_x))
		//show_debug_message("POS Y" + string(pos_y))
		//
		var heroi_index = (row * inventory_columns_heroi) + column;
		if(heroi_index <= array_length(heroi_numero) - 1) {
			// draw inventory sprite
			
			draw_sprite_stretched(heroi_numero[heroi_index].sprite,image_index,pos_x + 4, pos_y+ ui_inventory_box/8,64,64)
			

		}
			
		//// if our mouse is between one of the columns let's highlight it
		if(is_between(mx, pos_x, pos_x + ui_inventory_box)) {
			if(is_between(my, pos_y, pos_y + ui_inventory_box)) {
				draw_set(color_inventory_highlight, 0.2);
				draw_rectangle(
					pos_x,
					pos_y,
					pos_x + ui_inventory_box,
					pos_y + ui_inventory_box,
					false
				);
				draw_reset();
			}
		}
		
		
		
		
	}
}

var _missao = obj_missao.missao_comprada.missao_get();
var pos_x = ui_padding_x + (ui_border_size * 10);
if(global.status_iniciar == true){
for(var missao_index = 0; missao_index < array_length(_missao); missao_index++) {
	var pos_y = (ui_border_size * 13) + (ui_inventory_box/3);
	
	//draw_sprite(spr_Inventory_Recipe_Box, 0, pos_x, pos_y);
	//draw_sprite(_recipies[recipe_index].sprite, 0, pos_x, pos_y);
	
	//draw_set_halign(fa_left);
	//draw_text(pos_x + 56, pos_y + 16, _recipies[recipe_index].name);
	
	//var requirement_string = "";
	//for(var requirement_index = 0; requirement_index < array_length(_recipies[recipe_index].requirements); requirement_index++) {
	//	requirement_string += $"{_recipies[recipe_index].requirements[requirement_index].name}: {_recipies[recipe_index].requirements[requirement_index].quantity}  ";
	//}
	
	text_align(fa_left, fa_middle);
	draw_text(pos_x, pos_y, $"Nome da Missao: {mostrar_descricao.nome} ");
	//draw_text(pos_x, pos_y+20, $"Descricao: {mostrar_descricao.descricao} ");
	//draw_text(pos_x, pos_y+40, $"Recompensa: {mostrar_descricao.recompensa} ");
	draw_set_font(-1)

} }
draw_reset();
}
