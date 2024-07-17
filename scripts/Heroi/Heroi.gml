// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Heroi() constructor {


			
  
	_heroi= [];
	_heroi_alocado=[];
	
	
	heroi_set = function(_nome,_classe,_level,_rank,_forca,_velocidade,_inteligencia,_sorte,_salario,_sprite){
		array_push( _heroi,{
			
			heroi_id: global.heroi_id++,
			nome: _nome,
			classe: _classe,
			level: _level,
			rank: _rank,
			forca: _forca,
			velocidade: _velocidade,
			inteligencia: _inteligencia,
			sorte: _sorte,
			salario: _salario,
			sprite: _sprite,
			desenhou: false,
			id_missao:0
		
		
		});
	
	}
	
	heroi_alocado_set = function(_nome,_classe,_level,_rank,_forca,_velocidade,_inteligencia,_sorte,_salario,_sprite){
		array_push( _heroi_alocado,{
			nome: _nome,
			classe: _classe,
			level: _level,
			rank: _rank,
			forca: _forca,
			velocidade: _velocidade,
			inteligencia: _inteligencia,
			sorte: _sorte,
			salario: _salario,
			sprite: _sprite
		
		
		});
	
	}
	
	heroi_find = function (_nome){
		for (var i=0; i < array_length(_heroi);i++){
			
			if(_nome == _heroi[i].nome){
			
			return i;
			}
		
		}
	return -1;
	
	}
	
	
	heroi_find_id = function (_heroi_id){
		for (var i=0; i < array_length(_heroi);i++){
			
			if(_heroi_id == _heroi[i].heroi_id){
			
			return i;
			}
		
		}
	return -1;
	
	}
	
	heroi_find_missao = function (_missao_id){
		_heroi_alocado=[];
		for (var i=0; i < array_length(_heroi);i++){
			
			if(_missao_id == _heroi[i].id_missao){
			
			array_push(_heroi_alocado,_heroi[i].heroi_id)
			
			}
		
		}
	return _heroi_alocado;
	
	}
	
	heroi_add = function (_nome,_classe,_level,_rank,_forca,_velocidade,_inteligencia,_sorte,_salario,_sprite){
		
		heroi_set(_nome,_classe,_level,_rank,_forca,_velocidade,_inteligencia,_sorte,_salario,_sprite);
		
}

heroi_add_missao = function (heroi_id,missao_id){
var _index = heroi_find_id(heroi_id);

//show_debug_message("O index eh " + string(_index))
//show_debug_message(missao_id)
//show_message(_index)
_heroi[_index].id_missao = missao_id
return _heroi[_index].id_missao= missao_id;
}

toString = function (){
	return json_stringify(_heroi)

}

heroi_has = function(_nome,_quantidade){
var _index = heroi_find(_nome);

if( _index >=0 ) {
return _heroi[_index].rank>= _rank;


}

return false;


}

// Colocar a função para remover vida, ajustar
heroi_subtract_vida = function(_nome,_quantidade){
var _index = item_find(_nome);

if(_index >=0) {
	if (item_has(_nome,_quantidade)){
		_inventorio_itens[_index].quantidade -= _quantidade;
		
	if ( _inventorio_itens[_index].quantidade <=0){
	item_remove(_index);
	
	}
	
	}
}

}

//remover heroi caso morra,seja demitido ou seja alocado a missão

heroi_remove = function (_index) {

array_delete(_heroi,_index,1);

}

heroi_get = function (){
return _heroi;
}

heroi_get_nome = function (_nome){
var _index = heroi_find(_nome)

if( _index >=0 ) {
return _heroi[_index].nome


}

return false;

}

heroi_get_sprite = function (slotDrag){
var _index = slotDrag

if( _index >=0 ) {
return _heroi[slotDrag].sprite


}
}

heroi_get_sprite_id = function (_heroi_id){
var _index = heroi_find_id(_heroi_id)

if( _index >=0 ) {

return _heroi[_index].sprite


}

return false;

}

heroi_get_nome_id = function (_heroi_id){
var _index = heroi_find_id(_heroi_id)

if( _index >=0 ) {

return _heroi[_index].nome


}

return false;

}

heroi_get_missao_id = function (_heroi_id){
var _index = heroi_find_id(_heroi_id)

if( _index >=0 ) {

return _heroi[_index].id_missao


}

return false;

}

heroi_swap = function (slotFrom,slotTo){
//var _index = _heroi_find(_nome)
var _itemFrom = _heroi[slotFrom];
show_debug_message(_itemFrom);
_heroi[slotFrom]= _heroi[slotTo]
_heroi[slotTo] = _itemFrom;

}

heroi_swap_alocado_comprado = function (slotFrom,slotTo,comprado,alocado){
//var _index = _heroi_find(_nome)
var _itemFrom = _heroi[slotFrom];
show_debug_message(_itemFrom);
_heroi[slotFrom]= _heroi[slotTo]
_heroi[slotTo] = _itemFrom;

}

craftar_heroi = function (_nome1,_requisitos1,_nome2,_requisitos2){
	var _item = item_find(_nome1);
	var _item2 = item_find(_nome2);
	show_message("Entrou na funcao");
	if (_item >=0 and _item2 >=0){
		if (item_has(_nome1,_requisitos1)>=1 and item_has(_nome2,_requisitos2)>=1){
		item_add("Super Heroi",1,spr_super_heroi);
		show_debug_message(item_get());
		item_subtract(_nome1,_requisitos1);
		item_subtract(_nome2,_requisitos2);
		
		}
	}
}

}