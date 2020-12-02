  // setScreenSize(screenSize, [shift])
// argument0: screen size
// argument1: shift screen to centre? default: true

var ns = argument[0];
var shift = true;
if (argument_count > 1)
{
    shift = argument[1];
}

var xsize, ysize, s, full;

xsize = global.screenWidth;
ysize = global.screenHeight;

// remember the last resolution
global.prevscreensize = global.screensize;

s = max(1, floor(min(ns, display_get_width() / xsize, display_get_height() / ysize)));

full = ns > s;
    
window_set_fullscreen(full);

if (!full)
{
    xsize *= s;
    ysize *= s;

    window_set_size(xsize, ysize);
    window_set_cursor(cr_default);
    
    if (shift)
    {
        window_set_position(
            floor((display_get_width() - xsize) / 2),
            floor((display_get_height() - ysize) / 2));
    }
}
else
{
    window_set_cursor(cr_none);
}

global.screensize = s;

if (!global.resolution)
{
    s = 1;
}

global.screenscale = max(1, global.screensize * global.resolution);

surface_resize(application_surface, view_wview[0] * s, view_hview[0] * s);
