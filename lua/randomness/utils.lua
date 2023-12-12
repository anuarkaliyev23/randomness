local logger = require("randomness.logger")
local M = {}

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

return M
