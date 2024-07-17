// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Missao() constructor{
	
	

	_missao= [];
	_missao_comprada = [];
	_heroi_alocado_teste = [5,4,3,2,1,0,7,8]
	
	missao_set = function(_nome,_descricao,_requisito,_recompensa,_custo,_desenhar=false){
		array_push( _missao,{
		missao_id: global.missao_id++,
		nome:_nome,
		descricao:_descricao,
		requisito_heroi_numero:_requisito,
		recompensa:_recompensa,
		missao_comprada: _desenhar,
		custo: _custo,
		heroi_alocado: [],
		
		});
	
	}
	
	missao_comprada_set = function(_nome,_descricao,_requisito,_recompensa,_custo,_desenhar=false){
		array_push( _missao_comprada,{
		nome:_nome,
		descricao:_descricao,
		requisito_heroi_numero:_requisito,
		recompensa:_recompensa,
		desenhar: _desenhar,
		custo: _custo,
		heroi_alocado: []
		
		});
	show_message(_missao_comprada)
	}
	
	missao_add_heroi = function(missao_id){
		var _index = missao_find_id(missao_id);
		var _requisito_heroi = _missao[_index].requisito_heroi_numero
		//show_message("O index de add heroi eh " + string(_index))
		//show_message("O _requisito heroi eh " + string(_requisito_heroi))
		
		for(var _index_heroi =0; _index_heroi < _requisito_heroi; _index_heroi++){
		show_debug_message("funcionou")
		_missao[_index].heroi_alocado[_index_heroi]={
		nome: "Fulano 0",
			classe: "Arqueiro",
			level: 1,
			rank: "E",
			forca: 10,
			velocidade: 11,
			inteligencia: 12,
			sorte: 13,
			salario: 20,
			sprite: spr_heroi,
			id_missao: missao_id
		
		};
	
	}
	}
	
	missao_find = function (_nome){
		for (var i=0; i < array_length(_missao);i++){
			
			if(_nome == _missao[i].nome){
			return i;
			}
		
		}
	return -1;
	
	}
	
		missao_find_id = function (_missao_id){
		for (var i=0; i < array_length(_missao);i++){
			
			if(_missao_id == _missao[i].missao_id){
			return i;
			}
		
		}
	return -1;
	
	}
	
missao_find_missao_comprada = function (){
		_missao_comprada=[];
		for (var i=0; i < array_length(_missao);i++){
			
			if(_missao[i].missao_comprada){
			
			array_push(_missao_comprada,_missao[i].missao_id)
			
			}
		
		}
	return _missao_comprada;
	
	}


	missao_comprada_find = function (_nome){
		for (var i=0; i < array_length(_missao_comprada);i++){
			
			if(_nome == _missao_comprada[i].nome){
			return i;
			}
		
		}
	return -1;
	
	}
	
	missao_comprada_find_id = function (_missao_id){
		for (var i=0; i < array_length(_missao_comprada);i++){
			
			if(_missao_id == _missao_comprada[i].missao_id){
			return i;
			}
		
		}
	return -1;
	
	}
	

toString = function (){
	return json_stringify(_missao)

}


missao_comprada_heroi_get_sprite = function (slotDrag,rowHover){
var _index = slotDrag
var _row = rowHover
if( _index >=0 ) {
show_debug_message(_missao_comprada[_row].heroi_alocado[_index].sprite)
return _missao_comprada[_row].heroi_alocado[_index].sprite


}}

trocar_missao = function (inventoryDrag,inventoryHover,rowHover,columnHover,rowDrag,columnDrag){

var _itemFrom = _missao_comprada[rowDrag].heroi_alocado[columnDrag];
var _item_temp= _missao_comprada[rowHover].heroi_alocado[columnHover];
show_debug_message(rowDrag)
show_debug_message(columnDrag)
show_debug_message(_itemFrom)
show_debug_message(rowHover)
show_debug_message(columnHover)
show_debug_message(_item_temp)

_missao_comprada[rowHover].heroi_alocado[columnHover] = _itemFrom;
_missao_comprada[rowDrag].heroi_alocado[columnDrag]=_item_temp;

}


missao_subtract = function(_missao_id){
var _index = missao_find_id(_missao_id);
show_debug_message("O Index de missao subtract eh " + string(_index))
show_debug_message("O ID de missao subtract eh " + string(_missao_id))

if(_index >=0) {
		
	if ( _missao[_index].missao_id==_missao_id){
	missao_remove(_index);
	
	}
	
	}
}
missao_remove = function (_index) {

array_delete(_missao,_index,1);

}

missao_get = function (){
return _missao;
}

missao_comprada_get = function (){
return _missao_comprada;
}

missao_comprar = function (_missao_id){
var _index = missao_find_id(_missao_id);
//show_message("O index da missao a ser comprada eh " + string(_index))
if(_index>=0 and global.dinheiro >= _missao[_index].custo and _missao[_index].missao_comprada==false ){
global.dinheiro -= _missao[_index].custo;
_missao[_index].missao_comprada=true;
//show_message(global.dinheiro)
}

}

}

