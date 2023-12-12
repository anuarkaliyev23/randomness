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
--- @param chars string
function M.containsLetters(s, chars)
	return M.letterMatchCount(s, chars) == 0
end

--- @param s string
--- @param chars string
function M.letterMatchCount(s, chars)
	logger.debug("s: " .. s)
	logger.debug("chars: " .. chars)

	if #s == 0 or #chars == 0 then
		return 0
	end

	local matches = 0
	for i = 1, #chars do
		local char = chars:sub(i, i)
		logger.debug(string.format("iterating over string [%s], current index: [%d], current letter: [%s]", chars, i, char))
		if string.find(s, char) then
			matches = matches + 1
			logger.debug(string.format("found match for letter [%s] in string [%s]", char, s))
		end
	end

	logger.debug(string.format("found [%d] matches for string [%s] and letters to match against [%s]", matches, s, chars))
	return matches
end

--- @param s string
function M.randomCharacter(s)
	local random = math.random(1, string.len(s))
	return string.sub(s, random, random)
end

---@param charsets table list of all available charsets
function M.randomCharset(charsets)
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
		local charset = M.randomCharset(charsets)
		local char = M.randomCharacter(charset)
		s = s .. char
	end

	return s
end

return M
