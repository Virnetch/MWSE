--[[
	A basic Page. Components are displayed in a vertical scroll pane.
]]--

--- These types have annotations in the core\meta\ folder. Let's stop the warning spam here in the implementation.
--- The warnings arise because each field set here is also 'set' in the annotations in the core\meta\ folder.
--- @diagnostic disable: duplicate-set-field

local Parent = require("mcm.components.categories.Category")

--- @class mwseMCMPage
local Page = Parent:new()
Page.componentType = "Page"
Page.indent = 6

--- @param data mwseMCMPage.new.data|nil
--- @return mwseMCMPage page
function Page:new(data)
	--- @diagnostic disable-next-line: param-type-mismatch
	local t = Parent:new(data)

	if data then
		if data.parentComponent.pages then
			data.label = data.label or ("Page " .. (#(data.parentComponent.pages) + 1))
		else
			-- child of page, must be sidebar
			data.label = data.label or "Page"
		end
		-- register ID for the page tab
		local tabUID = ("Page_" .. t.label)
		t.tabUID = tes3ui.registerID(tabUID)
	end
	setmetatable(t, self)
	self.__index = self
	return t --[[@as mwseMCMPage]]

end

--- @param parentBlock tes3uiElement
function Page:createLabel(parentBlock)
	if self.showHeader then
		Parent.createLabel(self, parentBlock)
	end
end

function Page:disable()
	-- Update and grey out page label
	if self.elements.label then
		self.elements.label.text = string.format("%s (%s)", self.elements.label.text, mwse.mcm.i18n("In-Game Only"))
		self.elements.label.color = tes3ui.getPalette(tes3.palette.disabledColor)
	end
	-- Grey out all child elements
	for _, element in ipairs(self.elements.subcomponentsContainer.children) do
		if element.color then
			element.color = tes3ui.getPalette(tes3.palette.disabledColor)
		end
	end
end

--- @param parentBlock tes3uiElement
function Page:createResetButtonContainer(parentBlock)
	local resetContainer = parentBlock:createBlock({ id = "ResetContainer" })
	resetContainer.flowDirection = tes3.flowDirection.leftToRight
	resetContainer.autoWidth = true
	resetContainer.autoHeight = true
	resetContainer.widthProportional = 1.0
	resetContainer.childAlignX = 1.0
	self.elements.resetContainer = resetContainer
end

--- @param parentBlock tes3uiElement
function Page:createResetButton(parentBlock)
	local reset = parentBlock:createButton({
		id = "Reset_" .. self.componentType,
		text = mwse.mcm.i18n("Reset")
	})
	reset.borderRight = 10
	reset:registerAfter(tes3.uiEvent.mouseClick, function(e)
		tes3ui.showMessageMenu({
			message = mwse.mcm.i18n("Are you sure you want to reset your settings?"),
			cancels = true,
			leaveMenuMode = false,
			buttons = {{
				text = mwse.mcm.i18n("Reset"),
				callback = function()
					self:resetSettings()
				end
			}}
		})
	end)

	self.elements.resetButton = reset
end


--- @param parentBlock tes3uiElement
function Page:createOuterContainer(parentBlock)
	local border

	if self.noScroll then
		border = parentBlock:createThinBorder({ id = tes3ui.registerID("Page_thinBorder") })
		border.heightProportional = 1.0
		border.widthProportional = 1.0
		border.autoHeight = true
		border.flowDirection = tes3.flowDirection.topToBottom
		border.paddingTop = 4
		border.paddingLeft = 4
	else
		border = parentBlock:createVerticalScrollPane({ id = tes3ui.registerID("Page_ScrollPane") })
		border.heightProportional = 1.0
		border.widthProportional = 1.0
	end

	local outerContainer = border:createBlock({ id = tes3ui.registerID("Page_OuterContainer") })
	outerContainer.flowDirection = tes3.flowDirection.topToBottom
	outerContainer.autoHeight = true
	outerContainer.heightProportional = 1.0
	outerContainer.widthProportional = 1.0
	outerContainer.paddingLeft = self.indent
	outerContainer.paddingTop = self.indent

	self.elements.outerContainer = outerContainer
end

--- @param parentBlock tes3uiElement
function Page:create(parentBlock)
	local mainContainer = parentBlock:createBlock({ id = tes3ui.registerID("Page_MainContainer") })
	mainContainer.flowDirection = tes3.flowDirection.topToBottom
	mainContainer.autoHeight = true
	mainContainer.heightProportional = 1.0
	mainContainer.widthProportional = 1.0

	Parent.create(self, mainContainer)
	if self.showReset then
		self:createResetButtonContainer(mainContainer)
		self:createResetButton(self.elements.resetContainer)
	end
end

return Page
