# Developer Notes

## Dependencies

```shell
luarocks install luaunit #Unit tests
```

## Debugging

For debugging this plugin while working on it:

```shell 
# exit vim
make start
```

Navigate to `./lua/randomness/debug/init.lua` and execute `:so`
Open any buffer you like and explicitly call Lua function:

```
:lua require("randomness"):Integers()
```

