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


#region Desenhar inventários Linhas

// draw inventory place holders
missao_numero = obj_missao.missao.missao_get();
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
	
		var comprei_missao = missao_numero[missao_index].missao_comprada
		if((missao_index <= array_length(missao_numero) - 1)and (comprei_missao==true)) {
			// draw inventory sprite
			
			
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

#endregion

#region Desenhar os slots de herois para as missões
// Desenhar os slots de herois para as missões

for ( var missoes_compradas_array =0; missoes_compradas_array < array_length(missao_numero);missoes_compradas_array++){
	
	if(missao_numero[missoes_compradas_array].missao_comprada ==true){
		var pos_y = ui_padding_y + (ui_border_size * 13) +	(missoes_compradas_array * (ui_inventory_margin + ui_inventory_box));
	
		for (var column = 0; column < missao_numero[missoes_compradas_array].requisito_heroi_numero; column++) {
		var pos_x = ui_padding_x + ui_border_size + (ui_inventory_padding*2) + (column * (ui_inventory_margin + ui_inventory_box)) + ui_inventory_box;
		draw_sprite_stretched_ext(spr_Inventory_Box, 0, pos_x, pos_y,64,64,c_white,1);
		}
	}
	//for (var row = 0; row < array_length(missao_numero); row++) {
	//	var pos_y = ui_padding_y + (ui_border_size * 13) +	(row * (ui_inventory_margin + ui_inventory_box));


   //for (var column = 0; column < missao_numero[row].requisito_heroi_numero; column++) {
	//	var pos_x = ui_padding_x + ui_border_size + (ui_inventory_padding*2) + (column * (ui_inventory_margin + ui_inventory_box)) + ui_inventory_box;
		
		
		
	//	// draw inventory box sprite
	//	if(row < missao_numero[missoes_compradas_array].requisito_heroi_numero and missao_numero[missoes_compradas_array].missao_comprada ==true ){
	//	// draw offset sprite for shadow
	//	show_debug_message("row " + string(row))
	//	show_debug_message("column " + string(column))
	//	show_debug_message("missoes_compradas_array " + string(missoes_compradas_array))
	//	show_debug_message("missoes_compradas_requisito" + string(missao_numero[missoes_compradas_array].requisito_heroi_numero))
	//	draw_sprite_ext(
	//		spr_Inventory_Box,
	//		0,
	//		pos_x + 4,
	//		pos_y + 4,
	//		1,
	//		1,
	//		0,
	//		c_black,
	//		0.4
	//	);
	//	draw_sprite_stretched_ext(spr_Inventory_Box, 0, pos_x, pos_y,64,64,c_white,1);
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
		//
		
		//show_debug_message("A missao_compradas_array index eh: " + string(missoes_compradas_array))
		//show_debug_message("A Row eh: " + string(row))
		//show_debug_message("A Column eh: " + string(column))
		//show_debug_message("A missao_compradas_array index eh: " + string(missoes_compradas_array))
		//show_debug_message("A missao numero [] eh: " + string(missao_numero[missoes_compradas_array].requisito_heroi_numero))
		
	
		
		
	
				
//		}
//	}
//}

//Fim desenho Slot missoes

#endregion

#region Desenhar os sprites do heroi 
//  Inicio Desenhar os slots de herois para alocar nas missões

heroi_numero = obj_herois.heroi.heroi_get();

	
	for (var row = 0; row < array_length(missao_numero); row++) {
		var pos_y = ui_padding_y + (ui_border_size * 13) +	(row * (ui_inventory_margin + ui_inventory_box));
		//show_debug_message("A linha eh " + string (row) )
		
		if(missao_numero[row].missao_comprada==true){
		heroi_alocado[row] = obj_herois.heroi.heroi_find_missao(missao_numero[row].missao_id);
		//show_debug_message("O heroi alocado eh o " + string(heroi_alocado[row]));
		//show_debug_message("O tamnho do array do heroi alocado eh " + string(array_length(heroi_alocado[row])))
	
	for (var column = 0; column < array_length(heroi_alocado[row]); column++) {
				var pos_x = ui_padding_x + ui_border_size + (ui_inventory_padding*2) + (column * (ui_inventory_margin + ui_inventory_box)) + ui_inventory_box;
		show_debug_message("A Coluna eh " + string (column) )
			//for ( var missoes_compradas_array =0; missoes_compradas_array < array_length(heroi_alocado[row]);missoes_compradas_array++){
			//show_debug_message("A missoes compradas array " + string (column) )
			//show_debug_message("O heroi alocado eh " + string (heroi_alocado[row][column]) )
			//show_debug_message("A missao id da row eh" + string (missao_numero[row].missao_id) )
			heroi_id_missao = obj_herois.heroi.heroi_get_missao_id(heroi_alocado[row][column])
			//show_debug_message("A missao id do heroi eh" + string (heroi_id_missao) )
		if(heroi_id_missao==missao_numero[row].missao_id){
				
				var new_id_heroi = heroi_alocado[row][column]
				//show_debug_message("O ID do Heroi Alocado eh   " + string(heroi_alocado[row][column]))
				//show_debug_message("Missao comprada Array  " + string(column))
				//show_debug_message("O Id da Missao do Heroi numero missoes compradas  " + string(heroi_numero[column].id_missao))
				//show_debug_message("Id Missao " + string(heroi_numero[missoes_compradas_array].id_missao))
				//show_debug_message("Missao Id do missao numero[row]" + string (missao_numero[row].missao_id));
				//show_debug_message("Row" + string (row));
				//show_debug_message("Column" + string (column));
				
				sprite = obj_herois.heroi.heroi_get_sprite_id(new_id_heroi)
				nome =obj_herois.heroi.heroi_get_nome_id(new_id_heroi)
				//show_debug_message(sprite)
				//show_debug_message(nome)
			if(  sprite != -1){
			draw_sprite_stretched(sprite,image_index,pos_x,pos_y,64,64);
			show_debug_message("Desenhando o " + string(nome) + " " + "que tem a sprite "+ string(sprite))
			
				
				}
			
			}
			// É necessário adicionar um loop para ir até o index existente dentro do heroi alocado para ver
			//se existe um sprite ou não dentro do heroi alocado
			
			
			
			
			
		//}
	}
		
		
		}

		
	
				
}
	


//Fim desenho Slot Heroi nas missoes

#endregion

#region Desenhar o slot de herois COMPRADOS

//Herois

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
		//show_debug_message("Heroi Index" + string(heroi_index))
		//show_debug_message("Heroi Index" + string(row))
		//show_debug_message("Heroi Index" + string(column))
		if((heroi_index <= array_length(heroi_numero) - 1 )and heroi_numero[heroi_index].id_missao==missao_numero[row].missao_id) {
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
	
#endregion

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
