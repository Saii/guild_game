/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

num_herois=0;
max_herois=0;
dinheiro=0;

desenha_status = function (){
draw_text(x,y-150,"Numero de herois" +"  " + string(num_herois))
draw_text(x,y-170,"Dinheiro" +"  " + string(dinheiro))

}

acessar_guilda = function (){

if (mouse_check_button_released(mb_left) and position_meeting(mouse_x,mouse_y,obj_guilda)){
show_message("Acessou a guilda")
desenha_janela_geral_guilda();
}

}

desenha_janela_geral_guilda = function (){



}