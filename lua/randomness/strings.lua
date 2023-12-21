local logger = require("randomness.logger")
local arrays = require("randomness.arrays")

M = {}

---@class StringOptions
---@field allowLetters boolean
---@field allowDigits boolean
---@field quotes string
Options = {}
Options.__index = Options


local letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
local digits = '0123456789'



--- @param s string
local function randomCharacter(s)
	local random = math.random(1, string.len(s))
	return string.sub(s, random, random)
end

---@param charsets table list of all available charsets
local function randomCharset(charsets)
	local random = math.random(1, #charsets)
	return charsets[random]
end

---@param options StringOptions
local function populateCharsets(options)
	local charsets = {}

	if options.allowLetters then
		table.insert(charsets, letters)
	end

	if options.allowDigits then
		table.insert(charsets, digits)
	end

	return charsets
end

---@param length integer
---@param options StringOptions 
function M:String(length, options)
	local s = ""
	local charsets = populateCharsets(options)

	if options.quotes then
		s = s .. options.quotes
	end

	for _ = 0, length - 1 do
		local charset = randomCharset(charsets)
		local char = randomCharacter(charset)
		s = s .. char
	end

	if options.quotes then
		s = s .. options.quotes
	end

	return s
end

--- @param stringLength integer
--- @param options StringOptions
--- @param arrayLength integer
--- @param arrayOptions ArrayOptions
function M:Strings(stringLength, options, arrayLength, arrayOptions)
	local values = {}
	for _ = 1, arrayLength do
		local s = M:String(stringLength, options)
		table.insert(values, s)
	end
	return arrays:New(values, arrayOptions)
end

return M
