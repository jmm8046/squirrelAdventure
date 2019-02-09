/// @description Insert description here
// You can write your code in this editor

menu_x +=(menu_x_target - menu_x) / menu_speed;

if(menu_control){
	if(keyboard_check_pressed(vk_up)){
		menu_cursor++;
		if(menu_cursor>= menu_items) menu_cursor=0;
	}
	if(keyboard_check_pressed(vk_down)){
		menu_cursor--;
		if(menu_cursor< 0) menu_cursor=menu_items-1;	//indec starts at 0
	}
	if(keyboard_check_pressed(vk_enter)){
		menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		menu_control = false;
	}
}
if (menu_x>gui_width+150) && (menu_committed!=-1){
	switch(menu_committed){
		case 1: default:SlideTransition(TRANS_MODE.GOTO,room0);break;	//MIGHT NEED TO CHANGE THIS
		//case 1
		case 0: game_end(); break;
		//case 0: SlideTransition(TRANS_MODE.GOTO,roomInstructions); break;
		
	}
}