local common = require("mwse.common")

---@param actorReference tes3reference Needs to be a reference of a tes3actor.
local function reevaluateActorEquipment(actorReference)
	-- Don't reevaluate player's equipment.
	if actorReference == tes3.player then return end
	local object = actorReference.object
	local type = object.objectType

	-- Containers don't have equipment - nothing to reevaluate.
	if type == tes3.objectType.npc
	or type == tes3.objectType.creature then
		---@cast object tes3npcInstance|tes3creatureInstance
		object:reevaluateEquipment()
	end
end


---@param params tes3.transferInventory.params
---@return boolean transferred
function tes3.transferInventory(params)
	-- Validate parameters.
	assert(type(params) == "table", "Invalid parameter. This function must be called with table parameters.")

	local from = common.getRelatedReference(params.from)
	local to = common.getRelatedReference(params.to)
	assert(from, "Invalid 'from' parameter provided. Must be a tes3reference, tes3mobileActor or string.")
	assert(to, "Invalid 'to' parameter provided. Must be a tes3reference, tes3mobileActor or string.")

	local fromActor = from.object
	local toActor = to.object
	assert(common.isActor(fromActor), "Invalid 'from' parameter provided. It must have an inventory.")
	assert(common.isActor(toActor), "Invalid 'to' parameter provided. It must have an inventory.")
	---@cast fromActor tes3creature|tes3creatureInstance|tes3container|tes3container|tes3npc|tes3npcInstance
	---@cast toActor tes3creature|tes3creatureInstance|tes3container|tes3container|tes3npc|tes3npcInstance

	-- Set default parameter values.
	local playSound = table.get(params, "playSound", true)
	local reevaluateEquipment = table.get(params, "reevaluateEquipment", true)

	-- The fromActor needs to be cloned before transfering the items since we
	-- need to get item counts including the items that come from leveled lists.
	if not fromActor.isInstance then
		from:clone()
		fromActor = from.object
	end
	---@cast fromActor tes3creatureInstance|tes3containerInstance|tes3npcInstance

	if from.isEmpty then
		return false
	end

	local toTransfer = {}

	for _, stack in pairs(fromActor.inventory) do
		local item = stack.object
		-- Skip uncarryable lights. They are hidden from the interface. A MWSE mod
		-- could make the player glow from transferring such lights, which the player
		-- can't remove. Some creatures like atronaches have uncarryable lights
		-- in their inventory to make them glow that are not supposed to be looted.
		if item.canCarry ~= false then
			toTransfer[#toTransfer + 1] = {
				item = item,
				count = stack.count
			}
		end
	end

	local value = 0

	for _, stack in pairs(toTransfer) do
		local item = stack.item --[[@as tes3weapon]]
		value = value + item.value * tes3.transferItem({
			from = from,
			to = to,
			item = item,
			count = stack.count,
			limitCapacity = params.limitCapacity,
			equipProjectiles = params.equipProjectiles,
			reevaluateEquipment = false,
			playSound = false,
			updateGUI = false,
		})
	end

	-- No items transferred? Great, let's get out of here.
	if value == 0 then
		return false
	end

	local targetIsPlayer = (to == tes3.player)

	if playSound then
		local isPlayerInvolved = (to == tes3.player) or (from == tes3.player)
		local firstItem = toTransfer[1].item
		if isPlayerInvolved then
			tes3.playItemPickupSound({
				item = firstItem,
				pickup = targetIsPlayer
			})
		end
	end

	if params.checkCrime and targetIsPlayer then
		if not tes3.hasOwnershipAccess({ target = from }) then
			tes3.triggerCrime({
				type = tes3.crimeType.theft,
				victim = tes3.getOwner(from),
				value = value,
			})
		end
	end

	if reevaluateEquipment then
		reevaluateActorEquipment(from)
		reevaluateActorEquipment(to)
	end

	-- We deferred GUI updating earlier, so update it now.
	tes3.updateInventoryGUI({ reference = from })
	tes3.updateInventoryGUI({ reference = to })
	tes3.updateMagicGUI({ reference = from, updateSpells = false })
	tes3.updateMagicGUI({ reference = to, updateSpells = false })

	return true
end
