local numbers = require("randomness.numbers")
local lu = require("luaunit")

TestIntegers = {}

function TestIntegers:testZeroBounds()
	local number = numbers:Integer(0, 0)
	lu.assertEquals(number, 0)
end


function TestIntegers:testMaxLessThanMin()
	lu.assertError(function()
		numbers:Integer(0, -1)
	end)
end

function TestIntegers:testValidCases()
	for i=1,10000 do
		local number = numbers:Integer(0, 100)
		lu.assertTrue(number >= 0 and number <= 100)
	end
end

os.exit( lu.LuaUnit.run() )
