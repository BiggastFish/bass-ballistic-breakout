/// playerHandleJumping();

if (!playerIsLocked(PL_LOCK_JUMP))
{
    if (ground)
    {
        coyoteTime = 0;
        jumpCounter = 0;
        dashJumped = false;
    }
    else
    {
        coyoteTime++;
        var doDash = (global.keySlidePressed[playerID] && global.dashBehavior != 1) 
        || (global.dashBehavior && (global.keyLeftPressed[playerID] || global.keyRightPressed[playerID]) 
        && xDir != 0 && dashTimer > 20);
        if (coyoteTime < 4 && doDash && !dashJumped
        && jumpCounter == 1 && !climbing)
        {
            with (instance_create(x + (abs(x - bbox_right) - 14) * sign(image_xscale), 
            y + (abs(y - bbox_bottom) - 2) * sign(image_yscale), objSlideDust))
            {
                image_xscale = other.image_xscale;
            }
            playSFX(sfxDash);
            dashJumped = 1;
        }
    }
    if (global.keyJumpPressed[playerID])
    {
        if (ground || jumpCounter < jumpCounterMax)
        {
            playerJump();
        }
    }
    else if (!global.keyJump[playerID]) // Minjumping (lowering jump when the jump button is released)
    {
        if (yspeed * gravDir < 0 && canMinJump)
        {
            canMinJump = false;
            yspeed = 0;
        }
    }
}
