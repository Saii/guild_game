/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

num_moradores=5;
max_moradores=10;
imposto=0.1;
renda= num_moradores* imposto;
casa_construida = false;
custo_level1= 10;
custo_level2=50;
custo_level3=100;
custo_level4=500;
desenhar= false;
level = 0;

atualizar_imposto = function (_novoimposto){
imposto = _novoimposto;
return imposto
}

construir_casa = function (){

if(global.dinheiro>custo_level1){
level = 1
global.dinheiro -= custo_level1;

show_message("O level eh " + string(level));
show_message(global.dinheiro);

}



}

//A evolução da casa é para aumentar o numero maximo
// de trabalhadores e o imposto

evoluir_casa = function (){
max_moradores++
imposto++

}

aumentar_moradores = function (){

if(num_moradores <=max_moradores){
num_moradores++

}  }

diminuir_moradores = function (){
	
	if(num_moradores>0){
			num_moradores--;
	
	}

}

state = function(){

switch (level){
	
	case 0:
	construir_casa();
	break;
	
	case 1:
	
	break;
	
	
	


}


}