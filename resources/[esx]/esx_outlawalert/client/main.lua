ESX = nil

local timing, isPlayerWhitelisted = math.ceil(Config.Timer * 60000), false
local streetName, playerGender

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	TriggerEvent('skinchanger:getSkin', function(skin)
		playerGender = skin.sex
	end)

	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)
function calcalarmrating(coordx, coordy)
	local dis = 0.0
	local tempdis = 0.0
	-- Calculate Distance to nearest PD Office or Pillbox
	--davis
	dis = GetDistanceBetweenCoords(coordx, coordy, 0.0, 368.0, -1599.0, 0.0, true)
	--del perro
	tempdis = GetDistanceBetweenCoords(coordx, coordy, 0.0, -1631.0, -1016.0, 0.0, true)
	if tempdis < dis then
		dis = tempdis
	end
	--la mesa
	tempdis = GetDistanceBetweenCoords(coordx, coordy, 0.0, 825.0, -1290.0, 0.0, true)
	if tempdis < dis then
		dis = tempdis
	end
	--mission
	tempdis = GetDistanceBetweenCoords(coordx, coordy, 0.0, 425.0, -979.0, 0.0, true)
	if tempdis < dis then
		dis = tempdis
	end
	--paleto
	tempdis = GetDistanceBetweenCoords(coordx, coordy, 0.0, -442.0, 6017.0, 0.0, true)
	if tempdis < dis then
		dis = tempdis
	end
	--rockford
	tempdis = GetDistanceBetweenCoords(coordx, coordy, 0.0, -559.0, -135.0, 0.0, true)
	if tempdis < dis then
		dis = tempdis
	end
	--sandy
	tempdis = GetDistanceBetweenCoords(coordx, coordy, 0.0, 1857.0, 3681.0, 0.0, true)
	if tempdis < dis then
		dis = tempdis
	end
	--vespuccibeach
	tempdis = GetDistanceBetweenCoords(coordx, coordy, 0.0, -1313.0, -1529.0, 0.0, true)
	if tempdis < dis then
		dis = tempdis
	end
	--vespucci
	tempdis = GetDistanceBetweenCoords(coordx, coordy, 0.0, -1112.0, -825.0, 0.0, true)
	if tempdis < dis then
		dis = tempdis
	end
	--vinewood
	tempdis = GetDistanceBetweenCoords(coordx, coordy, 0.0, 641.52, 1.0, 0.0, true)
	if tempdis < dis then
		dis = tempdis
	end
	--Pillbox
	tempdis = GetDistanceBetweenCoords(coordx, coordy, 0.0, 296.25, -583.6, 0.0, true)
	if tempdis < dis then
		dis = tempdis
	end
-- Set Alert Percent Chance
	if dis<=50 then
		return 100
	elseif dis>50 and dis<=100 then
		return 90
	elseif dis>100 and dis<=150 then
		return 80
	elseif dis>150 and dis<=200 then
		return 70
	elseif dis>200 and dis<=300 then
		return 60
	elseif dis>300 and dis<=500 then
		return 50
	elseif dis>500 and dis<= 750 then
		return 40
	elseif dis>750 then
		return 20
	else
		return 0
	end
end




RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

RegisterNetEvent('esx_outlawalert:outlawNotify')
AddEventHandler('esx_outlawalert:outlawNotify', function(alert)
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
-- Also get the current player gender
-- Also get player's distance to the nearest PD office
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		local playerCoords = GetEntityCoords(PlayerPedId())
		streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		streetName = GetStreetNameFromHashKey(streetName)



	end
end)

AddEventHandler('skinchanger:loadSkin', function(character)
	playerGender = character.sex
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

RegisterNetEvent('esx_outlawalert:FelonySpeedingInProgress')
AddEventHandler('esx_outlawalert:FelonySpeedingInProgress', function(targetCoords)
	if isPlayerWhitelisted then
		if Config.FelonySpeedingAlert then
			local alpha = 250
			local SpeedingBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipSpeedingRadius)
			SetBlipHighDetail(SpeedingBlip, true)
			SetBlipColour(SpeedingBlip, 1)
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

RegisterNetEvent('esx_outlawalert:carJackInProgress')
AddEventHandler('esx_outlawalert:carJackInProgress', function(targetCoords)
	if isPlayerWhitelisted then
		if Config.CarJackingAlert then
			local alpha = 250
			local thiefBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipJackingRadius)
			SetBlipHighDetail(thiefBlip, true)
			SetBlipColour(thiefBlip, 1)
			SetBlipAlpha(thiefBlip, alpha)
			SetBlipAsShortRange(thiefBlip, true)
			while alpha ~= 0 do
				Citizen.Wait(Config.BlipJackingTime * 4)
				alpha = alpha - 1
				SetBlipAlpha(thiefBlip, alpha)
				if alpha == 0 then
					RemoveBlip(thiefBlip)
				return
				end
			end
		end
	end
end)

RegisterNetEvent('esx_outlawalert:gunshotInProgress')
AddEventHandler('esx_outlawalert:gunshotInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.GunshotAlert then
		local alpha = 250
		local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipGunRadius)

		SetBlipHighDetail(gunshotBlip, true)
		SetBlipColour(gunshotBlip, 1)
		SetBlipAlpha(gunshotBlip, alpha)
		SetBlipAsShortRange(gunshotBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipGunTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(gunshotBlip, alpha)

			if alpha == 0 then
				RemoveBlip(gunshotBlip)
				return
			end
		end
	end
end)

RegisterNetEvent('esx_outlawalert:combatInProgress')
AddEventHandler('esx_outlawalert:combatInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.MeleeAlert then
		local alpha = 250
		local meleeBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipMeleeRadius)

		SetBlipHighDetail(meleeBlip, true)
		SetBlipColour(meleeBlip, 17)
		SetBlipAlpha(meleeBlip, alpha)
		SetBlipAsShortRange(meleeBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipMeleeTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(meleeBlip, alpha)

			if alpha == 0 then
				RemoveBlip(meleeBlip)
				return
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
		local timeStart = GetGameTimer()
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local spvehicle = GetVehiclePedIsIn(playerPed, true)
		local alertrating = 0.0
		local class = GetVehicleClass(spvehicle)


			if (GetEntitySpeed(spvehicle) * 2.236936 > 100.0) and class~=15 and class~=16 and class~=18 then
				Citizen.Wait(3000)
				alertrating = calcalarmrating(playerCoords.x, playerCoords.y)
				alertrating = alertrating + math.random(0,100)
				--and math.random(0,100) >= ## The higher ##, the less speeding calls (Max 100)
				if alertrating >= 100 and math.random(0,100) >= 65 then
					local vehicle = GetVehiclePedIsIn(playerPed, true)

					if vehicle and ((isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted) then
						local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
						local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
						vehicleLabel = GetLabelText(vehicleLabel)

						DecorSetInt(playerPed, 'isOutlaw', 2)

						TriggerServerEvent('esx_outlawalert:FelonySpeedingInProgress', {
							x = ESX.Math.Round(playerCoords.x, 1),
							y = ESX.Math.Round(playerCoords.y, 1),
							z = ESX.Math.Round(playerCoords.z, 1)
						}, streetName, vehicleLabel)

					end
				end
			end


		-- is jackin'


		if (IsPedTryingToEnterALockedVehicle(playerPed) or IsPedJacking(playerPed)) and Config.CarJackingAlert then

			Citizen.Wait(3000)
			alertrating = calcalarmrating(playerCoords.x, playerCoords.y)
			alertrating = alertrating + math.random(0,20)
			if alertrating >= 100 then
				local vehicle = GetVehiclePedIsIn(playerPed, true)

				if vehicle and ((isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted) then
					local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

					ESX.TriggerServerCallback('esx_outlawalert:isVehicleOwner', function(owner)
						if not owner then

							local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
							vehicleLabel = GetLabelText(vehicleLabel)

							DecorSetInt(playerPed, 'isOutlaw', 2)

							TriggerServerEvent('esx_outlawalert:carJackInProgress', {
								x = ESX.Math.Round(playerCoords.x, 1),
								y = ESX.Math.Round(playerCoords.y, 1),
								z = ESX.Math.Round(playerCoords.z, 1)
							}, streetName, vehicleLabel, playerGender)
						end
					end, plate)
				end
			end

		elseif IsPedInMeleeCombat(playerPed) and Config.MeleeAlert then

			Citizen.Wait(3000)
			alertrating = calcalarmrating(playerCoords.x, playerCoords.y)
			alertrating = alertrating + math.random(0,20)
			if alertrating >= 100 then

				if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
					DecorSetInt(playerPed, 'isOutlaw', 2)

					TriggerServerEvent('esx_outlawalert:combatInProgress', {
						x = ESX.Math.Round(playerCoords.x, 1),
						y = ESX.Math.Round(playerCoords.y, 1),
						z = ESX.Math.Round(playerCoords.z, 1)
					}, streetName, playerGender)
				end
			end

		elseif IsPedShooting(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and Config.GunshotAlert and GetSelectedPedWeapon(playerPed) ~= 0x3656C8C1 and GetSelectedPedWeapon(playerPed) ~= 0x23C9F95C and GetSelectedPedWeapon(playerPed) ~= 0x787F0BB then

			Citizen.Wait(3000)
			alertrating = calcalarmrating(playerCoords.x, playerCoords.y)
			alertrating = alertrating + math.random(0,100)
			if alertrating >= 100 then

				if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
					DecorSetInt(playerPed, 'isOutlaw', 2)

					TriggerServerEvent('esx_outlawalert:gunshotInProgress', {
						x = ESX.Math.Round(playerCoords.x, 1),
						y = ESX.Math.Round(playerCoords.y, 1),
						z = ESX.Math.Round(playerCoords.z, 1)
					}, streetName, playerGender)
				end
			end

		end

		TriggerServerEvent('logAdd', GetCurrentResourceName(), GetGameTimer() - timeStart)
	end
end)
