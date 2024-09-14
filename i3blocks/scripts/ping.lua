#!/usr/bin/env luajit

local colors = require 'scripts.colors'
local output = ' '
local exit_code = 0

local parse_ping_output = function(ping_output)
	local packet_loss = 0
	local avg_ping = 0

	if ping_output:find 'ping: %.*' then
		packet_loss = 100
		return {
			packet_loss = packet_loss,
			avg_ping = math.maxinteger,
		}
	end

	local transmitted, received, loss_percent =
		ping_output:match '(%d+) packets transmitted, (%d+) received, (%d+)%% packet loss'
	if transmitted and received and loss_percent then
		packet_loss = tonumber(loss_percent)
	end

	local min_ping, avg_ping_str, max_ping, mdev_ping =
		ping_output:match 'rtt min/avg/max/mdev = ([%d%.]+)/([%d%.]+)/([%d%.]+)/([%d%.]+)'
	if avg_ping_str then
		avg_ping = tonumber(avg_ping_str)
	end

	return {
		packet_loss = packet_loss or 0,
		avg_ping = avg_ping or 0,
	}
end

local localhost_handle = io.popen 'ping -c 2 0 2>&1'
local internet_handle = io.popen 'ping -c 8 8.8.8.8 2>&1'
local dns_handle = io.popen 'ping -c 4 example.com 2>&1'

local localhost_t = nil
local internet_t = nil
local dns_t = nil
if localhost_handle and dns_handle and internet_handle then
	local localhost_str = localhost_handle:read '*a'
	localhost_handle:close()
	localhost_t = parse_ping_output(localhost_str)

	local dns_str = dns_handle:read '*a'
	dns_handle:close()
	dns_t = parse_ping_output(dns_str)

	local internet_str = internet_handle:read '*a'
	internet_handle:close()
	internet_t = parse_ping_output(internet_str)

	if localhost_t.packet_loss > 0 then
		output = output
			.. '<span foreground="'
			.. colors.BRIGHT_RED
			.. '">'
			.. 'NETWORKING STACK ERR!'
			.. '</span>'
		exit_code = 33
	elseif internet_t.packet_loss >= 99 then
		output = output
			.. '<span foreground="'
			.. colors.REGULAR_WHITE
			.. '">'
			.. 'NO NET!'
			.. '</span>'
	elseif dns_t.packet_loss >= 99 then
		output = output
			.. '<span foreground="'
			.. colors.BRIGHT_RED
			.. '">'
			.. 'DNS ERR!'
			.. '</span>'
		exit_code = 33
	else
		if internet_t.avg_ping < 10 then
			output = output
				.. '<span foreground="'
				.. colors.BRIGHT_GREEN
				.. '">'
		elseif internet_t.avg_ping < 100 then
			output = output
				.. '<span foreground="'
				.. colors.REGULAR_WHITE
				.. '">'
		else
			output = output
				.. '<span foreground="'
				.. colors.REGULAR_MAGENTA
				.. '">'
		end
		output = output .. 'PING:' .. tostring(internet_t.avg_ping) .. '</span>'
	end
else
	output = output .. 'PING ERR!'
	exit_code = 33
end

output = output .. ' '
print(output)
os.exit(exit_code)
