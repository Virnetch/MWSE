--- @class tes3ui.showColorPickerMenu.params
--- @field id? string
--- @field heading? string
--- @field initialColor ImagePixel
--- @field initialAlpha? number
--- @field alpha? boolean If true the picker will also allow picking an alpha value.
--- @field showOriginal? boolean If true the picker will show original color below the currently picked color.
--- @field showDataRow? boolean If true the picker will show RGB(A) values of currently picked color in a label below the picker.
--- @field closeCallback? fun(selectedColor: ImagePixel, selectedAlpha: number|nil) Called when the color picker has been closed.
--- @field leaveMenuMode? boolean

local i18n = mwse.loadTranslations("..")

--- @param params tes3ui.showColorPickerMenu.params
function tes3ui.showColorPickerMenu(params)
	-- Validate parameters.
	assert(type(params) == "table", "Invalid parameters passed to function.")

	local menu = tes3ui.createMenu({
		id = params.id or tes3ui.registerID("MenuColorPicker"),
		fixedFrame = true,
	})

	menu.absolutePosAlignX = 0.5
	menu.absolutePosAlignY = 0.5
	menu.childAlignX = 0.5
	menu.childAlignY = 0.5
	menu.autoWidth = true
	menu.autoHeight = true
	menu.minWidth = 500
	menu.alpha = tes3.worldController.menuAlpha

	-- Heading
	local headingBlock = menu:createBlock({ id = tes3ui.registerID("MenuColorPicker_heading_block") })
	headingBlock.childAlignX = 0.5
	headingBlock.autoHeight = true
	headingBlock.autoWidth = true
	headingBlock.widthProportional = 1.0
	headingBlock.paddingAllSides = 8
	headingBlock.flowDirection = tes3.flowDirection.topToBottom

	headingBlock:createLabel({
		id = tes3ui.registerID("MenuColorPicker_heading"),
		text = params.heading or i18n("Color Picker Menu"),
	})
	headingBlock:createDivider()

	-- Menu body
	local bodyBlock = menu:createBlock({ id = tes3ui.registerID("MenuColorPicker_picker_container") })
	bodyBlock.autoHeight = true
	bodyBlock.autoWidth = true
	bodyBlock.widthProportional = 1.0
	bodyBlock.paddingLeft = 8
	bodyBlock.paddingRight = 8
	bodyBlock.flowDirection = tes3.flowDirection.topToBottom

	local pickerElement = bodyBlock:createColorPicker({
		alpha = params.alpha,
		initialColor = params.initialColor,
		initialAlpha = params.initialAlpha,
		showOriginal = params.showOriginal,
		showDataRow = params.showDataRow,
	})

	local doneContainer = bodyBlock:createBlock({ id = tes3ui.registerID("MenuColorPicker_done_container") })
	doneContainer.autoWidth = true
	doneContainer.autoHeight = true
	doneContainer.flowDirection = tes3.flowDirection.leftToRight
	doneContainer.widthProportional = 1.0
	doneContainer.heightProportional = 1.0
	doneContainer.childAlignX = 1.0

	local done = doneContainer:createButton({
		id = tes3ui.registerID("MenuColorPicker_done_button"),
		text = tes3.findGMST(tes3.gmst.sDone).value --[[@as string]]
	})

	done:register(tes3.uiEvent.mouseDown, function(e)
		local picker = pickerElement.widget.picker --[[@as ColorPicker]]
		local color, alpha = picker:getColorAlpha()
		menu:destroy()
		if params.leaveMenuMode then
			tes3ui.leaveMenuMode()
		end
		if params.closeCallback then
			params.closeCallback(color, alpha)
		end
	end)

	menu:getTopLevelMenu():updateLayout()
	tes3ui.enterMenuMode(menu.id)
end
