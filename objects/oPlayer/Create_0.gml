
/// @desc oPlayer - Create

accInc = 0.5;
brakeInc = 0.7;
gravInc = 0.01;
maxSpd = 10;

function Vector(_x,_y) constructor {
	
	x = _x;
	y = _y;
	
	static add = function(_pos2){
		x += _pos2.x;
		y += _pos2.y;
	};
	
}

plrPos = new Vector(x,y);
vel = new Vector(0,0);
grav = new Vector(0,0);
jump = new Vector(0,0);
keyDir = {x: undefined, y: undefined};


function getInput() {
	keyUp = keyboard_check(ord("W"));
	keyDn = keyboard_check(ord("S"));
	keyLt = keyboard_check(ord("A"));
	keyRt = keyboard_check(ord("D"));
	keyJump = keyboard_check_pressed(vk_space);
	
	keyDir.x = keyRt - keyLt
	keyDir.y = keyDn - keyUp
}

function moveX(){
	move("x");
}

function moveY () {
	move("y");
}


function move (_dir) {
	var _spd = vel[_dir];
	if  (keyDir[_dir] == 0) {
		vel[_dir] -= sign(_spd) * brakeInc;
		if abs(_spd) < 0{
			_spd = 0;	
		}
	}
	else {
		
		
		if (_spd > maxSpd) {
			_spd = maxSpd;
		}
		else {
			var _acc = accInc * keyDir[_dir];
			_spd += _acc;
		}
	}

	vel[_dir] = _spd;
}
	

function moveDir(_keyDir) {
	var _vel = vel[_dirXY];
	if _dir == 0 {
		vel.x -= sign(_vel) * brakeInc;
		if abs(_vel) < 0{
			_vel = 0;	
		}
	}
	else {
		var _hacc = accInc * _dir;
		if _vel > maxSpd{
			_vel = maxSpd;
		}
		else {
			_vel += _hacc;
		}
	}

	vel.x = _vel;
}


function jumpCalc(_x,_nextY){

	if place_meeting(_x,_nextY,oWall){
		
		if keyJump {
			jump.y = -0.5;
		}
		else jump.y = 0;
	}
	
	
	vel.add(jump);
}


function gravCalc(_x,_nextY){
	
	if !place_meeting(_x,_nextY,oWall){
		grav.y += gravInc;
	}
	else{
		grav.y = 0;	
	}

	vel.add(grav);
	
}


function wallCollision(_xSpd,_ySpd,_axis,_axisSpd){

	if place_meeting(_xSpd,_ySpd,oWall){
		
		_axisSpd = 0;
	}
	
	return _axisSpd;
	
}


