/// correctDirection(targetAngle, currentAngle, turnSpeed)
var _dir, _speed, _cor,;
_dir = argument0;
_speed = argument2; //argument1 replaced direction
_cor = 0;

if (_dir >= argument1)
{
    if (abs(_dir - argument1) >= abs((360 - _dir) + argument1))
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
    if (abs(argument1 - _dir) >= abs((360 - argument1) + _dir))
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
    if (_dir != argument1)
    {
        argument1 += _cor;
        return argument1;
    }
    else
    {
        break;
    }
}
