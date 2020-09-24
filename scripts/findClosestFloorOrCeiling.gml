///findClosestFloorOrCeiling(width, start_y, ceiling?)
// tries to find the closest floor/ceiling (only checks objSolids!!)
// returns the y-position of the result
//
// width - the width of the rectangle to use for the check
// start_y - represents our starting altitude
// ceiling? - true: finding a ceiling, false: finding a floor

var width = argument0,
    start_y = argument1,
    findCeiling = argument2;
    
// Find the max bound
var result = global.sectionTop;
if (!findCeiling)
    result = global.sectionBottom;
    
// Construct the collision rectangle
var sx, sy, tx, ty;
    sx = x - (width * .5);
    tx = x + (width * .5);
if (findCeiling) {
    sy = global.sectionTop;
    ty = bbox_top;
} else {
    sy = bbox_bottom;
    ty = global.sectionBottom;
}

//Now, let's find some solids
with (collision_rectangle(sx, sy, tx, ty, objSolid, false, true)) {
    if (findCeiling && bbox_bottom > result)
        result = bbox_bottom;
    else if (!findCeiling && bbox_top < result)
        result = bbox_top;
}

return result;
