local ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)

		Citizen.Wait(0)
	end
end)

RegisterNUICallback("spawnPlayer", function(data)
	local Location = data["Location"]

	SpawnPlayer(Location)
end)

SpawnPlayer = function(Location)
	DoScreenFadeOut(500)

	while not IsScreenFadedOut() do
		Citizen.Wait(0)
	end

	SetNuiFocus(false, false)

	if Config.SpawnPoints[Location] then
		ESX.Game.Teleport(PlayerPedId(), Config.SpawnPoints[Location], function()
			DoScreenFadeIn(500)
		end)
	else
		if not ESX.PlayerData["lastPosition"] then
			ESX.PlayerData["lastPosition"] = ESX.GetPlayerData()["lastPosition"]
		end

		ESX.Game.Teleport(PlayerPedId(), ESX.PlayerData["lastPosition"], function()
			DoScreenFadeIn(500)
		end)
	end
end

RegisterCommand("andreas", function()
	TriggerEvent("andreas_spawnlocation:setNui")
end)

RegisterNetEvent("andreas_spawnlocation:setNui")
AddEventHandler("andreas_spawnlocation:setNui", function()
	SetNuiFocus(true, true)

	SendNUIMessage({
		["Action"] = "OPEN_SPAWNMENU"
	})
end)
