/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var g_width = display_get_gui_width();
var g_height = display_get_gui_height();


if(global.inventario == true){

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
	"Stats"
);
draw_set(c_white, 1);
draw_text(
	ui_padding_x + (ui_border_size * 3),
	ui_padding_y + (ui_border_size * 4),
	"Stats"
);

draw_set(c_black, 0.5);
draw_text(
	ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
	ui_padding_y + (ui_border_size * 4) + 4,
	"Inventory"
);
draw_set(c_white, 1);
draw_text(
	ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin,
	ui_padding_y + (ui_border_size * 4),
	"Inventory"
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

//draw_set(c_white, 1);
//draw_text(mouse_x-60,mouse_y,mx)
//draw_text(mouse_x-60,mouse_y+30,my)
//draw_text(mouse_x-60,mouse_y+60,ui_inventory_box*19)
//draw_text(mouse_x-60,mouse_y+90,ui_border_size+ ui_inventory_box)
//draw_set(-1)


// draw inventory place holders
 inventory_items = inventory.item_get();

for (var row = 0; row < inventory_rows; row++) {
	var pos_y = ui_padding_y + (ui_border_size * 13) +
	(row * (ui_inventory_margin + ui_inventory_box));
    for (var column = 0; column < inventory_columns; column++) {
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
		draw_sprite(spr_Inventory_Box, 0, pos_x, pos_y);
		//
		
		
		
		var inventory_index = (row * inventory_columns) + column;
		if(inventory_index <= array_length(inventory_items) - 1) {
			// draw inventory sprite
			draw_sprite(inventory_items[inventory_index].sprite, 0, pos_x + ui_inventory_box/2, pos_y+ ui_inventory_box/2);
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
		
		//// now do this again but for quantity only
		if(inventory_index <= array_length(inventory_items) - 1) {
			draw_set(#232323, 1);
			draw_circle(
				pos_x + ui_inventory_box,
				pos_y + ui_inventory_box,
				14,
				false
			);
			
			draw_set(c_white, 1);
			text_align(fa_center, fa_middle);
			
			draw_text(
				pos_x + ui_inventory_box,
				pos_y + ui_inventory_box,
				inventory_items[inventory_index].quantidade
			);
			
		}
		
		
	}
}

var _inventory_items = inventory.item_get();

var pos_x = ui_padding_x + (ui_border_size * 10);
for(var inventory_index = 0; inventory_index < array_length(_inventory_items); inventory_index++) {
	var pos_y = (ui_border_size * 13) + (ui_inventory_box/3);
	
	//draw_sprite(spr_Inventory_Recipe_Box, 0, pos_x, pos_y);
	//draw_sprite(_recipies[recipe_index].sprite, 0, pos_x, pos_y);
	
	//draw_set_halign(fa_left);
	//draw_text(pos_x + 56, pos_y + 16, _recipies[recipe_index].name);
	
	//var requirement_string = "";
	//for(var requirement_index = 0; requirement_index < array_length(_recipies[recipe_index].requirements); requirement_index++) {
	//	requirement_string += $"{_recipies[recipe_index].requirements[requirement_index].name}: {_recipies[recipe_index].requirements[requirement_index].quantity}  ";
	//}
	if(global.status_heroi==true){
	text_align(fa_left, fa_middle);
	draw_text(pos_x, pos_y+20, $"Nome do Heroi: {mostrar_descricao.nome} ");
	//draw_text(pos_x, pos_y+20, $"Descricao: {mostrar_descricao.descricao} ");
	//draw_text(pos_x, pos_y+40, $"Recompensa: {mostrar_descricao.recompensa} ");
	draw_set_font(-1)
	}
}
draw_reset();
}

