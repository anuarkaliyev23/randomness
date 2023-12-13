local lu = require("luaunit")
local conf = require("randomness.config")

TestNew = {}
function TestNew:testCopyObject()
	local config1 = Config:New()
	local config2 = Config:New()

	lu.assertEquals(config1, config2)
end

function TestNew:testObjectModificationAfterCreation()
	local config1 = conf:New()
	local config2 = conf:New()

	lu.assertEquals(config1, config2)

	config1.logLevel = 'debug'
	config2.logLevel = 'error'

	config1.defaults.integers.min = -1000
	config1.defaults.integers.max = 1000

	config2.defaults.arrays.delimiter = ";"
	config2.defaults.arrays.openingBracket = "{"
	config2.defaults.arrays.closingBracket = "}"

	lu.assertEquals(config1.logLevel, 'debug')
	lu.assertEquals(config2.logLevel, 'error')

	lu.assertEquals(config1.defaults.integers.min, -1000)
	lu.assertEquals(config1.defaults.integers.max, 1000)
	lu.assertEquals(config2.defaults.integers.min, 0)
	lu.assertEquals(config2.defaults.integers.max, 100)

	lu.assertEquals(config1.defaults.arrays.delimiter, ",")
	lu.assertEquals(config1.defaults.arrays.openingBracket, "[")
	lu.assertEquals(config1.defaults.arrays.closingBracket, "]")

	lu.assertEquals(config2.defaults.arrays.delimiter, ";")
	lu.assertEquals(config2.defaults.arrays.openingBracket, "{")
	lu.assertEquals(config2.defaults.arrays.closingBracket, "}")
end

os.exit( lu.LuaUnit.run() )
