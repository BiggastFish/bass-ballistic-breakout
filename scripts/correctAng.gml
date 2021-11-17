/// correctAng(targetAngle, currentAngle, turnSpeed)
var _dir, _speed, _cor;
_dir = argument0;
_curr = argument1;
_speed = min(argument2, abs(argument1 - argument0));
_cor = 0;

if (_dir >= _curr)
{
    if (abs(_dir - _curr) >= abs((360 - _dir) + _curr))
    {
        _cor = -1;
    }
    else
    {
        _cor = 1;
    }
}
else
{
    if (abs(_curr - _dir) >= abs((360 - _curr) + _dir))
    {
        _cor = 1;
    }
    else
    {
        _cor = -1;
    }
}

repeat (_speed)
{
    if (_dir != _curr)
    {
        _curr+= _cor;
    }
    else
    {
        break;
    }
}

return wrapAngle(_curr);
