Array = {
	values = {},
	delimiter = ",",
	openingBracket = "[",
	closingBracket = "]",
}
Array.__index = Array

--- @param values table array of values to be encapsulated in this object
--- @param delimiter string delimiter to use between values (such as ',')
--- @param openingBracket string which symbol to use as an opening bracket (such as '[')
--- @param closingBracket string which symbol to use as a closing bracket (such as ']')
function Array:New(values, delimiter, openingBracket, closingBracket)
	local array = {}

	setmetatable(array, Array)
	array.values = values
	array.delimiter = delimiter
	array.openingBracket = openingBracket
	array.closingBracket = closingBracket

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

	s = s .. self.openingBracket

	if not isEmpty(self.values) then
		for _, value in ipairs(self.values) do
			s = s .. value
			s = s .. self.delimiter
		end
		s = s:sub(0, s:len() - 1)
	end

	s = s .. self.closingBracket
	return s
end

return Array
