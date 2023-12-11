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


function TestIntegers:testIngegerByLengthNegative()
	lu.assertError(function()
		numbers:IntegerByLength(-1)
	end)
end

function TestIntegers:testIngegerByLengthZero()
	lu.assertError(function()
		numbers:IntegerByLength(0)
	end)
end

function TestIntegers:testIngegerByLengthOne()
	for _=1,1000 do
		local number = numbers:IntegerByLength(1)
		lu.assertTrue(number >= 0 and number < 10)
	end
end


function TestIntegers:testIngegerByLengthTwo()
	for _=1,1000 do
		local number = numbers:IntegerByLength(2)
		lu.assertTrue(number >= 10 and number < 100)
	end
end

os.exit( lu.LuaUnit.run() )
