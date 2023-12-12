local numbers = require("randomness.numbers")
local lu = require("luaunit")

TestInteger = {}

function TestInteger:testZeroBounds()
	local number = numbers:Integer(0, 0)
	lu.assertEquals(number, 0)
end


function TestInteger:testMaxLessThanMin()
	lu.assertError(function()
		numbers:Integer(0, -1)
	end)
end

function TestInteger:testValidCases()
	for i=1,10000 do
		local number = numbers:Integer(0, 100)
		lu.assertTrue(number >= 0 and number <= 100)
	end
end

TestIntegers = {}

function TestIntegers:testZeroCount()
	local array = numbers:Integers(0, 10, 0)
	lu.assertEquals(array.values, {})
end

function TestIntegers:testValidCases()
	local array = numbers:Integers(0, 10, 10)
	lu.assertEquals(#array.values, 10)
end

os.exit( lu.LuaUnit.run() )
