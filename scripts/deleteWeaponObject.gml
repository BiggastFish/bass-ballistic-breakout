// deletes weapon objects that locks certain move pools

with (objTrebleBoost) || (objKnuckleSandwich) || (objCrescentKick) || (objRisingKick)
    instance_destroy();
