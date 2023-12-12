local utils = require("randomness.utils")

TestLettersMatchCount = {}
function TestLettersMatchCount:testFullMatch()
	local s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local chars = "0123456789"

	lu.assertEquals(utils.letterMatchCount(s, chars), 10)
end

function TestLettersMatchCount:testPartialMatch()
	local s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local chars = "abcdefghijklmnopqrstuvwxyz"

	lu.assertEquals(utils.letterMatchCount(s, chars), 26)
end

function TestLettersMatchCount:testNoMatch()
	local s = "abcdefghijklmnopqrstuvwxyz"
	local chars = "0123456789"

	lu.assertEquals(utils.letterMatchCount(s, chars), 0)
end
