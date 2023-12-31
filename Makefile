LUA_ROOT =lua
TEST_FOLDER =randomness/test

start:
	nvim --cmd "set rtp+=./" --clean

test:
	(cd lua \
		&& lua "$(TEST_FOLDER)/test_arrays.lua" \
		&& lua "$(TEST_FOLDER)/test_numbers.lua"\
		&& lua "$(TEST_FOLDER)/test_strings.lua"\
		&& lua "$(TEST_FOLDER)/test_utils.lua" \
		&& lua "$(TEST_FOLDER)/test_config.lua")
	
lint:
	luacheck lua/
