
/// @desc oPlayer - Step


////Movement

getInput();

//Calculating x spd 
moveX();

//Calculating y spd
gravCalc(x,y + spd.y);

//Wall collisions
var _wallCollideX = wallCollision(x + spd.x,y,x,spd.x);
var _wallCollideY = wallCollision(x,y + spd.y,y,spd.y);

spd.x = _wallCollideX;
spd.y = _wallCollideY;

//Jumping
jumpCalc(x,y + grav.y);

plrPos.Add(spd);

x = plrPos.x;
y = plrPos.y;

