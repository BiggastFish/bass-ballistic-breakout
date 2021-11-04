var bulletLimit = 4;
var weaponCost = 0;
var action = 1; // 0 - no frame; 1 - shoot; 2 - throw; 3 - upwards aim; 4 - upwards diagonal aim; 5 - downwards diagonal aim;
var xOffset = 25;
var yOffset = 0;
var willStop = 1; // If this is 1, the player will halt on shooting ala Metal Blade.

//setting the actual action here
if (yDir == -1 && xDir == 0)
{
    action = 3;
    xOffset = 5; // 5
    yOffset = -17;
}
else if (yDir == -1 && xDir != 0)
{ 
    action = 4;
    xOffset = 19;
    yOffset = -13;
    if (climbing)
    {
        xOffset = 16;
        yOffset = -12;
    }
}
else if (yDir)
{
    action = 5;
    xOffset = 20;
    yOffset = 12;
    if (climbing)
    {
        xOffset = 17;
        yOffset = 11;
    }
}
if (!global.lockBuster)
{
    if (global.autoFire)
    {
        if (global.keyShootPressed[playerID])
        {
            fireHeld = !fireHeld;
        }
        if (xDir != 0 || yDir != 0)
        {
            busterDir = action;
        }
        switch (busterDir)
        {
            case 1:
                xDir = image_xscale;
                yDir = 0;
                break;
            case 3:
                xDir = 0;
                yDir = -1;
                xOffset = 5;
                yOffset = -16;
                break;
            case 4:
                xDir = image_xscale;
                yDir = -1;
                xOffset = 20;
                yOffset = -12;
                if (climbing)
                {
                    xOffset = 17;
                    yOffset = -11;
                }
                break;
            case 5:
                xDir = image_xscale;
                yDir = 1;
                xOffset = 20;
                yOffset = 12;
                if (climbing)
                {
                    xOffset = 17;
                    yOffset = 11;
                }
                break;
        }
    }
    if (((global.keyShoot[playerID] && !global.autoFire) 
    || (fireHeld))
    && !playerIsLocked(PL_LOCK_SHOOT))
    {
        isShoot = action;
        shootStandStillLock = lockPoolRelease(shootStandStillLock);
        if (ground)
        {
            xspeed = 0;
            shootStandStillLock = lockPoolLock(localPlayerLock[PL_LOCK_MOVE]);
        }

        if shootTimer < 8
        {
            if shootTimer < 1
            {
                shootTimer = 1;
            }
            else
            {
                shootTimer++
                exit;
            }
        }
        i = fireWeapon(xOffset, yOffset, objBusterShot, bulletLimit, weaponCost, action, willStop);
        if (global.autoFire)
        {
            isShoot = busterDir;
        }
        else
        {
            isShoot = action;
        }
        if shootTimer >= 14 //making sure it doesn't release the lock until it stops being held
        {
            shootTimer = 14;
        }
        if (i)
        {
            i.image_index = action - (1 + (action > 1));
            i.sprite_index = sprBassBullet;
            i.checkForTopSolid = false // boolean, actually destroyed on top-solids when moving downwards; handled in Step
            i.dir = 0;
            i.contactDamage = 1 + ((dashJumped && !ground) * 0.5);

            if (image_xscale < 0)
            {
                i.dir += 180;
            }

            if (yDir != 0)
            {
                i.dir -= (yDir * 90) * image_xscale;
                if (xDir != 0 || yDir == 1)
                {
                    i.dir += (yDir * 45) * image_xscale;
                }
            }
        }
    }
}
