
---@class Array
---@field values table
---@field options ArrayOptions
--
---@class ArrayOptions 
---@field delimiter string
---@field openingBracket string
---@field closingBracket string
Array = {
	values = {},
	options = {
		delimiter = ",",
		openingBracket = "[",
		closingBracket = "]",
	}
}
Array.__index = Array


--- @param values table 
--- @param options ArrayOptions
function Array:New(values, options)
	local array = {}

	setmetatable(array, Array)
	array.values = values
	array.options = options

	return array
end


--- @param t table
--- @return boolean
local function isEmpty(t)
	for _,_ in pairs(t) do
		return false
	end
	return true
end

--- @return string
function Array.ToString(self)
	local s = ""

	s = s .. self.options.openingBracket

	if not isEmpty(self.values) then
		for _, value in ipairs(self.values) do
			s = s .. value
			s = s .. self.options.delimiter
		end
		s = s:sub(0, s:len() - 1)
	end

	s = s .. self.options.closingBracket
	return s
end

return Array
