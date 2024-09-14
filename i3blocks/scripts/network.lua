#!/usr/bin/env luajit

local colors = require 'scripts.colors'
local output = ' '
local exit_code = 0

local device_handle = io.popen 'nmcli device'
local wifi_handle = io.popen 'nmcli device wifi'
if not device_handle or not wifi_handle then
	exit_code = 33
	print(
		'<span foreground="'
			.. colors.BRIGHT_RED
			.. '">'
			.. 'NM ERR!'
			.. '</span>'
	)
	os.exit(exit_code)
	return
end

local devices = {}
local is_wifi = false
for line in device_handle:lines() do
	local device, dtype, state, connection =
		line:match '(%S+)%s+(%S+)%s+([%w%p%s]+)%s+(%S+)'
	if device and dtype and state and connection and (device ~= 'DEVICE') then
		state = state:match '^%s*(.-)%s*$'
		if
			(state:match 'connected')
			and not (state:match 'disconnected')
			and (not dtype:match 'loopback')
		then
			devices[#devices + 1] = {
				device = device,
				type = dtype,
				state = state,
				connection = connection,
			}
			if dtype:match 'wifi' then
				is_wifi = true
			end
		end
	end
end

local con_wifi = {}
if is_wifi then
	for line in wifi_handle:lines() do
		local in_use, ssid, signal =
			line:match '([%s%*]*)%S+%s*(%S+)%s*%S+%s*%S+%s*%d+ %S+%s*(%S+).*'
		if in_use and in_use:match '%*' then
			con_wifi[#con_wifi + 1] = { ssid = ssid, signal = tonumber(signal) }
		end
	end
end

if #devices > 0 then
	for _, value in pairs(devices) do
		output = output
			.. '<span foreground="'
			.. colors.FOREGROUND
			.. '">'
			.. value.device
			.. '</span>'
	end
	if #con_wifi > 0 then
		for _, value in pairs(con_wifi) do
			local col = colors.REGULAR_WHITE

			if value.signal > 66 then
				col = colors.BRIGHT_CYAN
			elseif value.signal > 33 then
				col = colors.BRIGHT_MAGENTA
			end

			output = output
				.. ' <span foreground="'
				.. col
				.. '">'
				.. value.ssid
				.. ':'
				.. value.signal
				.. '%'
				.. '</span>'
		end
	end
else
	output = '<span foreground="'
		.. colors.REGULAR_GREEN
		.. '">'
		.. 'NO NET!'
		.. '</span>'
end

print(output)
os.exit(exit_code)
