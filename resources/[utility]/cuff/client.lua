local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

  local PlayerData              = {}
  local JobLabel 				= 'police'
  local JobLabel2				= 'fib'
  local Arrested				= false
  local Arrested2				= false

  local ArrestAnimation			= 'mp_arrest_paired'
  local ArrestAnimation2 		= 'cop_p2_back_left'
  local ArrestAnimation3		= 'crook_p2_back_left'
  local RecentlyArrested		= 0
  local IsHandcuffed            = false
  local IsDragged               = false
  local playerhandcuffed 		= false

  ESX                           = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('ArrestFindPlayer')
AddEventHandler('ArrestFindPlayer', function(target)
	Arrested2 = true

	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	RequestAnimDict(ArrestAnimation)

	while not HasAnimDictLoaded(ArrestAnimation) do
		Citizen.Wait(10)
	end

	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
	TaskPlayAnim(playerPed, ArrestAnimation, ArrestAnimation3, 8.0, -8.0, 5500, 33, 0, false, false, false)

	Citizen.Wait(950)
	DetachEntity(GetPlayerPed(-1), true, false)

	Arrested2 = false
end)

RegisterNetEvent('ArrestAnimation')
AddEventHandler('ArrestAnimation', function()
	local playerPed = GetPlayerPed(-1)

	RequestAnimDict(ArrestAnimation)

	while not HasAnimDictLoaded(ArrestAnimation) do
		Citizen.Wait(10)
	end

	TaskPlayAnim(playerPed, ArrestAnimation, ArrestAnimation2, 8.0, -8.0, 5500, 33, 0, false, false, false)


	Citizen.Wait(3000)

	Arrested = false
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)

		if IsControlPressed(0, Keys[',']) and IsControlPressed(0, Keys[',']) and not Arrested and GetGameTimer() - RecentlyArrested > 6 * 1000 then
		if PlayerData.job.name == JobLabel or PlayerData.job.name == JobLabel2 then
			Citizen.Wait(10)
			local closestPlayer, distance = ESX.Game.GetClosestPlayer()

			if distance ~= -1 and distance <= 2.0 and not Arrested and not Arrested2 and not IsPedInAnyVehicle(GetPlayerPed(-1)) and not IsPedInAnyVehicle(GetPlayerPed(closestPlayer)) then
			if playerhandcuffed == false then
				Arrested = true
       			RecentlyArrested = GetGameTimer()


				ESX.ShowNotification("~b~Arresting player~r~" .. GetPlayerServerId(closestPlayer) .. "")
				TriggerServerEvent('StartArresting', GetPlayerServerId(closestPlayer))

				Citizen.Wait(1100)
        TriggerServerEvent('PlaySoundAt', GetEntityCoords(GetPlayerPed(closestID)), "item_cuffs")
        Citizen.Wait(1000)
				Citizen.Wait(3000)
				ESX.ShowNotification("~b~Arrested player~r~" .. GetPlayerServerId(closestPlayer) .. "")
				TriggerServerEvent('cuffServer', GetPlayerServerId(closestPlayer))
				playerhandcuffed = true
				else
				ESX.ShowNotification("~b~Player is already handcuffed~r~" .. GetPlayerServerId(closestPlayer) .. "")
				end
			end
		end
		end
	end
end)
RegisterNetEvent('playeralreadyhandcuffed')
AddEventHandler('playeralreadyhandcuffed', function(player)
playerhandcuffed = false
end)

RegisterNetEvent('playerNOTalreadyhandcuffed')
AddEventHandler('playerNOTalreadyhandcuffed', function(player)
playerhandcuffed = true
end)


Citizen.CreateThread(function()
	while true do
		Wait(0)

		if IsControlPressed(0, Keys['.']) and IsControlPressed(0, Keys['.']) and not Arrested and GetGameTimer() - RecentlyArrested > 6 * 1000 then
		if PlayerData.job.name == JobLabel or PlayerData.job.name == JobLabel2 then
			Citizen.Wait(10)
			local closestPlayer, distance = ESX.Game.GetClosestPlayer()

			if distance ~= -1 and distance <= 2.0 and not Arrested and not Arrested2 and not IsPedInAnyVehicle(GetPlayerPed(-1)) and not IsPedInAnyVehicle(GetPlayerPed(closestPlayer)) then
				Arrested = false
				playerhandcuffed = false
				TriggerServerEvent('unCuffServer', GetPlayerServerId(closestPlayer))
			end
		end
		end
	end
end)



local holdingBoombox = false
local usingBoombox = false
local boomModel = "prop_boombox_01"
local boomanimDict = "missheistdocksprep1hold_cellphone"
local boomanimName = "hold_cellphone"
local bag_net = nil
local radioStation = math.random(1, 8)

local UI = {
	x =  0.000 ,
	y = -0.001 ,
}
[[
RegisterCommand("bbox", function()
    TriggerEvent("boombox:ToggleBoombox")
end, false)

RegisterNetEvent("boombox:ToggleBoombox")
AddEventHandler("boombox:ToggleBoombox", function()
    if not holdingBoombox then
        RequestModel(GetHashKey(boomModel))
        while not HasModelLoaded(GetHashKey(boomModel)) do
            Citizen.Wait(100)
        end

		while not HasAnimDictLoaded(boomanimDict) do
			RequestAnimDict(boomanimDict)
			Citizen.Wait(100)
		end

        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
        local boomSpawned = CreateObject(GetHashKey(boomModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(1000)
        local netid = ObjToNet(boomSpawned)
        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(boomSpawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 57005), 0.30, 0, 0, 0, 260.0, 60.0, true, true, false, true, 1, true)
        TaskPlayAnim(GetPlayerPed(PlayerId()), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
        TaskPlayAnim(GetPlayerPed(PlayerId()), boomanimDict, boomanimName, 1.0, -1, -1, 50, 0, 0, 0, 0)
        bag_net = netid
        holdingBoombox = true
    else
        ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
        DetachEntity(NetToObj(bag_net), 1, 1)
        DeleteEntity(NetToObj(bag_net))
        bag_net = nil
        holdingBoombox = false
        usingBoombox = false
    end
end)
]]