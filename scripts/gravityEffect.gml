/// gravityEffect()
// Applies gravity only if we are not on the ground

if (!ground)
{
    var waterGrav;
    waterGrav = grav * waterAccelMod;
    
    if (object_index == objMegaman)
    {
        grav = (gravAccel * gravfactor * gravDir) * !playerIsLocked(PL_LOCK_GRAVITY);
        waterGrav = (gravWater * gravfactor * gravDir) * !playerIsLocked(PL_LOCK_GRAVITY);
    }
    
    if (inWater)
    {
        yspeed += waterGrav;
        if (yspeed * sign(grav) > maxWaterGrav)
        {
            yspeed = maxWaterGrav * sign(grav);
        }
    }
    else
    {
        yspeed += grav;
        if (yspeed * sign(grav) > maxGrav)
        {
            yspeed = maxGrav * sign(grav);
        }
    }
    
    
}
