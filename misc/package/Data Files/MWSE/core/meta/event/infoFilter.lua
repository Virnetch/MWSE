-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- This event fires when a dialogue info object is filtered. This allows blocking dialogue lines from showing up.
---
--- [Examples available in online documentation](https://mwse.github.io/MWSE/events/infoFilter).
--- @class infoFilterEventData
--- @field claim boolean If set to `true`, any lower-priority event callbacks will be skipped. Returning `false` will set this to `true`.
--- @field actor tes3activator|tes3alchemy|tes3apparatus|tes3armor|tes3bodyPart|tes3book|tes3clothing|tes3container|tes3containerInstance|tes3creature|tes3creatureInstance|tes3door|tes3enchantment|tes3ingredient|tes3leveledCreature|tes3leveledItem|tes3light|tes3lockpick|tes3misc|tes3npc|tes3npcInstance|tes3object|tes3probe|tes3reference|tes3repairTool|tes3spell|tes3static|tes3weapon *Read-only*. The actor.
--- @field dialogue tes3dialogue *Read-only*. The dialogue object.
--- @field info tes3dialogueInfo *Read-only*. The dialogue info object.
--- @field passes boolean Indicates if the filter passes. Set to false to block a line.
--- @field reference tes3reference *Read-only*. The reference.
--- @field source integer *Read-only*. The source.
