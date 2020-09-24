if (canDamage)
{
    xspeed = cos(degtorad(dir)) * 5;
    yspeed = -sin(degtorad(dir)) * 5 * sign(image_yscale); // The vertical speed was, for some reason, inverted, which is why I used a minus. Don't ask me what actually caused this behaviour
}
if (checkSolid(0, 0))
{
    f = instance_create(x, y, objSingleLoopEffect);
    f.sprite_index = sprShine;
    f.image_speed = .5;
    instance_destroy();
}
