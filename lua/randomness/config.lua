
--- @class Config
--- @field defaults ConfigDefaults
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
Config = {
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
Config.__index = Config

--- @return table default configuration
function Config.DefaultConfig()
	return Config
end

return Config
