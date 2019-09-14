--####################################
--# Damage SQL storing
--#

local sqlWait = 1

local JAG = JAM.Garage

local _debug = false
local _debugAll = false
local _cars ={}
local _carsOld = {}

RegisterServerEvent('storedCar')
AddEventHandler('storedCar', function(veh)
	for k,v in pairs(_cars) do
		if v.plate == veh.plate and v.model == veh.model then
			table.remove(_cars, k)
			
			if _carsOld[k] then
				table.remove(_carsOld, k)
			end
		end
	end
end)

RegisterServerEvent('JAG:UpdateDMG')
AddEventHandler('JAG:UpdateDMG', function(veh, dmg)
	TriggerClientEvent('JAG:UpdateDMG', -1, veh, dmg)
end)

RegisterServerEvent('upDateCars')
AddEventHandler('upDateCars', function(veh)
	dbug('upDateCars:UPDATING! ' .. #_cars)
	local foundcar = false
	for k,v in pairs(_cars) do
		if v.plate == veh.plate and v.model == veh.model then

			if v.damage.body ~= veh.damage.body then
				dbug('upDateCars|UPDATED BODY!')
				_cars[k].damage.body = veh.damage.body
			end
			if v.damage.engine ~= veh.damage.engine then
				dbug('upDateCars|UPDATED ENGINE!')
				_cars[k].damage.engine = veh.damage.engine
			end
			if v.damage.tank ~= veh.damage.tank then
				dbug('upDateCars|UPDATED TANK!')
				_cars[k].damage.tank = veh.damage.tank
			end
			if v.fuel ~= veh.fuel then
				dbug('upDateCars|UPDATED FUEL!')
				_cars[k].fuel = veh.fuel
			end
			if v.headlight ~= veh.headlight then
				dbug('upDateCars|UPDATED HEADLIGHTS!')
				_cars[k].headlight = veh.headlight
			end
			if v.loc ~= veh.loc then
				dbug('upDateCars|UPDATED LOCATION!')
				_cars[k].loc = veh.loc
			end
			foundcar = true
			break
		end
	end
	if #_cars == 0 or not foundcar then
		dbug('upDateCars|ADD CAR!')

		table.insert(_cars,veh)
	end
end)

RegisterServerEvent('setDetails')
AddEventHandler('setDetails', function(veh)

	local _veh = veh.model
	local _plate = veh.plate
	local _fuel = veh.fuel
	local _damage = veh.damage
	local _loc = veh.loc
	local _headlight = veh.headlight
	--dbug('setDetails: '.. _plate)
	--MySQL.Sync.execute("UPDATE owned_vehicles SET jamstate=@state WHERE plate=@plate",{['@state'] = state , ['@plate'] = plate})
	MySQL.Sync.execute("UPDATE owned_vehicles_details SET body=@body, engine=@engine, tank=@tank, fuel=@fuel, garagex=@garagex, garagey=@garagey, headlight=@headlight WHERE plate=@plate and model=@model",{['@body'] = _damage.body, ['@engine'] = _damage.engine, ['@tank'] = _damage.tank, ['@fuel'] = _fuel, ['@garagex'] = _loc.x, ['@garagey'] = _loc.y, ['@headlight'] = _headlight, ['@plate'] = _plate, ['@model'] = _veh})
end)

RegisterServerEvent('setGarage')
AddEventHandler('setGarage', function(veh,job)
	local closestGarage = 999999
	local closestLoc
	local _loc = veh.loc
	local name
	local i = 0
	for key,val in pairs(JAG.Config.Markers) do
			local x = _loc.x - val.Pos.x
			local y = _loc.y - val.Pos.y
			x = x * x
			y = y * y
			local z = x+y
			local s = math.sqrt(z)
			local _dist = s

			--if _dist > 0 or _dist < 0 then
			--	print(_loc.x .. ', ' ..  _loc.y .. ', ' ..  val.Pos.x .. ', ' ..  val.Pos.y .. ' YES')
			--else
			--	print(z ..', ' .. s)
			--	print(x ..', ' .. y)
			--	print(_loc.x .. ', ' ..  _loc.y .. ', ' ..  val.Pos.x .. ', ' ..  val.Pos.y .. ' NO')
			--end
			if (_dist < closestGarage) and (val.Zone == "Garage") and (tostring(val.Private) == "false") then
				closestGarage = _dist
				closestLoc = val.Pos
				name = key
			elseif (_dist < closestGarage) and tostring(val.Private) == job then
				closestGarage = _dist
				closestLoc = val.Pos
				name = key
			end
			i = i + 1
	end
	--MySQL.Sync.execute("UPDATE owned_vehicles SET jamstate=@state WHERE plate=@plate",{['@state'] = state , ['@plate'] = plate})
	if closestGarage >= 10 then
		MySQL.Sync.execute("UPDATE owned_vehicles_details SET garagex=@garagex, garagey=@garagey WHERE plate=@plate and model=@model",{['@garagex'] = closestLoc.x, ['@garagey'] = closestLoc.y, ['@plate'] = veh.plate, ['@model'] = veh.model})
		veh.loc = closestLoc
	end
end)

RegisterServerEvent('createDetails')
AddEventHandler('createDetails', function(veh)

	local _veh = veh.vehicle.model
	local _plate = veh.plate
	local _fuel = 100.0
	local _damage = {
		engine = 1000.0,
		body = 1000.0,
		tank = 1000.0
	}
	local _loc = {
		x = 0.0,
		y = 0.0
	}
	dbug('createDetails:IN')
	local _headlight = 255
	local _source = source
	local xPlayer
	while not xPlayer do
		xPlayer = JAM.ESX.GetPlayerFromId(source)
		Wait(0)
		--dbug('createDetails:WAITING')
	end
	--dbug('createDetails: '.. xPlayer.identifier)
	--MySQL.Sync.execute("UPDATE owned_vehicles SET jamstate=@state WHERE plate=@plate",{['@state'] = state , ['@plate'] = plate})
	--MySQL.Sync.execute("UPDATE owned_vehicles_details SET body=@body, engine=@engine, tank=@tank, fuel=@fuel, garagex=@garagex, garagey=@garagey, headlight=@headlight WHERE plate=@plate and model=@model",{['@body'] = _damage.body, ['@engine'] = _damage.engine, ['@tank'] = _damage.tank, ['@fuel'] = _fuel, ['@garagex'] = _loc.x, ['@garagey'] = _loc.y, ['@headlight'] = _headlight, ['@plate'] = _plate, ['@model'] = _veh})
	if xPlayer ~= nil then
		MySQL.Async.execute('INSERT INTO `owned_vehicles_details` (id, plate, model, body, engine, tank, fuel, garagex, garagey, headlight) VALUES (@id, @plate, @model, @body, @engine, @tank, @fuel, @garagex, @garagey, @headlight)', {
			['@id'] 				= xPlayer.identifier,
			['@plate']      = _plate,
			['@model']      = _veh,
			['@body']       = _damage.body,
			['@engine'] 		= _damage.engine,
			['@tank']       = _damage.tank,
			['@fuel'] 			= _fuel,
			['@garagex']    = _loc.x,
			['@garagey'] 		= _loc.y,
			['@headlight']  = 255
		}, function(rowsChanged)
		end)
	end
end)


function updateDetails()
	local start = GetGameTimer()
	local _carslast = _cars
	for k,v in pairs(_cars) do
		if _carsOld[k] ~= nil then
			if not compareCars(v,_carsOld[k]) then
				dbug('updateDetails:func:DIFFERENT ~ Backing up! ' .. #_cars)
				MySQL.Sync.execute("UPDATE owned_vehicles_details SET body=@body, engine=@engine, tank=@tank, fuel=@fuel, headlight=@headlight, garagex=@garagex, garagey=@garagey WHERE plate=@plate and model=@model",{['@body'] = v.damage.body, ['@engine'] = v.damage.engine, ['@tank'] = v.damage.tank, ['@fuel'] = v.fuel, ['@headlight'] = v.headlight, ['@plate'] = v.plate, ['@model'] = v.model, ['@garagex'] = v.loc.x, ['@garagey'] = v.loc.y})
				 _carsOld[k] = deepcopy(v)
			end
		else
			dbug('updateDetails:func:NEW ~ Backing up!' .. #_cars)
			table.insert(_carsOld, deepcopy(v))
			MySQL.Sync.execute("UPDATE owned_vehicles_details SET body=@body, engine=@engine, tank=@tank, fuel=@fuel, headlight=@headlight, garagex=@garagex, garagey=@garagey WHERE plate=@plate and model=@model",{['@body'] = v.damage.body, ['@engine'] = v.damage.engine, ['@tank'] = v.damage.tank, ['@fuel'] = v.fuel, ['@headlight'] = v.headlight, ['@plate'] = v.plate, ['@model'] = v.model, ['@garagex'] = v.loc.x, ['@garagey'] = v.loc.y})
		end
	end
end

function deepcopy(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            copies[orig] = copy
            setmetatable(copy, deepcopy(getmetatable(orig), copies))
            for orig_key, orig_value in next, orig, nil do
                copy[deepcopy(orig_key, copies)] = deepcopy(orig_value, copies)
            end
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function compareCars(a,b)
	local same = true
	if a.damage.body ~= b.damage.body then
		dbug('compareCars:body ' .. a.damage.body .. ', ' .. b.damage.body)
		same = false
	end
	if a.damage.engine ~= b.damage.engine then
		dbug('compareCars:engine ' .. a.damage.engine .. ', ' .. b.damage.engine)
		same = false
	end
	if a.damage.tank ~= b.damage.tank then
	dbug('compareCars:tank ' .. a.damage.tank .. ', ' .. b.damage.tank)
		same = false
	end
	if a.fuel ~= b.fuel then
	dbug('compareCars:fuel ' .. a.fuel .. ', ' .. b.fuel)
		same = false
	end
	if a.headlight ~= b.headlight then
	dbug('compareCars:headlight ' .. a.headlight .. ', ' .. b.headlight)
		same = false
	end
	if a.loc ~= b.loc then
	dbug('compareCars:headlight ' .. a.loc .. ', ' .. b.loc)
		same = false
	end
	return same
end

ESX.RegisterServerCallback('getDetails', function(source, cb)

	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles_details")
	local _data = {}

	for key,val in pairs(data) do
		table.insert(_data,{
			model = val.model,
			plate = val.plate,
			fuel = val.fuel,
			damage = {
				body = val.body,
				engine = val.engine,
				tank = val.tank
			},
			loc = {
				x = val.garagex,
				y = val.garagey
			},
			headlight = val.headlight
		})
	end
	cb(_data)
end)
--function checkOwnedCars(veh)
--end


local lastUpload = GetGameTimer()

Citizen.CreateThread(function()
	while true do
		if (GetGameTimer() - lastUpload) > (sqlWait * 60 * 1000) then
			--updateSQL
			lastUpload=GetGameTimer()
			dbug('TIMER: Datbase Update!')
			updateDetails()
		end
		Wait(1000)
	end
end)

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

string.lpad = function(str, len, char)
    if char == nil then char = ' ' end
    return str .. string.rep(char, len - #str)
end

function dbug(str)
	if _debug and str ~= nil then
		local _timerun = GetGameTimer()
		if _timerun >= 60000 then
			print(string.lpad(fmtTime(GetGameTimer()),14,' ') .. ' | ' .. tostring(str))
		elseif _timerun >= 3600000 then
			print(string.lpad(fmtTime(GetGameTimer()),24,' ') .. ' | ' .. tostring(str))
		elseif _timerun >= 36000000 then
			print(string.lpad(fmtTime(GetGameTimer()),28,' ') .. ' | ' .. tostring(str) ..' ~~ RESTART ME!')
		else
			print(string.lpad(fmtTime(GetGameTimer()),10,' ') .. ' | ' .. tostring(str))
		end
	end
end

function dbugAll(str)
	if _debugAll and str ~= nil  then
		print(fmtTime(GetGameTimer()) .. ' | ' .. str)
	end
end
RegisterServerEvent('dbug')
RegisterNetEvent('dbug')
AddEventHandler('dbug', function(str)
	dbug(str)
end)
