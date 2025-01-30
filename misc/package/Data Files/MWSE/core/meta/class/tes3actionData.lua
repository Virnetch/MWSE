-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- A substructure of mobile actors that provides information about the current or previous action.
---
--- [Examples available in online documentation](https://mwse.github.io/MWSE/types/tes3actionData).
--- @class tes3actionData
--- @field aiBehaviorState tes3.aiBehaviorState The behavior state. This maps to values in [`tes3.aiBehaviorState`](https://mwse.github.io/MWSE/references/ai-behavior-states/) namespace.
--- @field aiPackageCount number The number of AI packages available.
--- @field animationAttackState tes3.animationState The actor's animation state. Maps to values in [`tes3.animationState`](https://mwse.github.io/MWSE/references/animation-states/) namespace.
--- @field animGroupBlocking number The animation group when blocking.
--- @field animGroupCurrentAction number The animation group for the current action.
--- @field animGroupStunEffect number The animation group for when stunned.
--- @field animSectionCurrentAction number The animation section for the current action.
--- @field attackSwing number When attacking, this value represents how much the weapon has been pulled back. The value ranges from [0.0 - 1.0].
--- @field attackWasBlocked boolean A flag that indicates if an attack failed its block check on the initial attack swing, and should be blocked if it connects. May be modified before the strike hits to cause the attack to be blocked. This flag negates damage even if no shield is equipped, so you should check if a shield is present before setting it.
--- @field blockingState number A state index that indicates an actor's blocking state. It is zero when not blocking and non-zero when blocking. A value of 1 indicates a state transition from non-blocking to blocking, while a value of 2 means blocking is active (where the block animation is currently playing and should not be interrupted). The action simulation will reset the value to 0 at the end of a block animation.
--- @field currentAnimationGroup tes3.animationGroup Actor's current animation group. Maps to values in [`tes3.animationGroup`](https://mwse.github.io/MWSE/references/animation-groups/) namespace.
--- @field dispositionCombatChange number The disposition modifier for combat.
--- @field fightCombatChange number The fight modifier for combat.
--- @field hitTarget tes3mobileActor|tes3mobileCreature|tes3mobileNPC|tes3mobilePlayer|nil The actor's attack target. The target will be saved in `hitTarget` field until a new attack is made. Missing an attack will clear `hitTarget` field.
--- @field lastBarterHoursPassed number A 16-bit hourstamp of the last time a merchant's barter gold was at its base level. It is used as a timer for resetting barter gold, which happens on interacting with a merchant at hourstamp `lastBarterHoursPassed + GMST fBarterGoldResetDelay` or later. Barter gold can also reset when a mobile expires.
--- @field lastPositionBeforeCombat tes3vector3 When an actor enters combat, the last position is stored here so that they can navigate back after combat.
--- @field lastWitnessedCrimeTimestamp number The game timestamp for when the mobile last witnessed a crime.
--- @field nockedProjectile tes3mobileProjectile|tes3mobileSpellProjectile The currently nocked projectile the associated actor is using. It is available while charging a projectile attack, before releasing the projectile. This can be modified, but can only be set to nil, which will remove the projectile without consuming ammo.
--- @field physicalAttackType tes3.physicalAttackType A number from the [`tes3.physicalAttackType`](https://mwse.github.io/MWSE/references/physical-attack-types/) enumeration identifying the physical attack type. Can be `tes3.physicalAttackType.slash`, `.chop`, `.thrust`, `.projectile`, `.creature1`, `.creature2`, or `.creature3.`
--- 
--- Proper time to change the attack direction is the [attackStart](https://mwse.github.io/MWSE/events/attackStart/) event. See the example below to see how.
--- @field physicalDamage number When attacking, this is the value of the weapon damage that was rolled. This value takes into account the actor's strength, attack swing and weapon condition, but it doesn't include difficulty nor target's armor. This value is updated on an attack. After the attack this value will still contain the damage rolled. It will be refreshed on a new attack.
--- @field quantizedHitAngleX number The last hit angle.
--- @field quantizedHitAngleY number The last hit angle.
--- @field quantizedHitAngleZ number The last hit angle.
--- @field rescaledFacingBeforeCombat number The last facing used before combat.
--- @field stolenFrom tes3activator|tes3alchemy|tes3apparatus|tes3armor|tes3bodyPart|tes3book|tes3clothing|tes3container|tes3containerInstance|tes3creature|tes3creatureInstance|tes3door|tes3enchantment|tes3ingredient|tes3leveledCreature|tes3leveledItem|tes3light|tes3lockpick|tes3misc|tes3npc|tes3npcInstance|tes3object|tes3probe|tes3reference|tes3repairTool|tes3spell|tes3static|tes3weapon No description yet available.
--- @field target tes3mobileActor|tes3mobileCreature|tes3mobileNPC|tes3mobilePlayer|nil The actor's attack target, stored until the actor attacks successfully again. In contrast to `hitTarget`, `target` property isn't cleared on missed attack.
--- @field walkDestination tes3vector3 If moving to a location, this is the position to be walked to.
