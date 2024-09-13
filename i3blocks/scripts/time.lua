#!/usr/bin/env luajit

local colors = require 'colors'
local output = ' '
local exit_code = 0

local time_t = os.date '*t'
local date = time_t.year .. '-' .. time_t.month .. '-' .. time_t.day
local time = time_t.hour .. ':' .. time_t.min
local time_n = time_t.hour + (time_t.min / 60)

output = output
	.. '<span foreground="'
	.. colors.BRIGHT_WHITE
	.. '">'
	.. date
	.. '/</span>'

local daylight = 7.5
local nightlight = daylight + 12
if time_n >= daylight and time_n <= nightlight then
	output = output .. '<span foreground="' .. colors.FOREGROUND .. '">'
else
	output = output .. '<span foreground="' .. colors.BRIGHT_MAGENTA .. '">'
end
output = output .. time .. '</span>'

print(output)

os.exit(exit_code)
