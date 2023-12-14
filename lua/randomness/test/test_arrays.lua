local arrays = require("randomness.arrays")
local lu = require("luaunit")

local arrayOptions = {
	delimiter = ",",
	openingBracket = "[",
	closingBracket = "]",
}

TestArrays = {}
function TestArrays:testConstructor()
	local array = arrays:New({1, 2, 3, 4, 5, 6}, arrayOptions)
	lu.assertEquals(array.values, {1, 2, 3, 4, 5, 6})
	lu.assertEquals(array.options.delimiter, ",")
	lu.assertEquals(array.options.openingBracket, "[")
	lu.assertEquals(array.options.closingBracket, "]")
end


function TestArrays:testConstructorDefaultParameters()
	---@diagnostic disable-next-line: missing-parameter
	local array = arrays:New({1, 2, 3, 4, 5, 6})
	lu.assertEquals(array.values, {1, 2, 3, 4, 5, 6})
	lu.assertEquals(array.options.delimiter, ",")
	lu.assertEquals(array.options.openingBracket, "[")
	lu.assertEquals(array.options.closingBracket, "]")
end

function TestArrays:testConstructorWithDifferentObjects()
	local modifiedArrayOptions = {
		delimiter = ";",
		openingBracket = "{",
		closingBracket = "}",
	}
	local array1 = arrays:New({1, 2, 3}, modifiedArrayOptions)
	local array2 = arrays:New({"hello", "hi", "salut"}, arrayOptions)

	lu.assertNotEquals(array1.values, array2.values)
	lu.assertNotEquals(array1.options.delimiter, array2.options.delimiter)
	lu.assertNotEquals(array1.options.openingBracket, array2.options.openingBracket)
	lu.assertNotEquals(array1.options.closingBracket, array2.options.closingBracket)
end

function TestArrays:testToStringMultipleValues()
	local array = arrays:New({1, 2, 3}, arrayOptions)
	local s = array:ToString()

	lu.assertEquals(s, "[1,2,3]")
end


function TestArrays:testToStringSingleValue()
	local array = arrays:New({1}, arrayOptions)
	local s = array:ToString()

	lu.assertEquals(s, "[1]")
end

function TestArrays:testToStringNoValues()
	local array = arrays:New({}, arrayOptions)
	local s = array:ToString()

	lu.assertEquals(s, "[]")
end

os.exit( lu.LuaUnit.run() )
