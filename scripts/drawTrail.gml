/// drawTrail(costume, sheetX, sheetY, x, y, xscale, yscale, colBlend)
// draws a trail based on the player skin at the given coordinates with the given palette.
// costume: sprite index of costume (e.g. objMegaman)
// sheetX, sheetY: coord (in 48x48 units) of the animation frame in the skin sheet.

var costume = argument[0],
    sheetX = floor(argument[1]),
    sheetY = floor(argument[2]),
    _x = argument[3],
    _y = argument[4],
    _xscale = argument[5],
    _yscale = argument[6],
    _dCol = argument[7];

/*var SquareSize = 48;

for (var i = 0; i < 4; i += 1)
{
    draw_sprite_part_ext(costume, i,
        1 + (floor(sheetX) * (SquareSize + 3)),
        1 + (floor(sheetY) * (SquareSize + 3)), SquareSize,
        SquareSize, round(_x) - (24 * _xscale),
        round(_y) - (20 * _yscale), _xscale, _yscale,
        col[i], alpha[i]);
}*/

var SquareSize = 50;
var off = 2;

var _l = ((SquareSize + 1) * sheetX) + off;
var _t = ((SquareSize + 1) * sheetY) + off;
var _wh = SquareSize - (off * 2);

_x -= (_wh * 0.5 * _xscale);
_y -= (((_wh * 0.5) - 4) * _yscale);

draw_sprite_part_ext(costume, 4, _l, _t, _wh, _wh, _x, _y, _xscale, _yscale, _dCol, image_alpha);
