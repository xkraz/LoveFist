--####################################
--# Damage SQL storing
--#

local _debug = false
local _debugAll = false

local ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
end)

RegisterNetEvent('setDetails')
AddEventHandler('setDetails', function(veh)
	local starttime = GetGameTimer()
	local _veh = veh
	TriggerServerEvent('setDetails', _veh)

	--dbug('setDetails|plate ' .. _plate)
	--dbug('setDetails|veh ' .. _model)
	--dbug('setDetails|dmg ' .. _dmg.body..', ' .. _dmg.engine ..', ' .. _dmg.tank)
	--dbug('setDetails|loc x:' .. _loc.x ..', y:' .. _loc.y)
	--dbug('setDetails|time: ' .. GetGameTimer() - starttime .. 'ms')

end)

RegisterNetEvent('getDetails')
AddEventHandler('getDetails', function(plate,veh)

	local starttime = GetGameTimer()
	local _plate = plate
	local _veh = veh
	local p = GetEntityCoords(PlayerPedId())

	local _localVeh={
		plate = plate,
		model = veh,
		body=1000.0,
		engine=1000.0,
		tank=1000.0,
		fuel=100.0,
		loc = vector3(0,0,0),
		garagex=p.x,
		garagey=p.y
	}

	ESX.TriggerServerCallback('getDetails', function(data)
		for k,v in pairs(data) do
			if v.plate == _plate and v.model == _veh then
				_localVeh = v
			end
		end

		if _localVeh.garagex == nil then
			local pc = GetEntityCoords(PlayerPedId())
			_localVeh.garagex=pc.x
			_localVeh.garagey=pc.y
		end

		--dbug('getDetails|plate ' .. _plate)
		--dbug('getDetails|_localVeh.plate ' .. _localVeh.plate)
		--dbug('getDetails|_localVeh.model ' .. _localVeh.model)
		--dbug('getDetails|dmg ' .. _localVeh.body..', ' .. _localVeh.engine ..', ' .. _localVeh.tank ..', ' .. _localVeh.fuel)
		--dbug('getDetails|loc x:' .. _localVeh.garagex ..', y:' .. _localVeh.garagey)
	--	dbug('getDetails|time: ' .. GetGameTimer() - starttime .. 'ms')
	end)
end)

local lastUpload = GetGameTimer()
local wasdriving = false
local neon = {nil,nil,nil,nil}
local lastID
local storing = false
Citizen.CreateThread(function()

	while true do

		if (GetGameTimer() - lastUpload) > (1 * 100) then
			--updateSQL
			local vID = GetVehiclePedIsIn(PlayerPedId(), false)
			if vID ~= 0 and GetPedInVehicleSeat(vID, -1) == GetPlayerPed(PlayerId()) then

				if (GetGameTimer() - lastUpload) < (1 * 1000) then

					if neon[0] == nil and (IsVehicleNeonLightEnabled(vID, 0) == 1) then
						neon[0] = true
					end
					if neon[1] == nil and (IsVehicleNeonLightEnabled(vID, 1) == 1) then
						neon[1] = true
					end
					if neon[2] == nil and (IsVehicleNeonLightEnabled(vID, 2) == 1) then
						neon[2] = true
					end
					if neon[3] == nil and (IsVehicleNeonLightEnabled(vID, 3) == 1) then
						neon[3] = true
					end

					local _,llightson,lhighbeams = GetVehicleLightsState(vID, 0)			-- Left Beams
					local _,rlightson,rhighbeams = GetVehicleLightsState(vID, 1)

					local LHeadlight = Citizen.InvokeNative(0x5EF77C9ADD3B11A3,vID)		-- Left HeadLight
					local RHeadlight = Citizen.InvokeNative(0xA7ECB73355EB2F20,vID)

					if llightson == 1 or rlightson == 1 or lhighbeams == 1 or rhighbeams == 1 and not(storing) then
						if not(LHeadlight) and not(RHeadlight) then
							for i=0,3 do
								if not(neon[i] == nil) then SetVehicleNeonLightEnabled(vID, i, neon[i]) end
							end
						else
							for i=0,3 do
								if not(neon[i] == nil) then SetVehicleNeonLightEnabled(vID, i, false) end
							end
						end
					else
						for i=0,3 do
							if not(neon[i] == nil) then SetVehicleNeonLightEnabled(vID, i, false) end
						end
					end
				else
					local car = {
						id = vID,
						model = GetHashKey(GetEntityModel(vID)),
						plate = GetVehicleNumberPlateText(vID),
						fuel = GetVehicleFuelLevel(vID),
						damage = {
							body = GetVehicleBodyHealth(vID),
							engine = GetVehicleEngineHealth(vID),
							tank = GetVehiclePetrolTankHealth(vID)
						},
						headlight = GetVehicleHeadlightsColour(vID),
						loc = GetEntityCoords(vID)
					}
					TriggerServerEvent('JAG:UpdateDMG',vID, car)
					TriggerServerEvent('upDateCars', car)
					lastID = vID
					wasdriving = true
					lastUpload=GetGameTimer()
				end
			end

			if vID == 0 and wasdriving then

				for i=0,3 do
					if not(neon[i] == nil) then SetVehicleNeonLightEnabled(lastID, i, neon[i]) end
				end

				local nID = GetLastDrivenVehicle(GetPlayerPed(PlayerPedId()))
				if nID ~= -1 then
					while GetEntitySpeed(nID) > 0.2 do Citizen.Wait(1000) end
					local car = {
						id = nID,
						model = GetHashKey(GetEntityModel(nID)),
						plate = GetVehicleNumberPlateText(nID),
						fuel = GetVehicleFuelLevel(nID),
						damage = {
							body = GetVehicleBodyHealth(nID),
							engine = GetVehicleEngineHealth(nID),
							tank = GetVehiclePetrolTankHealth(nID)
						},
						headlight = GetVehicleHeadlightsColour(nID),
						loc = GetEntityCoords(nID)
					}
					TriggerServerEvent('upDateCars', car)
				end
				wasdriving = false
			end

			if vID == 0 and not(storing) and lastID ~= nil then
				neon = {nil,nil,nil,nil}
				lastID = nil
			end
		end
		Citizen.Wait(10)
	end
end)

RegisterNetEvent('JAG:NeonOn')
AddEventHandler('JAG:NeonOn', function()
	storing = true
	for i=0,3 do
		if not(neon[i] == nil) then SetVehicleNeonLightEnabled(lastID, i, neon[i]) end
	end
end)

RegisterNetEvent('JAG:NeonOnDone')
AddEventHandler('JAG:NeonOnDone', function()
	storing = false
end)

RegisterNetEvent('JAG:UpdateDMG')
AddEventHandler('JAG:UpdateDMG', function(veh, dmg)
	SetVehicleFuelLevel(veh, dmg.fuel)
	SetVehicleBodyHealth(veh, dmg.damage.body)
	SetVehicleEngineHealth(veh, dmg.damage.engine)
	SetVehiclePetrolTankHealth(veh, dmg.damage.tank)
end)

function dbug(str)
	if _debug then
		TriggerServerEvent('dbug', str)
	end
end

function dbugAll(str)
	if _debugAll then
		TriggerServerEvent('dbug', str)
	end
end
