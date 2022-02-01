/// playerJump()
// causes this player instance to jump

// We can jump-cancel the throwing animation
shootStandStillLock = lockPoolRelease(shootStandStillLock);

if (jumpCounter == 0 || (coyoteTime > 4 && jumpCounter == 1 &&
((yspeed > 0 && gravDir > 0) || (yspeed < 0 && gravDir < 0))))
    jumpCounter += 1;

yspeed = (jumpSpeed + jumpSpeedWater * (inWater > 0)) * -gravDir;
ground = false;

// change this so that you have to press jump to do a min jump
canMinJump = true;

if (jumpCounter > 1 && multiJumpDashCancel == true)
{
    playSFX(sfxChillShoot);
    j = instance_create(x, y + (abs(y - bbox_bottom) - 2) * sign(image_yscale), 
    objSingleLoopEffect);
    j.sprite_index = sprBassJumpPoof;
    j.image_speed = 0.5;
    j.depth = depth + 2;
    dashJumped = false;
    with (objJumpBlockHandler)
    {
        playSFX(sfxSidewayElevatorButton);
        active = !active;
    }
}
