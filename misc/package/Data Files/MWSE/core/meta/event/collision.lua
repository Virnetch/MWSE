-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- This event is triggered on a collision and all the frames during the collision.
---
--- [Examples available in online documentation](https://mwse.github.io/MWSE/events/collision).
--- @class collisionEventData
--- @field claim boolean If set to `true`, any lower-priority event callbacks will be skipped. Returning `false` will set this to `true`.
--- @field mobile tes3mobileCreature|tes3mobileNPC|tes3mobileObject|tes3mobilePlayer|tes3mobileProjectile|tes3mobileSpellProjectile *Read-only*. Mobile object which collided with its target reference.
--- @field reference tes3reference *Read-only*. Mobile object's associated reference.
--- @field target tes3reference *Read-only*. Reference which mobile object has collided with.
