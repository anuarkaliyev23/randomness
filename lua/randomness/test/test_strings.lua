local rstrings = require("randomness.strings")
local lu = require("luaunit")

TestRandomCharsets = {}
function TestRandomCharsets:testValidCases()
	local charset1 = 'abcdefg'
	local charset2 = 'qwertyiop'
	local charset3 = '1234567890'


	local charsets = {charset1, charset2, charset3}

	for _ = 1, 1000 do
		local rc = rstrings.randomCharset(charsets)
		lu.assertNotEquals(rc, nil)
		lu.assertTrue(rc == charset1 or rc == charset2 or rc == charset3)
	end
end

TestRandomCharacter = {}
function TestRandomCharacter:TestRandomCharacter()
	local charset = "abcdefghijkl"

	for _ = 1, 1000 do
		local rc = rstrings.randomCharacter(charset)
		lu.assertNotNil(charset:find(rc))
	end
end



TestLettersMatchCount = {}
function TestLettersMatchCount:testFullMatch()
	local s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local chars = "0123456789"

	lu.assertEquals(rstrings.letterMatchCount(s, chars), 10)
end

function TestLettersMatchCount:testPartialMatch()
	local s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local chars = "abcdefghijklmnopqrstuvwxyz"

	lu.assertEquals(rstrings.letterMatchCount(s, chars), 26)
end

function TestLettersMatchCount:testNoMatch()
	local s = "abcdefghijklmnopqrstuvwxyz"
	local chars = "0123456789"

	lu.assertEquals(rstrings.letterMatchCount(s, chars), 0)
end


TestString = {}
function TestString:testOnlyLetters()
	local options = {
		allowLetters = true,
		allowDigits = false,
	}

	for _ = 1, 1000 do
		local s = rstrings:string(10, options)
		lu.assertNotEquals(s, nil)

		lu.assertEquals(10, s:len())
		local forbidden = "1234567890"

		lu.assertEquals(rstrings.letterMatchCount(s, forbidden), 0)
	end
end

function TestString:testAlphanumerical()
	local options = {
		allowLetters = true,
		allowDigits = true,
	}

	for _ = 1, 1000 do
		local s = rstrings:string(10, options)
		lu.assertNotEquals(s, nil)

		lu.assertEquals(10, s:len())
		local forbidden = "абвгдежзиклмнопрстуфхцчшщъыьэюя"

		lu.assertEquals(rstrings.letterMatchCount(s, forbidden), 0)
	end
end


function TestString:testOnlyDigits()
	local options = {
		allowLetters = false,
		allowDigits = true,
	}

	for _ = 1, 1000 do
		local s = rstrings:string(10, options)
		lu.assertNotEquals(s, nil)

		lu.assertEquals(10, s:len())
		local forbidden = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

		lu.assertEquals(rstrings.letterMatchCount(s, forbidden), 0)
	end
end



os.exit( lu.LuaUnit.run() )
