local M = {}

---@param max integer
---@param min integer
---@return integer x max > x > min
function M:Integer(min, max)
	return math.random(min, max)
end


return M
