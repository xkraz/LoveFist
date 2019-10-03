
--require "ansicolors"
_debug = false

local colors = {
    -- attributes
    {label = '{reset}', num = 0},
    {label = '{clear}', num  = 0},
    {label = '{bright}', num  = 1},
    {label = '{dim}', num  = 2},
    {label = '{underscore}', num  = 4,},
    {label = '{blink}', num  = 5},
    {label = '{reverse}', num  = 7},
    {label = '{hidden}', num  = 8},

    -- foreground
    {label = '{black}', num  = 30},
    {label = '{red}', num  = 31},
    {label = '{green}', num  = 32},
    {label = '{yellow}', num  = 33},
    {label = '{blue}', num  = 34},
    {label = '{magenta}', num  = 35},
    {label = '{cyan}', num  = 36},
    {label = '{white}', num  = 37},

    -- background
    {label = '{onblack}', num  = 40},
    {label = '{onred}', num  = 41},
    {label = '{ongreen}', num  = 42},
    {label = '{onyellow}', num  = 43},
    {label = '{onblue}', num  = 44},
    {label = '{onmagenta}', num  = 45},
    {label = '{oncyan}', num  = 46},
    {label = '{onwhite}', num  = 47}
}

function dbug(str, name)
	if _debug and str ~= nil then
    local _reset = string.char(27) .. '[0m'
    local _gray =  string.char(27) .. '[90m'
    local _color = string.char(27) .. '[91m'
    local _str = tostring(str)

    if name ~= '[CONSOLE LOG]' then
      _color = string.char(27) .. '[96m'
    end

    for c,n in pairs(colors) do
      if string.find(_str,n.label)then
        _str = _str:gsub(n.label,tostring(string.char(27) .. '['.. n.num ..'m'))
      end
    end

		local _timerun = GetGameTimer()
		if _timerun >= 60000 then
			print(string.lpad(fmtTime(GetGameTimer()),14,' ') .. _reset .. ' |' .. _color .. string.lpad(name,14, ' ') .. _reset .. '| ' .. _gray .. tostring(_str) .. _reset)
		elseif _timerun >= 3600000 then
			print(string.lpad(fmtTime(GetGameTimer()),24,' ') .. _reset .. ' |' .. _color .. string.lpad(name,14, ' ') .. _reset .. '| ' .. _gray .. tostring(_str) .. _reset)
		elseif _timerun >= 36000000 then
			print(string.lpad(fmtTime(GetGameTimer()),28,' ') .. _reset .. ' |' .. _color .. string.lpad(name,14, ' ') .. _reset .. '| ' .. _gray .. tostring(_str) ..' ~~ RESTART ME!' .. _reset)
    else
			print(string.lpad(fmtTime(GetGameTimer()),10,' ') .. _reset .. ' |' .. _color .. string.lpad(name,14, ' ') .. _reset .. '| ' .. _gray .. tostring(_str) .. _reset)
		end
	end
end

string.lpad = function(str, len, char)
    if char == nil then char = ' ' end
    return str .. string.rep(char, len - #str)
end

function fmtTime(_in)
	local out = ""
	local _tmp = _in
	local _hour = (60*60000)
	local _minute = 60000
	local _second = 1000
 	if _in ~= nil then
		if _in >= (_hour) then
			local tmp = math.floor(_in / _hour)
			_in = _in - tmp * _hour
			out = tmp .. 'h'
		end

		if _in >= (_minute) then
			local tmp = math.floor(_in / _minute)
			_in = _in - tmp * _minute
			if out ~= "" then out = out .. " " end
			out = out .. tmp .. 'm'
		end

		if _in >= (_second) then
			local tmp = math.floor(_in / _second)
			_in = _in - tmp * _second
			if out ~= "" then out = out .. " " end
			out = out .. tmp .. 's'
		end

		if _in >= 1 then
			local tmp = _in
			_in = _in - tmp
			if out ~= "" then out = out .. " " end
			out = out .. tmp .. 'ms'
		end

		return out
	end
end

RegisterServerEvent('log')
AddEventHandler('log', function(text, name)
  local _text = text
  local _name = name  or '[CONSOLE LOG]'

    if _name ~= '[CONSOLE LOG]' then
     _name = '['.. string.upper(tostring(_name)) .. ']'
    end
  dbug(_text, _name)
end)

RegisterCommand('log', function(source, args)
  local _text = 'WE DID A LOG'
  local _name = args[1]  or '[CONSOLE LOG]'

  dbug(_text, _name)
end, true)
