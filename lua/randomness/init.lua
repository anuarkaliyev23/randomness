local logger = require("randomness.logger")
local conf = require("randomness.config")
local numbers = require("randomness.numbers")
local strings = require("randomness.strings")

--- @class Randomness
--- @field config Config
Randomness = {}
Randomness.__index = Randomness

--- @param s any
local function insertUnderCursor(s)
	local pos = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()
	local nline = line:sub(0, pos) .. s .. line:sub(pos + 1)
	vim.api.nvim_set_current_line(nline)
end

---@param value any
---@param default any
---@return any value if value is set, default otherwise
local function valueOrDefault(value, default)
	if not value then
		return default
	end
	return value
end

--- @param config Config
function Randomness.setup(self, config)
	if not config then
		config = conf:New()
	end
	self.config = config
	logger.level = config.logLevel
end

--- @param min integer
--- @param max integer
-- Generates random integer in range [min, max]
function Randomness.Integer(self, min, max)
	if not min then
		min = self.config.defaults.integers.min
	end

	if not max then
		max = self.config.defaults.integers.max
	end

	local number = numbers.Integer(self, min, max)
	insertUnderCursor(number)
end

--- @param min integer
--- @param max integer
--- @param count integer
--- @param arrayOptions ArrayOptions
-- Generates integer array of given `count` length. Every integer will be in [min, max] range.
function Randomness.Integers(self, min, max, count, arrayOptions)
	if not arrayOptions then
		arrayOptions = self.config.defaults.arrays.options
	end

	if not min then
		min = self.config.defaults.integers.min
	end

	if not max then
		max = self.config.defaults.integers.max
	end

	if not count then
		count = self.config.defaults.arrays.length
	end

	local ns = numbers:Integers(min, max, count, arrayOptions)
	insertUnderCursor(ns:ToString())
end

--- @param length integer
--- @param stringOptions StringOptions
-- Generates random string and inserts it under current cursor position
function Randomness.String(self, length, stringOptions)
	if not stringOptions then
		stringOptions = self.config.defaults.strings.options
	end

	if not length then
		length = self.config.defaults.strings.length
	end

	local s = strings:String(length, stringOptions)
	insertUnderCursor(s)
end


--- @param length integer
--- @param stringOptions StringOptions
--- @param count integer
--- @param arrayOptions ArrayOptions
-- Generates random strings array and inserts it under current cursor position
function Randomness.Strings(self, length, stringOptions, count, arrayOptions)
	length = valueOrDefault(length, self.config.defaults.strings.length)
	stringOptions = valueOrDefault(stringOptions, self.config.defaults.strings.options)
	count = valueOrDefault(count, self.config.defaults.arrays.length)
	arrayOptions = valueOrDefault(arrayOptions, self.config.defaults.arrays.options)

	local sArray = strings:Strings(length, stringOptions, count, arrayOptions)
	insertUnderCursor(sArray:ToString())
end

return Randomness
