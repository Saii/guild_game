function draw_reset(){
	draw_set(c_white, 1);
}

function draw_set(_color = c_white, _alpha = 1){
	draw_set_color(_color);
	draw_set_alpha(_alpha);
}

function is_between(_value, _min, _max){
	return _value >= _min && _value <= _max;
}

function text_align(halign = fa_left, valign = fa_middle) {
	draw_set_halign(halign);
	draw_set_valign(valign);
}