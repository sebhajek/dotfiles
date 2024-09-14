#!/usr/bin/env luajit

local colors = require 'scripts.colors'
local output = ' '
local exit_code = 0

local time_t = os.date '*t'

---@param str string
---@param n number
---@return string
local pad_with_zero = function(str, n)
	while #str < n do
		str = '0' .. str
	end
	return str
end

local date = time_t.year
	.. '-'
	.. pad_with_zero(tostring(time_t.month), 2)
	.. '-'
	.. pad_with_zero(tostring(time_t.day), 2)
local time = pad_with_zero(tostring(time_t.hour), 2)
	.. ':'
	.. pad_with_zero(tostring(time_t.min), 2)

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
output = output .. time .. '</span> '

print(output)

os.exit(exit_code)
