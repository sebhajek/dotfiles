#!/usr/bin/env luajit

local colors = require 'scripts.colors'
local output = ' '
local exit_code = 0

local xkb_handle = io.popen 'swaymsg -t get_inputs'

if xkb_handle then
	xkb_handle:close()
end

output = output .. ' '
print(output)
os.exit(exit_code)
