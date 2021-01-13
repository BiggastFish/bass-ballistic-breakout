if (!instance_exists(vehicle))
{
    if (ycoll * gravDir > 0)
    {
        if (playLandSound > 2 && !isHit && !climbing)
        {
            playSFX(sfxLand);
        }
    }
}

// Stop movement at section borders (horizontal)
var xdis = x - (view_xview + ((view_wview * 0.5)));
var xpos = (view_wview * 0.5)-6;

if (abs(xdis) > xpos)
{
    if ((xdis >= 0 && (!place_meeting(x, y, objSectionArrowRight) || global.lockTransition))
        || (xdis < 0 && (!place_meeting(x, y, objSectionArrowLeft) || global.lockTransition)))
    {
        x = view_xview + (view_wview * 0.5) + xpos * sign(xdis);
        xspeed = 0;
        
        if (position_meeting(x,y,objSolid) && blockCollision)
        {
            global.playerHealth[playerID] = 0;
        }
    }
}


// stop movement at section borders (vertical)
var ydis = y - (view_yview + (view_hview * 0.5));
var ypos = (view_hview * 0.5) + 32;

if (ydis * gravDir < -ypos)
{
    y = view_yview + (view_hview * 0.5) + ypos * sign(ydis);
}
else if (dieToPit)
{
    if (ydis * gravDir > ypos - 16)
    {
        if ((gravDir >= 0 && !position_meeting(x, y - 8, objSectionArrowDown))
            || (gravDir < 0 && !place_meeting(x, y + 8, objSectionArrowUp)))
        {
            if (!global.pitBehavior || 
            global.pitBehavior == 1 && global.playerHealth[playerID] <= 14 ||
            global.pitBehavior == 2 && global.playerHealth[playerID] <= 7)
            {
                global.playerHealth[playerID] = 0;
                deathByPit = true;
            }
            else
            {
                deleteWeaponObject();
                playSFX(sfxHit);
                global.playerHealth[playerID]-= 7 + ((global.pitBehavior == 1) * 7);
                canMinJump = false;
                y-= 8 * gravDir;
                yspeed = -8 * gravDir;
                jumpCounter = 1;
                iFrames = 30;
            }
        }
    }
}

// Handling of masks to make sure nothing breaks
if (!isSlide && (mask_index == firstSlideMask || mask_index == secondSlideMask))
{
    mask_index = mskMegaman;
}
