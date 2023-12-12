LUA_ROOT =lua
TEST_FOLDER =randomness/test

start:
	nvim --cmd "set rtp+=./"

test:
	(cd lua \
		&& lua "$(TEST_FOLDER)/test_arrays.lua" \
		&& lua "$(TEST_FOLDER)/test_numbers.lua")
	
lint:
	luacheck lua/
