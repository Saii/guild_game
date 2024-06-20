// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Missao() constructor{
	
	

	_missao= [];
	_missao_comprada = [];
	
	missao_set = function(_nome,_descricao,_requisito,_recompensa,_custo,_desenhar=false){
		array_push( _missao,{
		nome:_nome,
		descricao:_descricao,
		requisito_heroi_numero:_requisito,
		recompensa:_recompensa,
		desenhar: _desenhar,
		custo: _custo
		
		});
	
	}
	
	missao_find = function (_nome){
		for (var i=0; i < array_length(_missao);i++){
			
			if(_nome == _missao[i].nome){
			return i;
			}
		
		}
	return -1;
	
	}
	

toString = function (){
	return json_stringify(_missao)

}





missao_subtract = function(_nome){
var _index = missao_find(_nome);

if(_index >=0) {
		
	if ( _missao[_index].nome ==true){
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

missao_comprar = function (_nome,_missao_comprada_array){
var _index = missao_find(_nome);
show_message(global.dinheiro)
if(_index>=0 and global.dinheiro >= _missao[_index].custo){
global.dinheiro -= _missao[_index].custo;
_missao_comprada_array.missao_set(_missao[_index].nome,_missao[_index].descricao,_missao[_index].requisito_heroi_numero,_missao[_index].custo,_missao[_index].desenhar);
missao_remove(_index);
show_message(global.dinheiro)
}

}

}

