local rstrings = require("randomness.strings")
local lu = require("luaunit")
local utils = require("randomness.utils")
local logger = require("randomness.logger")

-- TestRandomCharsets = {}
-- function TestRandomCharsets:testValidCases()
-- 	local charset1 = 'abcdefg'
-- 	local charset2 = 'qwertyiop'
-- 	local charset3 = '1234567890'
--
--
-- 	local charsets = {charset1, charset2, charset3}
--
-- 	for _ = 1, 1000 do
-- 		local rc = rstrings.randomCharset(charsets)
-- 		lu.assertNotEquals(rc, nil)
-- 		lu.assertTrue(rc == charset1 or rc == charset2 or rc == charset3)
-- 	end
-- end
--
-- TestRandomCharacter = {}
-- function TestRandomCharacter:TestRandomCharacter()
-- 	local charset = "abcdefghijkl"
--
-- 	for _ = 1, 1000 do
-- 		local rc = rstrings.randomCharacter(charset)
-- 		lu.assertNotNil(charset:find(rc))
-- 	end
-- end



TestString = {}
function TestString:testOnlyLetters()
	local options = {
		allowLetters = true,
		allowDigits = false,
	}

	for _ = 1, 1000 do
		local s = rstrings:String(10, options)
		lu.assertNotEquals(s, nil)

		lu.assertEquals(10, s:len())
		local forbidden = "1234567890"

		lu.assertEquals(utils.letterMatchCount(s, forbidden), 0)
	end
end

function TestString:testAlphanumerical()
	local options = {
		allowLetters = true,
		allowDigits = true,
	}

	for _ = 1, 1000 do
		local s = rstrings:String(10, options)
		lu.assertNotEquals(s, nil)

		lu.assertEquals(10, s:len())
		local forbidden = "абвгдежзиклмнопрстуфхцчшщъыьэюя"

		lu.assertEquals(utils.letterMatchCount(s, forbidden), 0)
	end
end


function TestString:testOnlyDigits()
	local options = {
		allowLetters = false,
		allowDigits = true,
	}

	for _ = 1, 1000 do
		local s = rstrings:String(10, options)
		lu.assertNotEquals(s, nil)

		lu.assertEquals(10, s:len())
		local forbidden = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

		lu.assertEquals(utils.letterMatchCount(s, forbidden), 0)
	end
end

function TestString:testQuotes()
	local options = {
		allowLetters = true,
		allowDigits = true,
		quotes = '"',
	}

	local s = rstrings:String(10, options)

	lu.assertEquals(12, s:len())
	lu.assertEquals(string.sub(s, 1, 1), '"')
	lu.assertEquals(string.sub(s, 12, 12), '"')
end


function TestString:testStrings()
	local options = {
		allowLetters = true,
		allowDigits = true,
	}

	local arrayOptions = {
		delimiter = ",",
		openingBracket = "[",
		closingBracket = "]",
	}

	for _ = 1, 1000 do
		local s = rstrings:Strings(10, options, 10, arrayOptions)
		lu.assertEquals(#s.values, 10)
		for i = 1, 10 do
			lu.assertEquals(string.len(s.values[i]), 10)
		end
	end
end

os.exit( lu.LuaUnit.run() )
