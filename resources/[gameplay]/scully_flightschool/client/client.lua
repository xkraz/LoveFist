

ESX                             = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

local flightblip = {
    {title="Flight School", colour=27, id=307, x = -927.79, y = -2040.58, z = 9.3} -- you can change the blip here
}

Citizen.CreateThread(function()

for _, info in pairs(flightblip) do
  info.blip = AddBlipForCoord(info.x, info.y, info.z)
  SetBlipSprite(info.blip, info.id)
  SetBlipDisplay(info.blip, 4)
  SetBlipScale(info.blip, 0.9)
  SetBlipColour(info.blip, info.colour)
  SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(info.title)
  EndTextCommandSetBlipName(info.blip)
end
end)

function flightnoti(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

-- flight school menu

function OpenFlightActionsMenu()
	local elements = {
		{label = "Give License", value = 'give_flight'},
		{label = "Revoke License", value = 'remove_flight'}
	}

	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = "Boss Actions", value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'flight_actions_menu',
	{
		title    = 'Flight School',
		align    = 'top-right',
		elements = elements
	}, function(data, menu)
	    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		if data.current.value == 'give_flight' then
			TriggerServerEvent('esx_license:addLicense', GetPlayerServerId(closestPlayer), 'aircraft')
		elseif data.current.value == 'remove_flight' then
			ShowLicense(closestPlayer)
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'flightschool', function(data, menu)
				menu.close()
			end)
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'flight_actions_menu'
		CurrentActionMsg  = ''
		CurrentActionData = {}
	end)
end

function ShowLicense(player)
	local elements = {}
	local targetName
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		if data.licenses then
			for i=1, #data.licenses, 1 do
				if data.licenses[i].label and data.licenses[i].type then
					table.insert(elements, {
						label = data.licenses[i].label,
						type = data.licenses[i].type
					})
				end
			end
		end
		
		if ESX.PlayerData.job.name == 'flightschool' then
			targetName = data.firstname .. ' ' .. data.lastname
		else
			targetName = data.name
		end
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license',
		{
			title    = 'Revoke License',
			align    = 'top-right',
			elements = elements,
		}, function(data, menu)
			ESX.ShowNotification('You revoked the players license', data.current.label, targetName)
			TriggerServerEvent('esx_policejob:message', GetPlayerServerId(player), 'License revoked', data.current.label)
			
			TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.type)
			
			ESX.SetTimeout(300, function()
				ShowLicense(player)
			end)
		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))
end

-- Teleport to the airfield
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            DrawMarker(1, -915.19, -2038.48, 8.4, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 255, 0, 0, 100, 0, 0, 0, 0) -- tp to the airfield...change the 2nd, 3rd and 4th values to change the coords
			DrawMarker(1, -1148.54, -2826.75, 12.96, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 255, 0, 0, 100, 0, 0, 0, 0) -- tp back to flight school...change the 2nd, 3rd and 4th values to change the coords
            DrawMarker(1, -1120.55, -2841.25, 12.95, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 255, 0, 0, 100, 0, 0, 0, 0) -- Caddy spawn
			DrawMarker(1, -941.4, -2955.05, 12.95, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 255, 0, 0, 100, 0, 0, 0, 0) -- Plane spawn
			DrawMarker(1, -980.59, -2997.17, 12.95, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 255, 0, 0, 0, 0, 0, 0, 0) -- Plane spawn2
			DrawMarker(1, -1070.65, -2868.44, 12.95, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 255, 0, 0, 100, 0, 0, 0, 0) -- Heli spawn
			DrawMarker(1, -1112.66, -2883.98, 12.95, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 255, 0, 0, 0, 0, 0, 0, 0) -- Heli spawn2
   end
end)

Citizen.CreateThread(function(source)
    while true do
      Citizen.Wait(0)
      local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
      local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -915.19, -2038.48, 8.4) -- change the last 3 values to change the coords
    if dist <= 1.2 then
	  flightnoti('Press ~r~E ~w~to go to the airfield!')
	  if IsControlJustReleased(0, 38) then
	  ESX.Game.Teleport(PlayerPedId(-1), {x = -1147.74, y = -2825.29, z = 12.96 }) -- these coords are where you spawn at the airfield
      end
	end
  end
end)

-- Teleport back to the flight school

Citizen.CreateThread(function(source)
    while true do
      Citizen.Wait(0)
      local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
      local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -1148.54, -2826.75, 12.96) -- change the last 3 values to change the coords
    if dist <= 1.2 then
	  flightnoti('Press ~r~E ~w~to go to the flight school!')
	  if IsControlJustReleased(0, 38) then
	  ESX.Game.Teleport(PlayerPedId(-1), {x = -915.19, y = -2038.48, z = 8.4 }) -- these coords are where you spawn at the flight school
      end
	end
  end
end)

-- Spawn the caddy

Citizen.CreateThread(function(source)
    while true do
      Citizen.Wait(0)
      local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
      local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -1120.55, -2841.25, 12.95) -- change the last 3 values to change the coords
    if dist <= 1.2 and ESX.PlayerData.job.name == 'flightschool' then
	  flightnoti('Press ~r~E ~w~to spawn an airtug!')
	  if IsControlJustReleased(0, 38) then
	  RequestModel(1560980623)
      while not HasModelLoaded(1560980623) do
      Citizen.Wait(0)
      end
	  CreateVehicle(1560980623, -1130.2, -2840.25, 12.95, 155.21, true, true)
      end
	end
  end
end)

-- Spawn the plane

Citizen.CreateThread(function(source)
    while true do
      Citizen.Wait(0)
      local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
      local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -941.4, -2955.05, 12.95) -- change the last 3 values to change the coords
    if dist <= 1.2 and ESX.PlayerData.job.name == 'flightschool' then
	  flightnoti('Press ~r~E ~w~to spawn a plane!')
	  if IsControlJustReleased(0, 38) then
	  RequestModel(-1763555241)
      while not HasModelLoaded(-1763555241) do
      Citizen.Wait(0)
      end
	  CreateVehicle(-1763555241, -980.59, -2997.17, 12.95, 60.72, true, true)
      end
	end
  end
end)

Citizen.CreateThread(function(source)
    while true do
      Citizen.Wait(0)
      local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
	  local ped = GetPlayerPed(-1)
	  local pedLocation = GetEntityCoords(ped, 0)
      local dist = GetDistanceBetweenCoords(-980.59, -2997.17, 12.95,  pedLocation["x"], pedLocation["y"], pedLocation["z"], true)
	  vehicle = GetVehiclePedIsIn(ped, false)
    if dist <= 5.2 and ESX.PlayerData.job.name == 'flightschool' then
	  flightnoti('Press ~r~E ~w~to put the plane back in storage or press ~r~R~w~ to repair/fuel the plane!')
	if IsControlJustReleased(0, 38) then
	  ESX.Game.DeleteVehicle(vehicle)
	elseif IsControlJustReleased(0, 45) then
	  SetVehicleUndriveable(vehicle,false)
	  SetVehicleFixed(vehicle)
	  healthBodyLast=1000.0
	  healthEngineLast=1000.0
	  healthPetrolTankLast=1000.0
	  SetVehicleEngineOn(vehicle, true, false )
      end
	end
  end
end)

-- Spawn the heli

Citizen.CreateThread(function(source)
    while true do
      Citizen.Wait(0)
      local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
      local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -1070.65, -2868.44, 12.95) -- change the last 3 values to change the coords
	  local playerPed = PlayerPedId()
    if dist <= 1.2 and ESX.PlayerData.job.name == 'flightschool' then
	  flightnoti('Press ~r~E ~w~to spawn a helicopter!')
	  if IsControlJustReleased(0, 38) then
	  RequestModel(788747387)
      while not HasModelLoaded(788747387) do
      Citizen.Wait(0)
      end
	  CreateVehicle(788747387, -1112.58, -2883.98, 12.95, 334.3, true, true)
      end
	end
  end
end)

Citizen.CreateThread(function(source)
    while true do
      Citizen.Wait(0)
      local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
	  local ped = GetPlayerPed(-1)
	  local pedLocation = GetEntityCoords(ped, 0)
      local dist = GetDistanceBetweenCoords(-1112.66, -2883.98, 12.95,  pedLocation["x"], pedLocation["y"], pedLocation["z"], true)
	  vehicle = GetVehiclePedIsIn(ped, false)
    if dist <= 5.2 and ESX.PlayerData.job.name == 'flightschool' then
	  flightnoti('Press ~r~E ~w~to put the helicopter back in storage or press ~r~R~w~ to repair/fuel the helicopter!')
	if IsControlJustReleased(0, 38) then
	  ESX.Game.DeleteVehicle(vehicle)
	elseif IsControlJustReleased(0, 45) then
	  SetVehicleUndriveable(vehicle,false)
	  SetVehicleFixed(vehicle)
	  healthBodyLast=1000.0
	  healthEngineLast=1000.0
	  healthPetrolTankLast=1000.0
	  SetVehicleEngineOn(vehicle, true, false )
      end
	end
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction and not IsDead then
			ESX.ShowHelpNotification(CurrentActionMsg)
		end

		if IsControlJustReleased(0, 167) and not IsDead and ESX.PlayerData.job and ESX.PlayerData.job.name == 'flightschool' then
			OpenFlightActionsMenu()
		end
	end
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	IsDead = false
end)