-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- A game object which contains information on actor's current and assigned AI packages.
--- @class tes3aiPlanner
--- @field currentPackageIndex number *Read-only*. Access to index of currently active AI package in packages table.
--- @field mobile tes3mobileActor|tes3mobileCreature|tes3mobileNPC|tes3mobilePlayer The access to mobile actor this `tes3aiPlanner` object works on.
--- @field nextOpenPackageIndex number *Read-only*. This is the index in `.packages` table that represents the currently active AI package.
--- @field packages tes3aiPackage[]|tes3aiPackageActivate[]|tes3aiPackageEscort[]|tes3aiPackageFollow[]|tes3aiPackageTravel[]|tes3aiPackageWander[] *Read-only*. The table with `tes3aiPackage` objects assigned to this mobile actor. These packages are executed as instruction in the order they are defined. When the last one is executed, the cycle is repeated from the start. Has 32 entries, where any can be nil.
tes3aiPlanner = {}

--- Fetches currently active AI package.
--- @return tes3aiPackageActivate|tes3aiPackageEscort|tes3aiPackageFollow|tes3aiPackageTravel|tes3aiPackageWander result No description yet available.
function tes3aiPlanner:getActivePackage() end

