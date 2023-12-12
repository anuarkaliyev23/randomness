local arrays = require("randomness.arrays")
local lu = require("luaunit")

TestArrays = {}

function TestArrays:testConstructor()
	local array = arrays:New({1, 2, 3, 4, 5, 6}, ",", "[", "]")
	lu.assertEquals(array.values, {1, 2, 3, 4, 5, 6})
	lu.assertEquals(array.delimiter, ",")
	lu.assertEquals(array.openingBracket, "[")
	lu.assertEquals(array.closingBracket, "]")
end


function TestArrays:testConstructorDefaultParameters()
	---@diagnostic disable-next-line: missing-parameter
	local array = arrays:New({1, 2, 3, 4, 5, 6})
	lu.assertEquals(array.values, {1, 2, 3, 4, 5, 6})
	lu.assertEquals(array.delimiter, ",")
	lu.assertEquals(array.openingBracket, "[")
	lu.assertEquals(array.closingBracket, "]")
end

function TestArrays:testConstructorWithDifferentObjects()
	local array1 = arrays:New({1, 2, 3}, ",", "{", "}")
	local array2 = arrays:New({"hello", "hi", "salut"}, ";", "[", "]")

	lu.assertNotEquals(array1.values, array2.values)
	lu.assertNotEquals(array1.delimiter, array2.delimiter)
	lu.assertNotEquals(array1.openingBracket, array2.openingBracket)
	lu.assertNotEquals(array1.closingBracket, array2.closingBracket)
end

function TestArrays:testToStringMultipleValues()
	local array = arrays:New({1, 2, 3}, ",", "[", "]")
	local s = array:ToString()

	lu.assertEquals(s, "[1,2,3]")
end


function TestArrays:testToStringSingleValue()
	local array = arrays:New({1}, ",", "[", "]")
	local s = array:ToString()

	lu.assertEquals(s, "[1]")
end

function TestArrays:testToStringNoValues()
	local array = arrays:New({}, ",", "[", "]")
	local s = array:ToString()

	lu.assertEquals(s, "[]")
end

os.exit( lu.LuaUnit.run() )
