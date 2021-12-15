if (canDamage)
{
    xspeed = cos(degtorad(dir)) * 5;
    yspeed = -sin(degtorad(dir)) * 5 * sign(image_yscale); // The vertical speed was, for some reason, inverted, which is why I used a minus. Don't ask me what actually caused this behaviour
}

if (contactDamage == 1.5 && sprite_index == sprBassBullet)
{
    imageTimer++;
    if (imageTimer mod 2 == 0)
    {
        l = instance_create(xprevious + irandom_range(-2, 2), 
        yprevious + irandom_range(-2, 2), objSingleLoopEffect);
        l.sprite_index = sprDot;
        l.image_xscale = 2;
        l.image_yscale = 2;
        l.image_speed = 1/5;
        l.image_blend = make_color_rgb(152, 120, 248);
    }
}
// delete if shot upwards and 2 solids (or solid entities) sandwich it horizontally,
// and have close horizontal edges
var contactingSolid = ds_list_create(),
    contactingEntity = ds_list_create(),
    solidTracker = 0,
    entityTracker  = 0,
    sandwiched = false;

with (objSolid)
{
    if (place_meeting(x, y, other))
    {
        contactingSolid[solidTracker] = self;
        solidTracker++;
    }
}
if (solidTracker >= 2)
{
    if (abs(contactingSolid[0].bbox_right - 
    contactingSolid[1].bbox_left) <= 3 || abs(contactingSolid[0].bbox_left - 
    contactingSolid[1].bbox_right <= 3))
    {
        sandwiched = true;
    }
}

with (prtEntity)
{
    if (place_meeting(x, y, other) && isSolid == 1)
    {
        contactingEntity[entityTracker] = self;
        entityTracker++;
    }
}
if (entityTracker >= 2)
{
    if (abs(contactingEntity[0].bbox_right - 
    contactingEntity[1].bbox_left) <= 3 || abs(contactingEntity[0].bbox_left - 
    contactingEntity[1].bbox_right) <= 3)
    {
        sandwiched = true;
    }
}

if (solidTracker > 0 && entityTracker > 0)
{
    if (abs(contactingSolid[0].bbox_right - 
    contactingEntity[0].bbox_left) <= 3 || abs(contactingSolid[0].bbox_left - 
    contactingEntity[0].bbox_right) <= 3)
    {
        sandwiched = true;
    }
}
// delete if on the top part of a top solid
var inTop = instance_place(x, y, objTopSolid);

// delete if entirely inside solid if shot upwards
var sol = instance_place(x, y, objSolid);

// delete if inside solid entity
var solEnt = instance_place(x, y, prtEntity)

// BIG BOY IF STATEMENT
if (((checkSolid(0, 0) || (solEnt != noone && solEnt.isSolid == 1))
&& xspeed != 0) || (xspeed == 0 && (sandwiched || (sol != noone 
&& rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
sol.bbox_left, sol.bbox_top, sol.bbox_right, sol.bbox_bottom) == 1) ||
(solEnt != noone && solEnt.isSolid == 1 && 
rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
solEnt.bbox_left, solEnt.bbox_top, solEnt.bbox_right, solEnt.bbox_bottom) == 1)))
|| (yspeed > 0 && inTop != noone && bbox_top < inTop.y + 8))
{
    var xx = x, yy = y;
    if (xspeed == 0 && !sandwiched)
    {
        xx = xprevious;
        yy = yprevious;
    }
    f = instance_create(xx, yy, objSingleLoopEffect)
    f.sprite_index = sprBassBulletBreak;
    f.image_speed = 0.4;
    instance_destroy();
}
