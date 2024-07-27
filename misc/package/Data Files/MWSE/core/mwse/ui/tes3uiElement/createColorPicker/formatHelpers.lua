local this = {}

--- @param p ffiImagePixel|ImagePixel
function this.pixel(p)
	return string.format("{ r = %.3f, g = %.3f, b = %.3f }", p.r, p.g, p.b)
end
--- @param c ffiHSV
function this.hsv(c)
	return string.format("{ h = %.3f, s = %.3f, v = %.3f }", c.h, c.s, c.v)
end

--- @param image Image
function this.imageData(image)
	local r = {}
	for y = 0, image.height - 1 do
		local offset = image:getOffset(y)
		for x = 1, image.width do
			table.insert(r, this.pixel(image.data[offset + x]))
		end
	end
	return "{" .. table.concat(r, "\n\t") .. "}"
end

--- Formats given RGB(A) pixel into an HTML hex code.
--- @param pixel ImagePixelArgument|ffiImagePixel
function this.pixelToHex(pixel)
	if pixel.a then
		return string.format("%02X%02X%02X%02X", pixel.a * 255, pixel.r * 255, pixel.g * 255, pixel.b * 255)
	else
		return string.format("%02X%02X%02X", pixel.r * 255, pixel.g * 255, pixel.b * 255)
	end
end

--- @param code string
--- @return number?
local function hexToColor(code)
	local color = tonumber(code, 16)
	-- The user might have entered invalid hex code. We set that channel
	-- to the value of currentColor in the keyEnter handler on the input.
	if not color then return end
	-- Make sure the entered color will be clamped to [0, 1].
	return math.clamp(color / 255, 0, 1)
end

--- Parses given HTML hex code into an RGB(A) pixel.
--- @param str string
--- @return ImagePixelArgument
function this.hexToPixel(str)
	local pixel = {}
	-- ARGB
	if string.len(str) == 8 then
		pixel.a = hexToColor(string.sub(str, 1, 2))
		pixel.r = hexToColor(string.sub(str, 3, 4))
		pixel.g = hexToColor(string.sub(str, 5, 6))
		pixel.b = hexToColor(string.sub(str, 7, 8))
	else -- RGB
		pixel.r = hexToColor(string.sub(str, 1, 2))
		pixel.g = hexToColor(string.sub(str, 3, 4))
		pixel.b = hexToColor(string.sub(str, 5, 6))
	end
	return pixel
end

return this
