/// @description Insert description here
// You can write your code in this editor
if (done == 0){
	vsp = vsp+grv;
	if(place_meeting(x+hsp,y,objWall)){
		while(!place_meeting(x+sign(hsp),y,objWall)){
			x=x+sign(hsp);	
		}
		hsp = 0;
	}
	x=x+hsp;
	
	if(place_meeting(x,y+vsp,objWall)){
		if (vsp>0){
			done = 1;
			image_index = 0;
			alarm[0]=60;
		}
		while(!place_meeting(x,y+sign(vsp),objWall)){
			y=y+sign(vsp);
		}
		vsp= 0;
	}
	y=y+vsp;
}
