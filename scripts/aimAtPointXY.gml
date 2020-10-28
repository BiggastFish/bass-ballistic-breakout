/// aimAtPointXY(speed,ox,oy,tx,ty)
// argument0 - speed to use
// argument1 - x to aim from
// argument2 - y to aim from
// argument3 - x to aim at
// argument4 - y to aim at

var angle;
angle = point_direction(argument1, argument2, argument3, argument4);

xspeed = cos(degtorad(angle)) * argument0;
yspeed = -sin(degtorad(angle)) * argument0;
