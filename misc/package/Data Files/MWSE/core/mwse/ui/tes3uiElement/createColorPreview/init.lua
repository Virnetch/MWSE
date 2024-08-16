local ColorPreview = require("mwse.ui.tes3uiElement.createColorPreview.ColorPreview")
local UIID = require("mwse.ui.tes3uiElement.createColorPreview.uiid")
local validate = require("mwse.ui.tes3uiElement.createColorPicker.validate")

--- @param params tes3uiElement.createColorPreview.params
--- @param preview ColorPreview
--- @param parent tes3uiElement
local function createPreviewElement(params, preview, parent)
	local color = params.color --[[@as ImagePixel]]
	local standardPreview = parent:createRect({
		id = UIID.rect,
		color = { color.r, color.g, color.b },
	})
	standardPreview.width = params.width
	standardPreview.height = params.height

	if not params.hasAlphaPreview then return end
	local checkersPreview = parent:createRect({
		id = UIID.image,
		color = { 1.0, 1.0, 1.0 },
	})
	-- We don't scale the image here, but the texture may be bigger than needed.
	-- We rely on UI system to crop only the top left part of the texture.
	checkersPreview.width = params.width
	checkersPreview.height = params.height
	checkersPreview.texture = preview.texture
	checkersPreview.imageFilter = false
	checkersPreview.texture.pixelData:setPixelsFloat(preview.image:toPixelBufferFloat())
end

--- @class tes3uiElement.createColorPreview.params
--- @field id string|number|nil
--- @field width integer? *Default: 64* Width of the individual preview image.
--- @field height integer? *Default: 64* Height of the individual preview image.
--- @field checkerSize? integer? *Default: 16*
--- @field lightGray ImagePixel? *Default: { r = 0.7, g = 0.7, b = 0.7 }*
--- @field darkGray ImagePixel? *Default: { r = 0.5, g = 0.5, b = 0.5 }*
--- @field color ImagePixel|ffiImagePixel? *Default: { r = 1.0, g = 1.0, b = 1.0 }*
--- @field alpha number? *Default: 1.0*
--- @field hasAlphaPreview boolean? *Default: true* If true the picker will also allow picking an alpha value.
--- @field flowDirection tes3.flowDirection? *Defaukt: tes3.flowDirection.leftToRight*

---@param params tes3uiElement.createColorPreview.params?
function tes3uiElement:createColorPreview(params)
	params = params or {}
	params = table.deepcopy(params) --[[@as tes3uiElement.createColorPreview.params]]
	params.flowDirection = table.get(params, "flowDirection", tes3.flowDirection.leftToRight)
	params.hasAlphaPreview = table.get(params, "hasAlphaPreview", true)
	params.color = table.get(params, "color", { r = 1.0, g = 1.0, b = 1.0 })
	params.alpha = table.get(params, "alpha", 1.0)
	params.width = table.get(params, "width", 64)
	params.height = table.get(params, "height", 64)

	assert(validate.pixel(params.color),
		"Invalid 'color' provided. Must be a table with RGB values in unit range [0, 1].")
	assert(validate.inUnitRange(params.alpha), "Invalid 'alpha' provided. Must be in unit range [0, 1].")
	if params.lightGray then
		assert(validate.pixel(params.lightGray),
			"Invalid 'lightGray' provided. Must be a table with RGB values in unit range [0, 1].")
	end
	if params.darkGray then
		assert(validate.pixel(params.darkGray),
			"Invalid 'darkGray' provided. Must be a table with RGB values in unit range [0, 1].")
	end


	local preview = ColorPreview:new({
		-- Make sure the texture is a power of 2. The texture is bigger if given dimensions aren't powers of two.
		height = math.nextPowerOfTwo(params.height),
		width = math.nextPowerOfTwo(params.width),
		checkerSize = params.checkerSize,
		lightGray = params.lightGray,
		darkGray = params.darkGray,
		color = params.color,
		alpha = params.alpha,
	})

	local container = self:createBlock({ id = params.id })
	container.autoWidth = true
	container.autoHeight = true
	container.flowDirection = params.flowDirection
	createPreviewElement(params, preview, container)


	container:makeLuaWidget("colorPreview", preview)

	return container
end

tes3ui.defineLuaWidget({
	name = "colorPreview",
	metatable = ColorPreview,
})
