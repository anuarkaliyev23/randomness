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
--- @field options ArrayOptions
--- @field length integer
--
--- @class ConfigDefaultString
--- @field length integer
--- @field options StringOptions
Config = {
	logLevel = 'info',
	defaults = {
		integers = {
			min = 0,
			max = 100,
		},

		arrays = {
			options = {
				delimiter = ",",
				openingBracket = "[",
				closingBracket =  "]",
			},
			length = 10,
		},

		strings = {
			length = 12,
			options = {
				allowLetters = true,
				allowDigits = false,
			}
		}
	}
}

--- @return Config
function Config:New()
	local config = utils.tableDeepCopy(Config)
	return config
end


return Config
