//THE ACTUAL STEP EVENT
xDir = -sign(global.keyLeft[playerID]) + sign(global.keyRight[playerID]);
yDir = -sign(global.keyUp[playerID]) + sign(global.keyDown[playerID]);

if (!global.frozen && !frozen)
{
    playerStep(); // General step event code
    
    if (!playerIsLocked(PL_LOCK_PHYSICS))
    {
        var iscl = image_xscale;
        image_xscale=1;//Ensure a symmetrical mask
        event_inherited(); // General prtEntity code
        image_xscale=iscl;
        playerMovement();
    }
    
    // Shooting
    if (instance_exists(statusObject))
    {
        if (statusObject.statusCanShoot)
        {
            playerHandleShoot();
        }
    }
    else
    {
        playerHandleShoot();
    }
    
    // Quick weapon switching
    playerSwitchWeapons();
    
    // Handle the sprites
    playerHandleSprites('Normal');
    
    // Moving from one section to the next, if possible
    playerSwitchSections();
    
    // Recover from mm1 stun
    playerHandleStun();
}
