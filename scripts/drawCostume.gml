/// drawCostume(costume, sheetX, sheetY, x, y, xscale, yscale, colBase, colPrimary, colSecondary, colOutline, [alphaBase = 1, alphaPrimary = 1, alphaSecondary = 1, alphaOutline = 1])
// draws the given costume (player skin) at the given coordinates with the given palette.
// costume: sprite index of costume (e.g. objMegaman)
// sheetX, sheetY: coord (in 48x48 units) of the animation frame in the skin sheet.
// colBase: blend mode to use for the base colour (leave as c_white)
// colPrimary, colSecondary, colOutline: palette colours
// [alphaBase, alphaPrimary, alphaSecondary, alphaOutline] (optional): alpha values for palette (0-1)

var costume = argument[0],
    sheetX = floor(argument[1]),
    sheetY = floor(argument[2]),
    _x = argument[3],
    _y = argument[4],
    _xscale = argument[5],
    _yscale = argument[6],
    col,
    alpha;

// palette
for (var i = 0; i < 4; i++)
{
    col[i] = argument[7 + i];
    if (argument_count > 11 + i)
        alpha[i] = argument[11 + i];
    else
        alpha[i] = 1;
}

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

var dCol = col;

var _l = ((SquareSize + 1) * sheetX) + off;
var _t = ((SquareSize + 1) * sheetY) + off;
var _wh = SquareSize - (off * 2);

_x -= (_wh * 0.5 * _xscale);
_y -= (((_wh * 0.5) - 4) * _yscale);

for (var _i = 0; _i < 4; _i ++;)
{
    draw_sprite_part_ext(costume, _i, _l, _t, _wh, _wh, _x, _y, _xscale, _yscale, dCol[_i], alpha[_i]);
}
