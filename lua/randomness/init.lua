local logger = require("randomness.logger")
local conf = require("randomness.config")

logger.level = config.logLevel

--- @class Randomness
--- @field config Config
Randomness = {}
Randomness.__index = Randomness

--- @param config Config
function Randomness.setup(self, config)
	if not config = 
	self.config = config
end

return Randomness
