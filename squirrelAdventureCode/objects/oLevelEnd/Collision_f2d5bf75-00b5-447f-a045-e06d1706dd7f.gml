/// @description Move to next room
// You can write your code in this editor
with(objSquirrel){
	if(hascontrol){
		hascontrol = false; 
		SlideTransition(TRANS_MODE.GOTO, other.target);	//other is instance that called the object
	}
}