// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Missao() constructor{
	
	

	_missao= [];
	_missao_comprada = [];
	_heroi_alocado_teste = [5,4,3,2,1,0,7,8]
	
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
	
	}
	
	missao_add_heroi = function(){
		//var _index = missao_comprada_find(_nome);
		
		_missao_comprada[0].heroi_alocado[0]={
		nome: "Fulano 0",
			classe: "Arqueiro",
			level: 1,
			rank: "E",
			forca: 10,
			velocidade: 11,
			inteligencia: 12,
			sorte: 13,
			salario: 20,
			sprite: spr_heroi
		
		};
_missao_comprada[0].heroi_alocado[1]={
		nome: "Fulano 1",
			classe: "Arqueiro",
			level: 1,
			rank: "E",
			forca: 10,
			velocidade: 11,
			inteligencia: 12,
			sorte: 13,
			salario: 20,
			sprite: spr_heroi
		
		};
		_missao_comprada[0].heroi_alocado[2]={
		nome: "Fulano 2",
			classe: "Arqueiro",
			level: 1,
			rank: "E",
			forca: 10,
			velocidade: 11,
			inteligencia: 12,
			sorte: 13,
			salario: 20,
			sprite: spr_heroi
		
		};
		_missao_comprada[0].heroi_alocado[3]={
		nome: "Fulano 3",
			classe: "Arqueiro",
			level: 1,
			rank: "E",
			forca: 10,
			velocidade: 11,
			inteligencia: 12,
			sorte: 13,
			salario: 20,
			sprite: spr_heroi
		
		};
		_missao_comprada[0].heroi_alocado[4]={
		nome: "Fulano 4",
			classe: "Arqueiro",
			level: 1,
			rank: "E",
			forca: 10,
			velocidade: 11,
			inteligencia: 12,
			sorte: 13,
			salario: 20,
			sprite: spr_heroi
		
		};
		_missao_comprada[0].heroi_alocado[5]={
		nome: "Fulano 4",
			classe: "Arqueiro",
			level: 1,
			rank: "E",
			forca: 10,
			velocidade: 11,
			inteligencia: 12,
			sorte: 13,
			salario: 20,
			sprite: spr_heroi
		
		};
	
	}
	
	missao_find = function (_nome){
		for (var i=0; i < array_length(_missao);i++){
			
			if(_nome == _missao[i].nome){
			return i;
			}
		
		}
	return -1;
	
	}
	
	missao_comprada_find = function (_nome){
		for (var i=0; i < array_length(_missao_comprada);i++){
			
			if(_nome == _missao_comprada[i].nome){
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

missao_comprada_get = function (){
return _missao_comprada;
}

missao_comprar = function (_nome,_missao_comprada_array){
var _index = missao_find(_nome);
show_message(global.dinheiro)
if(_index>=0 and global.dinheiro >= _missao[_index].custo){
global.dinheiro -= _missao[_index].custo;
_missao_comprada_array.missao_comprada_set(_missao[_index].nome,_missao[_index].descricao,_missao[_index].requisito_heroi_numero,_missao[_index].custo,_missao[_index].desenhar);
missao_remove(_index);
show_message(global.dinheiro)
}

}

}

