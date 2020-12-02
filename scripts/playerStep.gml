/// playerStep()
// Handles general step event code for the player

xDir = -sign(global.keyLeft[playerID]) + sign(global.keyRight[playerID]);
yDir = -sign(global.keyUp[playerID]) + sign(global.keyDown[playerID]);

if (!playerIsLocked(PL_LOCK_PHYSICS))
{
    playLandSound += 1;
    
    checkGround();

    if trebleBoostCoolDown
    {
        trebleBoostCoolDown--;
    }

    if ladderJumped
    {
        if ground
        {
            ladderJumped = 0;
        }
    }

    playerHandleMovement();
    
    if (instance_exists(statusObject))
    {
        if (statusObject.statusCanJump)
        {
            playerHandleJumping();
        }
        if (statusObject.statusCanClimb)
        {
            playerHandleClimbing();
        }
    }
    else
    {
        playerHandleJumping();
        playerHandleClimbing();
    }
    
    playerHandleSliding();
}

playerHandleFrozen();

playerHandleHit();
