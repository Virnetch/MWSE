-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- This event is raised just after determining which armor piece, if any, was hit with an attack. The slots can be modified, to draw focus onto specific armor slots.
--- 
--- The following table is used by default to determine what armor piece is hit:
--- 
--- Roll (1-100) | Slot            | Fallback
--- ------------ | --------------- | ---------------
--- 1-29         | Cuirass         | *None*
--- 30-34        | Shield          | Cuirass
--- 35-39        | Shield          | Left Pauldron
--- 40-49        | Left Pauldron   | *None*
--- 50-59        | Right Pauldron  | *None*
--- 60-69        | Greaves         | *None*
--- 70-79        | Helmet          | *None*
--- 80-89        | Boots           | *None*
--- 90-94        | Right Gauntlet  | Right Bracer
--- 95-100       | Left Gauntlet   | Left Bracer
--- @class calcArmorPieceHitEventData
--- @field claim boolean If set to `true`, any lower-priority event callbacks will be skipped. Returning `false` will set this to `true`.
--- @field attacker tes3reference *Read-only*. A shortcut to the attacker mobile's reference.
--- @field attackerMobile tes3mobileActor|tes3mobileCreature|tes3mobileNPC|tes3mobilePlayer *Read-only*. The mobile who is doing the hitting.
--- @field fallback number A secondary slot to check for equipment on, if no armor is found using the primary slot.
--- @field mobile tes3mobileActor|tes3mobileCreature|tes3mobileNPC|tes3mobilePlayer *Read-only*. The mobile who is being hit.
--- @field projectile tes3mobileProjectile|tes3mobileSpellProjectile|nil *Read-only*. The projectile used that is hitting the given reference. This is nil for all melee combat.
--- @field reference tes3reference *Read-only*. A shortcut to the mobile's reference.
--- @field slot number The primary slot that is targeted.
