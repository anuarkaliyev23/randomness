local utils = require("randomness.utils")

--- @class Config
--- @field defaults ConfigDefaults
--- @field logLevel string
--
--- @class ConfigDefaults
--- @field integers ConfigDefaultsInteger
--- @field arrays ConfigDefaultsArray
-- 
--- @class ConfigDefaultsInteger
--- @field min integer
--- @field max integer
-- 
--- @class ConfigDefaultsArray
--- @field delimiter string
--- @field openingBracket string 
--- @field closingBracket string
--- @field length integer
Config = {
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
			length = 10,
		}
	}
}

--- @return Config
function Config:New()
	local config = utils.tableDeepCopy(Config)
	return config
end


return Config
