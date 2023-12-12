local logger = require("randomness.logger")

M = {}

---@class StringOptions
---@field allowLetters boolean
---@field allowDigits boolean

Options = {
	allowLetters = true,
	allowDigits = false,
}
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
function M:string(length, options)
	local s = ""
	local charsets = populateCharsets(options)

	for _ = 0, length - 1 do
		local charset = randomCharset(charsets)
		local char = randomCharacter(charset)
		s = s .. char
	end

	return s
end

return M
