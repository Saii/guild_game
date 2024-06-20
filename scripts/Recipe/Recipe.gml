// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Recipe(): Inventory() constructor{

_receitas =[]

encontrar_receitas =function(_nome){
	
	for(var i=0; i<array_length(_receitas);i++){
		if(_nome == _receitas.nome){
			return i;
		}
	}
	return -1;
}

adicionar_receitas = function(_nome,_requisitos,_produtos,_sprite){
	array_push(_receitas,{
		nome: _nome,
		requisitos: _requisitos,
		produtos: _produtos,
		sprite: _sprite
	
	
	});
}

receita_tem = function(_nome){
	var index = encontrar_receitas(_nome);
	var pode_craftar=false;
	
	if(index >=0){
		pode_craftar =true
	for( var requisitos_index =0; requisitos_index <array_length(_receitas[index].requisitos); requisitos_index++ ){
		if (item_has(_receitas[index].requisitos[requisitos_index].nome,_receitas[index].requisitos[requisitos_index].quantidade)==false){
			pode_craftar = false;
			break;
		
		}
	
	
	}

}
return pode_craftar;
}

receita_craftar = function(_nome){
var index = encontrar_receitas(_nome);

if( index >= 0){
	if (receita_tem(_nome)){
		for( var requisitos_index =0; requisitos_index <array_length(_receitas[index].requisitos); requisitos_index++ ){
		item_subtract(_receitas[index].requisitos[requisitos_index].nome,_receitas[index].requisitos[requisitos_index].quantidade)

	}

}
}
}



}