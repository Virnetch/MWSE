-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- This event is triggered when a new spell is created using spellmaking services or by a script using `tes3.createObject()`.
--- @class spellCreatedEventData
--- @field claim boolean If set to `true`, any lower-priority event callbacks will be skipped. Returning `false` will set this to `true`.
--- @field source tes3.spellSource Was the origin of the spell spellmaker or a script?  Maps to values in [`tes3.spellSource`](https://mwse.github.io/MWSE/references/spell-sources/) namespace.
--- @field spell tes3spell A spell which was created.
