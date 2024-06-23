--[[
	A setting is a component that can be interacted with, such as a button or text input.
	It can have, but doesn't require, an associated variable.
]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local fileUtils = require("mcm.fileUtils")
local Parent = require("mcm.components.Component")

local TableVariable = require("mcm.variables.TableVariable")

--- @class mwseMCMSetting
local Setting = Parent:new()
Setting.componentType = "Setting"
Setting.restartRequired = false
Setting.restartRequiredMessage = mwse.mcm.i18n("The game must be restarted before this change will come into effect.")

--- @param data mwseMCMSetting.new.data|nil
--- @return mwseMCMSetting
function Setting:new(data)
	local t = Parent:new(data)
	self.__index = self

	
	if data then
		local configKey = data.configKey
		local parent = data.parentComponent
		local config = data.config or parent and parent.config
		local defaultConfig = data.defaultConfig or parent and parent.defaultConfig

		-- Get the default setting. Include `nil` checks so we can handle it being `false`.
		local defaultSetting = data.variable and data.variable.defaultSetting
		if defaultSetting == nil then
			defaultSetting = data.defaultSetting
			if defaultSetting == nil and defaultConfig and configKey then
				defaultSetting = defaultConfig[configKey]
			end
		end
		-- No variable? Let's make one.
		if t.variable == nil and config and configKey then
			t.variable = TableVariable:new{
				id = configKey,
				table = config,
				converter = data.converter,
				inGameOnly = data.inGameOnly,
				defaultSetting = defaultSetting,
				restartRequired = data.restartRequired,
				restartRequiredMessage = data.restartRequiredMessage
			}
		-- Variable provided? Let's update it for backwards compatibility.
		elseif t.variable ~= nil then
			t.variable.defaultSetting = defaultSetting
			t.variable.converter = t.variable.converter or data.converter
			t.variable = fileUtils.getVariableClass(t.variable.class):new(t.variable)
		end
	end

	setmetatable(t, self)
	--- @cast t mwseMCMSetting
	return t
end

function Setting:insertMouseovers(element)
	table.insert(self.mouseOvers, element)
	for _, child in ipairs(element.children or {}) do
		self:insertMouseovers(child)
	end
end

function Setting:update()
	if self.restartRequired then

		tes3.messageBox { message = self.restartRequiredMessage, buttons = { self.sOK } }
	end
	if self.callback then
		self:callback()
	end
end

function Setting:checkDisabled()
	-- override the variable
	if self.inGameOnly ~= nil then
		return not tes3.player and self.inGameOnly
	end
	-- Components with variable
	local disabled = (self.variable and self.variable.inGameOnly == true and not tes3.player)
	return disabled --[[@as boolean]]
end

--- @param parentBlock tes3uiElement
function Setting:createContentsContainer(parentBlock)
	self:createLabel(parentBlock)
	self:createInnerContainer(parentBlock)
	self:makeComponent(self.elements.innerContainer)
end


function Setting:convertToLabelValue(variableValue)
	return variableValue
end

return Setting
