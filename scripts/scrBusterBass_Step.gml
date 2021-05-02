if (canDamage)
{
    xspeed = cos(degtorad(dir)) * 5;
    yspeed = -sin(degtorad(dir)) * 5 * sign(image_yscale); // The vertical speed was, for some reason, inverted, which is why I used a minus. Don't ask me what actually caused this behaviour
}
var inTop = instance_place(x, y, objTopSolid);
if (checkSolid(0, 0) || 
(yspeed > 0 && inTop != noone && bbox_top < inTop.y + 8))
{
    f = instance_create(x, y, objSingleLoopEffect)
    f.sprite_index = sprBassBulletBreak;
    f.image_speed = 0.4;
    instance_destroy();
}
