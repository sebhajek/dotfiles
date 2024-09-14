#!/usr/bin/env luajit

local colors = require 'scripts.colors'
local output = ' '
local exit_code = 0

---@class Battery
---@field number string
---@field state 'Charging' | 'Discharging' | 'Unknown'
---@field charge number

---@param handle file*
---@return Battery[]
local parse_battery_info = function(handle)
	local batteries = {}
	for line in handle:lines 'l' do
		for number, state, charge in
			string.gmatch(line, '%a* (%d+): (%a+), (%d+)%%')
		do
			batteries[#batteries + 1] =
				{ number = number, state = state, charge = tonumber(charge) }
		end
	end
	return batteries
end

---@param batteries Battery[]
---@return string[]
local stringify_battery_info = function(batteries)
	local battery_outs = {}

	for _, b in ipairs(batteries) do
		if b.state == 'Unknown' then
			goto continue
		end

		if b.charge >= 100 then
			battery_outs[#battery_outs + 1] = '<span foreground="'
				.. colors.BRIGHT_WHITE
				.. '">BAT'
				.. b.number
				.. ' '
				.. tostring(b.charge)
				.. '%</span>'
		elseif b.state == 'Charging' then
			battery_outs[#battery_outs + 1] = '<span foreground="'
				.. colors.REGULAR_CYAN
				.. '">BAT'
				.. b.number
				.. ' +'
				.. tostring(b.charge)
				.. '%</span>'
		elseif b.state == 'Discharging' and b.charge < 25 then
			exit_code = 33
			battery_outs[#battery_outs + 1] = '<span foreground="'
				.. colors.REGULAR_RED
				.. '">BAT'
				.. b.number
				.. ' !'
				.. tostring(b.charge)
				.. '%</span>'
		else
			battery_outs[#battery_outs + 1] = '<span foreground="'
				.. colors.BRIGHT_MAGENTA
				.. '">BAT'
				.. b.number
				.. ' -'
				.. tostring(b.charge)
				.. '%</span>'
		end

		::continue::
	end

	return battery_outs
end

local handle = io.popen 'acpi -b'
if handle == nil then
	output = 'BAT ERR!'
	exit_code = 33
else
	local batteries = parse_battery_info(handle)
	local battery_outs = stringify_battery_info(batteries)
	if #battery_outs <= 0 then
		output = ''
	else
		for _, outs in ipairs(battery_outs) do
			output = output .. ' ' .. outs
		end
		output = output .. ' '
	end
	handle:close()
end

print(output)

os.exit(exit_code)
