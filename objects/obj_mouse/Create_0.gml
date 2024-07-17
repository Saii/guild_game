/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;
objetoAtual = noone;

rowHover=-1;
columnHover=-1;

rowDrag=-1
columnDrag=-1

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




#region Funçao para Objeto Herois
stateFreeHeroi = function(){
	
	mouseOver();
	heroi_numero= obj_herois.heroi.heroi_get();
	//heroi_alocado = obj_herois.herois_alocados.heroi_get();
	
if(mouse_check_button(mb_left) and (slotHover != -1) and heroi_numero[slotHover]!= -1 ){

state = stateDragHeroi;
itemDrag = heroi_numero[slotHover];
inventoryDrag = inventoryHover;
slotDrag = slotHover;
heroi_sprite = obj_herois.heroi.heroi_get_sprite(slotDrag);
show_debug_message("O item drag eh " + string (itemDrag))
show_debug_message("O Inventory Drag eh " + string (inventoryDrag))
show_debug_message("O Slot Drag " + string (slotDrag))


}

}

stateDragHeroi = function (){

mouseOver();
heroi_numero= obj_herois.heroi.heroi_get();
heroi_alocado = obj_herois.herois_alocados.heroi_get();
heroi_sprite = obj_herois.heroi.heroi_get_sprite(slotDrag);

if (!mouse_check_button(mb_left)){

	if(slotHover != -1){
	
	obj_herois.heroi.heroi_swap(slotDrag,slotHover);
	
	state =stateFreeHeroi;
	itemDrag = -1;
	inventoryDrag=-1;
	slotDrag=-1;
	}
}

}

#endregion

#region Funcao para Objeto Iniciar Missao
stateFreeIniciarMissao = function(){

	mouseOver();
	
	missao_numero = obj_missao.missao_comprada.missao_comprada_get();


	
if(mouse_check_button(mb_left) and (slotHover != -1) and inventoryHover != -1) {
//show_debug_message("O RowHover eh " + string (rowHover))
//show_debug_message("O slot Hover eh" +string(slotHover))
//show_debug_message("O InventoryHover eh " +string(inventoryHover))

state = stateDragIniciarMissao;

inventoryDrag = inventoryHover;
slotDrag = slotHover;
rowDrag = rowHover
columnDrag=columnHover

	heroi_sprite =  obj_missao.missao_comprada.missao_comprada_heroi_get_sprite(columnDrag,rowDrag);

//heroi_sprite = obj_herois.heroi.heroi_get_sprite(slotDrag);
//show_debug_message("O item drag eh " + string (itemDrag))
//show_debug_message("O Inventory Drag eh " + string (inventoryDrag))
//show_debug_message("O Slot Drag " + string (slotDrag))
//show_debug_message("O Inventory Hover eh " + string(inventoryHover))
//show_debug_message("O Slot Hover eh " + string(slotHover))
}

}

stateDragIniciarMissao = function (){
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
mouseOver();
missao_numero = obj_missao.missao_comprada.missao_comprada_get();
heroi_alocado = obj_herois.herois_alocados.heroi_get();
heroi_sprite = obj_herois.heroi.heroi_get_sprite(slotDrag);

for ( var missoes_compradas_array =0; missoes_compradas_array < array_length(missao_numero);missoes_compradas_array++){
	
	for (var row = 0; row < array_length(missao_numero); row++) {
		var pos_y = ui_padding_y + (ui_border_size * 13) +	(row * (ui_inventory_margin + ui_inventory_box));



   for (var column = 0; column < missao_numero[row].requisito_heroi_numero; column++) {
		var pos_x = ui_padding_x + ui_border_size + (ui_inventory_padding*2) + (column * (ui_inventory_margin + ui_inventory_box)) + ui_inventory_box;
		
	
		
		if(point_in_rectangle
	(
	_mx,
	_my,
	pos_x,
	pos_y,
	pos_x+ui_inventory_box,
	pos_y+ui_inventory_box
	
	) and global.iniciar_missao=true){
	
	
	var heroi_index = (column);
	var missao_index = array_length(missao_numero)
	//show_debug_message("POSX " + string(pos_x))
	//show_debug_message("POSX + " + string(pos_x + ui_inventory_box))
	//show_debug_message("POS Y " + string(pos_y))
	//show_debug_message("POSY + " + string(pos_y+ui_inventory_box))
	//show_debug_message("ROW " + string(row))
	//show_debug_message("COLUMN" + string(column))
	//show_debug_message("Requisito de herois da missao " + string(missao_numero[row].requisito_heroi_numero))
	//show_debug_message("heroi_index" + string(heroi_index))
	
		if(heroi_index <= missao_numero[row].requisito_heroi_numero - 1) {
			
			//show_debug_message("VENDO NUMEROS FINAIS")
			//show_debug_message("heroi_index" + string(heroi_index))
			//show_debug_message("missao_index" + string(missao_index))
			//show_debug_message("POSX " + string(pos_x))
			//show_debug_message("POSX + " + string(pos_x + ui_inventory_box))
			//show_debug_message("POS Y " + string(pos_y))
			//show_debug_message("POSY + " + string(pos_y+ui_inventory_box))
			//show_debug_message("ROW " + string(row))
			//show_debug_message("COLUMN" + string(column))
			//show_debug_message("Requisito de herois da missao " + string(missao_numero[row].requisito_heroi_numero))
		
		if (!mouse_check_button(mb_left)){

				if(slotHover != -1){
				
				//show_debug_message(missao_numero[row].heroi_alocado[heroi_index])
				//missao_numero[row].heroi_alocado[heroi_index] = inventoryDrag
				//show_debug_message(missao_numero[row].heroi_alocado[heroi_index])
				//show_message("Deu certo")
				
				//show_debug_message("O inventory Drag eh " + string(inventoryDrag));
				//show_debug_message("O inventory Hover eh " + string(inventoryHover));
				//show_debug_message("O row Hover eh " + string(rowHover));
				//show_debug_message("O column Hover eh " + string(columnHover));
				//show_debug_message("O rowDrag eh " + string(rowDrag));
				//show_debug_message("O columnDrag eh " + string(columnDrag));
				
				obj_missao.missao_comprada.trocar_missao(inventoryDrag,inventoryHover,rowHover,columnHover,rowDrag,columnDrag)
			
				state =stateFreeIniciarMissao;
				itemDrag = -1;
				inventoryDrag=-1;
				slotDrag=-1;
				rowDrag = -1
				columnDrag=-1;
				}
}

}
	
			
		}
	}
				
		}
	}
}

#endregion

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
			//show_debug_message(other.inventoryHover)
			//show_debug_message("Obj Heroi")
		}
	}

}


}}
	
with(obj_iniciar_missao){
	
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
missao_numero = obj_missao.missao.missao_get();
heroi_numero = obj_herois.heroi.heroi_get();

//Desenhar as missões compradas
for ( var missoes_compradas_array =0; missoes_compradas_array < array_length(missao_numero);missoes_compradas_array++){
	for (var row = 0; row < array_length(missao_numero); row++) {
		var pos_y = ui_padding_y + (ui_border_size * 13) +	(row * (ui_inventory_margin + ui_inventory_box));


   for (var column = 0; column < missao_numero[row].requisito_heroi_numero; column++) {
		var pos_x = ui_padding_x + ui_border_size + (ui_inventory_padding*2) + (column * (ui_inventory_margin + ui_inventory_box)) + ui_inventory_box;
				
		
		if(point_in_rectangle
	(
	_mx,
	_my,
	pos_x,
	pos_y,
	pos_x+ui_inventory_box,
	pos_y+ui_inventory_box
	
	) and global.iniciar_missao=true){
	missao_numero= obj_missao.missao.missao_get();
	var missao_index = (row * inventory_columns_missao) + column;
		if(missao_index <= array_length(missao_numero) - 1) {
			
			//other.slotHover=column;
			//other.inventoryHover= missao_numero[missao_index].heroi_alocado[column].nome
			//other.rowHover=row;
			//other.columnHover=column;
			//show_debug_message("O slot Hover eh " + string(other.slotHover));
			//show_debug_message("O inventory Hover eh " + string(other.inventoryHover))
			//show_debug_message("O Row " + string(other.rowHover));
			//show_debug_message("O Column eh " + string(other.columnHover))
		}
	}
				
	}
}

}
// Fim desenhar as missões compradas

//  Inicio Desenhar os slots de herois para alocar nas missões

for ( var missoes_compradas_array =0; missoes_compradas_array < array_length(missao_numero);missoes_compradas_array++){
	
	for (var row = 0; row < array_length(missao_numero); row++) {
		var pos_y = ui_padding_y + (ui_border_size * 13) +	(row * (ui_inventory_margin + ui_inventory_box));


   for (var column = 0; column < missao_numero[row].requisito_heroi_numero; column++) {
		var pos_x = ui_padding_x + ui_border_size + (ui_inventory_padding*2) + (column * (ui_inventory_margin + ui_inventory_box)) + ui_inventory_box;
		
		
		
		if(point_in_rectangle
	(
	_mx,
	_my,
	pos_x,
	pos_y,
	pos_x+ui_inventory_box,
	pos_y+ui_inventory_box
	
	) and global.iniciar_missao=true){
	
	
	var heroi_index = (column);
	var missao_index = array_length(missao_numero)
	//show_debug_message("POSX " + string(pos_x))
	//show_debug_message("POSX + " + string(pos_x + ui_inventory_box))
	//show_debug_message("POS Y " + string(pos_y))
	//show_debug_message("POSY + " + string(pos_y+ui_inventory_box))
	//show_debug_message("ROW " + string(row))
	//show_debug_message("COLUMN" + string(column))
	//show_debug_message("Requisito de herois da missao " + string(missao_numero[row].requisito_heroi_numero))
	//show_debug_message("heroi_index" + string(heroi_index))
	
		if(heroi_index <= missao_numero[row].requisito_heroi_numero - 1) {
			
			//show_debug_message("VENDO NUMEROS FINAIS")
			//show_debug_message("heroi_index" + string(heroi_index))
			//show_debug_message("missao_index" + string(missao_index))
			//show_debug_message("POSX " + string(pos_x))
			//show_debug_message("POSX + " + string(pos_x + ui_inventory_box))
			//show_debug_message("POS Y " + string(pos_y))
			//show_debug_message("POSY + " + string(pos_y+ui_inventory_box))
			//show_debug_message("ROW " + string(row))
			//show_debug_message("COLUMN" + string(column))
			//show_debug_message("Requisito de herois da missao " + string(missao_numero[row].requisito_heroi_numero))
		
	
		other.inventoryHover= missao_numero[row].heroi_alocado[heroi_index]
		other.rowHover=row;
		other.columnHover=column;
		other.slotHover=column;
			//show_debug_message("O slot Hover eh " + string(other.slotHover));
			//show_debug_message("O inventory Hover eh " + string(other.inventoryHover))
			//show_debug_message("O Row " + string(other.rowHover));
			//show_debug_message("O Column eh " + string(other.columnHover))
		//show_debug_message(other.slotHover);
		//show_debug_message("Inventory Hover " + string(other.inventoryHover))
			
		}
	}
				
		}
	}
}

//Fim desenho Slot missoes




//Inicio Desenhar o slot dos Herois Comprados
for (var row = 0; row < inventory_rows_heroi; row++) {
	var pos_y = ui_padding_y + (ui_border_size * 13) +	(row * (ui_inventory_margin + ui_inventory_box));
	
    for (var column = 0; column < inventory_columns_heroi; column++) {
		var pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
		
					
		if(point_in_rectangle
	(
	_mx,
	_my,
	pos_x,
	pos_y,
	pos_x+ui_inventory_box,
	pos_y+ui_inventory_box
	
	) and global.iniciar_missao=true){
	heroi_numero= obj_herois.heroi.heroi_get();


	var heroi_index = (row * inventory_columns_heroi) + column;
	
		if(heroi_index <= array_length(heroi_numero) - 1) {
			
			other.slotHover=heroi_index;
			other.inventoryHover= heroi_numero[heroi_index].nome
			//show_debug_message("O nome " + string(other.inventoryHover))
			
		}
	}
		
		
		
		
	}
}
//Fim Desenhar o slot dos Herois Comprados

}

with(obj_casa){
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if(collision_point(mouse_x,mouse_y,obj_casa,false,false)){
	if(mouse_check_button_released(mb_left)){
	desenhar = !desenhar
	}
	


}

}

//funções de desenhar a casa, aumento e diminuição de moradores

	if(is_between(_mx,396,439)){
		show_debug_message("Entrou no x")
			if(is_between(_my,142,186)){
				show_debug_message("Entrou no y")
				if(mouse_check_button_released(mb_left) and obj_casa.desenhar==true){ 
			
		obj_casa.diminuir_moradores();
		
			}	
		}

}

	if(is_between(_mx,499,543)){
		show_debug_message("Entrou no x")
			if(is_between(_my,142,186)){
				show_debug_message("Entrou no y")
				if(mouse_check_button_released(mb_left) and obj_casa.desenhar==true){ 
			
		obj_casa.aumentar_moradores();
		
			}	
		}

}
}








state = function(){


switch (objetoAtual){
	
	case "Objeto_Heroi":
	
	state = stateFreeHeroi;
	
	break;
	
	case "Objeto Iniciar Missao":
	state = stateFreeIniciarMissao;

	break;
	
	


}

}

state = stateFreeIniciarMissao;