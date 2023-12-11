local M = {}

---@param max integer
---@param min integer
---@return integer x max > x > min
function M:Integer(min, max)
	return math.random(min, max)
end


---@param length integer total length of a number
---@return integer x integer of provided length
function M:IntegerByLength(length)
	if length <= 0
		then error("length cannot be less than zero")
	end

	local max = 10^length - 1
	local min = 10^(length - 1)
	return M:Integer(min, max)
end

return M
