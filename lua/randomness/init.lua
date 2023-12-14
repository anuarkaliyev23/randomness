local logger = require("randomness.logger")
local conf = require("randomness.config")
local numbers = require("randomness.numbers")

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

return Randomness
