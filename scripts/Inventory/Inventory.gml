// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Inventory() constructor {

	_inventorio_itens= [];
	
	item_set = function(_nome,_quantidade,_sprite){
		array_push( _inventorio_itens,{
			nome: _nome,
			quantidade: _quantidade,
			sprite: _sprite
		
		
		});
	
	}
	
	item_find = function (_nome){
		for (var i=0; i < array_length(_inventorio_itens);i++){
			
			if(_nome == _inventorio_itens[i].nome){
			return i;
			}
		
		}
	return -1;
	
	}
	
	item_add = function (_nome,_quantidade,_sprite){
	var _index = item_find(_nome);
	
	if(_index >=0) {
		_inventorio_itens[_index].quantidade += _quantidade;	}
	
	 else {
		item_set(_nome,_quantidade,_sprite);
	
	}
}

toString = function (){
	return json_stringify(_inventorio_itens)

}

item_has = function(_nome,_quantidade){
var _index = item_find(_nome);

if( _index >=0 ) {
return _inventorio_itens[_index].quantidade >= _quantidade;


}

return false;


}

item_subtract = function(_nome,_quantidade){
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

item_remove = function (_index) {

array_delete(_inventorio_itens,_index,1);

}

item_get = function (){
return _inventorio_itens;
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