# Randomness plugin for Neovim

> ⚠️  
> Work in progress  
> Required Neovim version: 0.1.0+

This plugin allows random values:

- [x] integers
- [ ] strings
- [ ] UUID
- [ ] hex

## Motivation

This is an educational project for me to better understand how Neovim's plugins work. This plugin took heavy inspiration from [Randomness](https://plugins.jetbrains.com/plugin/9836-randomness) albeit being very limited in its functions.

## How to use this plugin

### Installation

```lua
-- using Packer
use "anuarkaliyev23/randomness"
```

### Configuration

```lua
randomness = require("randomness")

-- Mind the colon!
randomness:setup()
```

You can provide custom configuration table to `setup()` function.

```lua
randomness = require("randomness")
config = require("randomness.config"):New()

-- Mind the colon!
randomness:setup(config)
```

#### Default Configuration

```lua
config = {
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
		}
	}
}
```

Every call to `require("randomness.config"):New()` will create exact copy of aforementioned table

### API

API exposes several methods to generate random values

```lua
randomness = require("randomness")

--- @param min integer
--- @param max integer
-- Parameters will be substituted with defaults if being omitted
-- Generates random integer in range [min, max]
randomness:Integer(min, max)

--- @param min integer
--- @param max integer
--- @param count integer
--- @param arrayConfig table -- specifies how array should be serialized to string
-- Parameters will be substituted with defaults if being omitted
-- Generates integer array of given `count` length. Every integer will be in [min, max] range.
randomness:Integers(min, max, count, arrayConfig)
```

This API methods should be remapped to your preference.

> Plugin do not provide any default mappings.

## See also

- [vim-fake](https://github.com/tkhren/vim-fake)
- [how to generate random numbers in nvim](https://vi.stackexchange.com/questions/807/how-to-generate-random-numbers)
