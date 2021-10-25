if (canDamage)
{
    xspeed = cos(degtorad(dir)) * 5;
    yspeed = -sin(degtorad(dir)) * 5 * sign(image_yscale); // The vertical speed was, for some reason, inverted, which is why I used a minus. Don't ask me what actually caused this behaviour
}
var contactingObjectList = ds_list_create();
var listTracker = 0;
with (objSolid)
{
    if (place_meeting(x, y, other))
    {
        contactingObjectList[listTracker] = self;
        listTracker++;
    }
}
var inTop = instance_place(x, y, objTopSolid);
var sol = instance_place(x, y, objSolid);
if ((checkSolid(0, 0) && xspeed != 0) || 
(xspeed == 0 && (sol != noone 
&& (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
sol.bbox_left, sol.bbox_top, sol.bbox_right, sol.bbox_bottom)) == 1
|| listTracker >= 2)) ||
(yspeed > 0 && inTop != noone && bbox_top < inTop.y + 8))
{
    var xx = x, yy = y;
    if (xspeed == 0 && listTracker < 2)
    {
        xx = xprevious;
        yy = yprevious;
    }
    f = instance_create(xx, yy, objSingleLoopEffect)
    f.sprite_index = sprBassBulletBreak;
    f.image_speed = 0.4;
    instance_destroy();
}
