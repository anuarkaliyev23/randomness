local config = require("randomness.config")
local arrays = require("randomness.arrays")

local M = {}

---@param max integer
---@param min integer
---@return integer x max > x > min
function M:Integer(min, max)
	return math.random(min, max)
end


---@param min integer
---@param max integer
---@param count integer
---@param arrayOptions ArrayOptions
---@return Array
function M:Integers(min, max, count, arrayOptions)
	local values = {}
	if count > 0 then
		for _ = 0,count - 1 do
			local value = M:Integer(min, max)
			table.insert(values, value)
		end
	end
	return arrays:New(values, arrayOptions)
end

return M
