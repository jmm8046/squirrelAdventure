// Get player input

if (hascontrol) {
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_jump = keyboard_check_pressed(vk_space);
}else{
	key_left= 0;
	key_right = 0;
	key_jump = 0;
}

//if (place_meeting(x,y,oFlag)){
	//draw_text(x,y,"Congrats,you won!");
	//draw_set_color(c_black);
//}
//calculate movement
var move = key_right - key_left;

hsp = move*walksp;
vsp = vsp+grv;

//jumping height (change vsp)
if (place_meeting(x,y+1,objWall) && key_jump){
	vsp=-7;
		
}

if(key_jump && (place_meeting(x+1,y,objWall) || place_meeting(x-1,y,objWall))){
	vsp =-7;	
}
//horizontal collision
if (place_meeting(x+hsp,y,objWall)) {
	while(!place_meeting(x+sign(hsp),y,objWall)) {
		x = x + sign(hsp);	
	}
	hsp = 0;
}
x = x+hsp;

//vertical collision
if (place_meeting(x,y+vsp,objWall)) {
	while(!place_meeting(x,y+sign(vsp),objWall)) {
		y = y + sign(vsp);	
	}
	vsp = 0;
}
y = y+vsp;

//Animations
//positive y direction (sign(vsp)) is down and negatvie y direction is up
//frame index starts at zero
if(!place_meeting(x,y+1,objWall)){
		sprite_index=squirrelJumping;
		image_speed = 0;
		if (sign(vsp)>0) {
			sprite_index = squirrelJumping; 
			image_speed = 0;
			image_index = 1;
		}else {image_index = 0;}
	
} else {	
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = squirrelSitting;

	}
	else {
		sprite_index = squirrelRunning;	
	}
}
//if negative it will flip the sprite, if more than 1 it will horizontally squish sprite
//sign hsp is pos when right and neg when moving left
if (hsp !=0) image_xscale =sign(hsp);