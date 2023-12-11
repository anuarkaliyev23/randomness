LUA_ROOT =lua
TEST_FOLDER =randomness/test

start:
	nvim --cmd "set rtp+=./"

test:
	chmod +x ./run-tests.sh
	./run-tests.sh
	
lint:
	luacheck lua/
