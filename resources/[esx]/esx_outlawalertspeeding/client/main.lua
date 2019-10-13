ESX = nil

local timing, isPlayerWhitelisted = math.ceil(Config.Timer * 60000), false
local streetName

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

RegisterNetEvent('esx_outlawalertspeeding:outlawNotify')
AddEventHandler('esx_outlawalertspeeding:outlawNotify', function(alert)
	if isPlayerWhitelisted then
		ESX.ShowNotification(alert)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		if NetworkIsSessionStarted() then
			DecorRegister('isOutlaw', 3)
			DecorSetInt(PlayerPedId(), 'isOutlaw', 1)

			return
		end
	end
end)

-- Gets the player's current street.

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)

		local playerCoords = GetEntityCoords(PlayerPedId())
		streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		streetName = GetStreetNameFromHashKey(streetName)
	end
end)

function refreshPlayerWhitelisted()
	if not ESX.PlayerData then
		return false
	end

	if not ESX.PlayerData.job then
		return false
	end

	for k,v in ipairs(Config.WhitelistedCops) do
		if v == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end

RegisterNetEvent('esx_outlawalertspeeding:FelonySpeedingInProgress')
AddEventHandler('esx_outlawalertspeeding:FelonySpeedingInProgress', function(targetCoords)
	if isPlayerWhitelisted then
		if Config.FelonySpeedingAlert then
			local alpha = 250
			local SpeedingBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipSpeedingRadius)
			SetBlipHighDetail(SpeedingBlip, true)
			SetBlipColour(SpeedingBlip, 5)
			SetBlipAlpha(SpeedingBlip, alpha)
			SetBlipAsShortRange(SpeedingBlip, true)
			while alpha ~= 0 do
				Citizen.Wait(Config.BlipSpeedingTime * 4)
				alpha = alpha - 1
				SetBlipAlpha(SpeedingBlip, alpha)
				if alpha == 0 then
					RemoveBlip(SpeedingBlip)
				return
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)

		if DecorGetInt(PlayerPedId(), 'isOutlaw') == 2 then
			Citizen.Wait(timing)
			DecorSetInt(PlayerPedId(), 'isOutlaw', 1)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local vehicle = GetVehiclePedIsIn(playerPed, true)
		local vehicleclass = GetVehicleClass(spvehicle)
		local speed = (GetEntitySpeed(vehicle) * 2.236936)
		local report = 0
		if (speed >= 100) then
			report = 10
			if (speed >=110 and speed < 120) then
				report = 15
			elseif (speed >= 120 and speed <130) then
				report = 25
			elseif (speed >= 130 and speed <140) then
				report = 40
			elseif (speed >= 140 and speed <150) then
				report = 50
			elseif (speed >= 150 and speed <160) then
				report = 65
			elseif (speed >= 160) then
				report = 75
			end
			report = report + math.random(0,100)
			
		end
		if Config.FelonySpeedingAlert and (report >100) and (class~=15 and class~=16 and class~=18) then
			if vehicle and ((isPlayerWhitelisted) or not isPlayerWhitelisted) then
				local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
				vehicleLabel = GetLabelText(vehicleLabel)
				DecorSetInt(playerPed, 'isOutlaw', 2)
				TriggerServerEvent('esx_outlawalertspeeding:FelonySpeedingInProgress', {
					x = ESX.Math.Round(playerCoords.x, 1),
					y = ESX.Math.Round(playerCoords.y, 1),
					z = ESX.Math.Round(playerCoords.z, 1)
				}, streetName, vehicleLabel)
			end
			
		end
		Citizen.Wait(15000)
	end
end)
