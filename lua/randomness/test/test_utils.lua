local lu = require("luaunit")
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

TestDeepCopy = {}
function TestDeepCopy:testTable()
	local t1 = {
		logLevel = 'info',
		defaults = {
			integers = {
				min = 0,
				max = 100,
			},

			arrays = {
				delimiter = ",",
				openingBracket = "[",
				closingBracket =  "]",
			}
		}
	}

	local t2 = utils.tableDeepCopy(t1)

	lu.assertEquals(t1, t2)
end

function TestDeepCopy:testTableModification()
	local t1 = {
		logLevel = 'info',
		defaults = {
			integers = {
				min = 0,
				max = 100,
			},

			arrays = {
				delimiter = ",",
				openingBracket = "[",
				closingBracket =  "]",
			}
		}
	}

	local t2 = utils.tableDeepCopy(t1)

	t2.logLevel = 'debug'
	t2.defaults.integers.min = -1000
	t2.defaults.integers.max = 1000

	lu.assertNotEquals(t1, t2)
	lu.assertEquals(t1.defaults.integers.min, 0)
	lu.assertEquals(t1.defaults.integers.max, 100)

	lu.assertEquals(t2.defaults.integers.min, -1000)
	lu.assertEquals(t2.defaults.integers.max, 1000)
end


os.exit( lu.LuaUnit.run() )
