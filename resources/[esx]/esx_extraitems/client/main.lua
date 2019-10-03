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

ESX = nil
local PlayerData = {}
local CurrentActionData = {}
local lastTime = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer 
end)

-- Start of Oxygen Mask

RegisterNetEvent('esx_extraitems:oxygen_mask')
AddEventHandler('esx_extraitems:oxygen_mask', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 12844)
	local boneIndex2 = GetPedBoneIndex(playerPed, 24818)
	local dict = "friends@"
      local playerped = GetPlayerPed(PlayerId())
      RequestAnimDict(dict)
      while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
      end
      TaskPlayAnim(playerped, dict, "pickupwait", 8.0, -16.0, -1, 1, 0, false, false, false)

	exports['t0sic_loadingbar']:loadingbar ('Sätter på Syrgasmask...', 6500)
        Citizen.Wait(6500)
	ClearPedTasks(GetPlayerPed(-1))
	
	ESX.Game.SpawnObject('p_s_scuba_mask_s', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		ESX.Game.SpawnObject('p_s_scuba_tank_s', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object2)
			AttachEntityToEntity(object2, playerPed, boneIndex2, -0.30, -0.22, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			AttachEntityToEntity(object, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			SetPedDiesInWater(playerPed, false)
			
			ESX.ShowNotification(_U('dive_suit_on') .. '%.')
			Citizen.Wait(50000)
			ESX.ShowNotification(_U('oxygen_notify', '~y~', '50') .. '%.')
			Citizen.Wait(25000)
			ESX.ShowNotification(_U('oxygen_notify', '~o~', '25') .. '%.')
			Citizen.Wait(25000)
			ESX.ShowNotification(_U('oxygen_notify', '~r~', '0') .. '%.')
			
			SetPedDiesInWater(playerPed, true)
			DeleteObject(object)
			DeleteObject(object2)
			ClearPedSecondaryTask(playerPed)
		end)
	end)
end)

-- End of Oxygen Mask

-- Start of Donut
RegisterNetEvent('esx_extraitems:donut')
AddEventHandler('esx_extraitems:donut', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
	while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_donut_02', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex2, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
		Citizen.Wait(6500)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)
--
-- Start of Bullet Proof Vest

RegisterNetEvent('esx_extraitems:bulletproof')
AddEventHandler('esx_extraitems:bulletproof', function()
	local playerPed = GetPlayerPed(-1)
	local dict = "friends@"
      local playerped = GetPlayerPed(PlayerId())
      RequestAnimDict(dict)
      while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
      end
      TaskPlayAnim(playerped, dict, "pickupwait", 8.0, -16.0, -1, 1, 0, false, false, false)

	exports['t0sic_loadingbar']:loadingbar ('Sätter på Vest...', 3000)
        Citizen.Wait(3000)
	ClearPedTasks(GetPlayerPed(-1))
	SetPedComponentVariation(playerPed, 9, 27, 9, 2)
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
end)

-- End of Bullet Proof Vest
-- Start of First Aid Kit

RegisterNetEvent('esx_extraitems:firstaidkit')
AddEventHandler('esx_extraitems:firstaidkit', function()
local dict = "missheistdockssetup1clipboard@idle_a"
      local playerped = GetPlayerPed(PlayerId())
      RequestAnimDict(dict)
      while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
      end
      TaskPlayAnim(playerped, dict, "idle_a", 8.0, -16.0, -1, 1, 0, false, false, false)
    exports['t0sic_loadingbar']:loadingbar ('Använder Förbandslåda...', 10000)
    Citizen.Wait(10000)
	ClearPedTasks(GetPlayerPed(-1))
	local playerPed = GetPlayerPed(-1)
	local health = GetEntityHealth(playerPed)
	local max = GetEntityMaxHealth(playerPed)
	
	if health > 0 and health < max then
		ESX.ShowNotification(_U('use_firstaidkit'))
		
		health = health + (max / 4)
		if health > max then
			health = max
		end
		SetEntityHealth(playerPed, health)
	end
end)

-- End of First Aid Kit
-- Start of Weapon Clip

RegisterNetEvent('esx_extraitems:clipcli')
AddEventHandler('esx_extraitems:clipcli', function()
	ped = GetPlayerPed(-1)
	if IsPedArmed(ped, 4) then
		hash = GetSelectedPedWeapon(ped)
		if hash ~= nil then
			exports['t0sic_loadingbar']:loadingbar ('Laddar Vapen...', 6500)
			Citizen.Wait(6500)
			AddAmmoToPed(GetPlayerPed(-1), hash,1000)
			ESX.ShowNotification(_U("clip_use"))
		else
			ESX.ShowNotification(_U("clip_no_weapon"))
		end
	else
		ESX.ShowNotification(_U("clip_not_suitable"))
	end
end)

-- End of Weapon Clip
-- Start of Carcleankit

RegisterNetEvent('esx_extraitems:carcleankit')
AddEventHandler('esx_extraitems:carcleankit', function()
	local playerPed = PlayerPedId()
			local vehicle   = ESX.Game.GetVehicleInDirection()
			local coords    = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification('du kan inte göra detta i det trånga utrymmet!')
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
				Citizen.CreateThread(function()
					exports['t0sic_loadingbar']:loadingbar ('Tvättar Fordon...', 10000)
					Citizen.Wait(10000)

					SetVehicleDirtLevel(vehicle, 0)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification('fordonet har ~g~rengjorts~s~')
					isBusy = false
				end)
			else
				ESX.ShowNotification('det finns inget fordon i närheten')
			end
end)

-- End of Carcleankit
-- Start of cigarettes

RegisterNetEvent('esx_cigarett:startSmoke')
AddEventHandler('esx_cigarett:startSmoke', function(source)
	exports['t0sic_loadingbar']:loadingbar ('Tänder cigarett...', 10000)
	SmokeAnimation()
end)

function SmokeAnimation()
	local playerPed = GetPlayerPed(-1)
	
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING", 0, true)               
	end)
end

RegisterNetEvent("esx_cigarett:openCigarettes")
AddEventHandler("esx_cigarett:openCigarettes", function(item)
    local dict = "missheistdockssetup1clipboard@idle_a"
      local playerped = GetPlayerPed(PlayerId())
      RequestAnimDict(dict)
      while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
      end
      TaskPlayAnim(playerped, dict, "idle_a", 8.0, -16.0, -1, 1, 0, false, false, false)
    exports['t0sic_loadingbar']:loadingbar ('Öppnar cigarettpaket...', 3000)
        Citizen.Wait(3000)
      ClearPedTasks(GetPlayerPed(-1))
end)

-- End of ciggarettes
-- Start of Snus

AddEventHandler('esx:onPlayerDeath', function()
    isDead = true
end)

RegisterNetEvent('esx_snus:useSnus')
AddEventHandler('esx_snus:useSnus', function(source)

    local spelare = GetPlayerPed(-1)

    if not usingSnus and not isDead then
        usingSnus = true

        ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
            TaskPlayAnim(spelare, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
            Citizen.Wait(1000)
            ClearPedSecondaryTask(spelare)
            usingSnus = false
            ESX.ShowNotification('Du satte upp en snus under läppen')
        
        end)
    end
end)


RegisterNetEvent('esx_snus:openSnusdosa')
AddEventHandler('esx_snus:openSnusdosa', function(source)

    ESX.ShowNotification('Du öppnade din snusdosa och tog ut snuset')

end)

-- End of Snus
-- Start of paraply

RegisterNetEvent('esx_extraitems:paraply')
AddEventHandler('esx_extraitems:paraply', function()
	local playerPed = GetPlayerPed(-1)
	
	if not IsAnimated then	
		local prop_name = 'p_amb_brolly_01'
		IsAnimated = true 	
		Citizen.CreateThread(function()
	        local x,y,z = table.unpack(GetEntityCoords(playerPed))
	        prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)		
		RequestAnimDict('amb@code_human_wander_drinking@beer@male@base')
			while not HasAnimDictLoaded('amb@code_human_wander_drinking@beer@male@base') do
			Citizen.Wait(1)
			end			
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.10, 0, -0.001, 80.0, 150.0, 200.0, true, true, false, true, 1, true)
			TaskPlayAnim(playerPed, "amb@code_human_wander_drinking@beer@male@base", "static", 3.5, -8, -1, 49, 0, 0, 0, 0)
		end)
		
	elseif IsAnimated then		
		IsAnimated = false
		ClearPedSecondaryTask(playerPed)
		DeleteObject(prop)
	end
end)

--End of paraply
--Start of Picknick

RegisterNetEvent('esx_extraitems:picknick')
AddEventHandler('esx_extraitems:picknick', function()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local dict = "friends@"
      local playerped = GetPlayerPed(PlayerId())
      RequestAnimDict(dict)
      while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
      end
      TaskPlayAnim(playerped, dict, "pickupwait", 8.0, -16.0, -1, 1, 0, false, false, false)

	exports['t0sic_loadingbar']:loadingbar ('Lägger filt på marken...', 3000)
        Citizen.Wait(3000)
	ClearPedTasks(GetPlayerPed(-1))

	ESX.Game.SpawnObject('prop_yoga_mat_02',  {
		x = coords.x,
		y = coords.y,
		z = coords.z -1
	}, function(object)
	end)
	ESX.Game.SpawnObject('prop_yoga_mat_02',  {
		x = coords.x ,
		y = coords.y -0.9,
		z = coords.z -1
	}, function(object)
	end)
	ESX.Game.SpawnObject('prop_yoga_mat_02',  {
		x = coords.x ,
		y = coords.y +0.9,
		z = coords.z -1
	}, function(object)
	end)
	ESX.Game.SpawnObject('prop_champset',  {
		x = coords.x ,
		y = coords.y ,
		z = coords.z -1
	}, function(object)
	end)
	--[[
	ESX.Game.SpawnObject('prop_beach_fire',  {
		x = coords.x +1.3,
		y = coords.y ,
		z = coords.z -1.6
	}, function(object)
	end)
	--]]
end)

--End of picknick
--Start of Ros

RegisterNetEvent('esx_extraitems:ros')
AddEventHandler('esx_extraitems:ros', function()
	local playerPed = GetPlayerPed(-1)
	
	if not IsAnimated then	
		local prop_name = 'p_single_rose_s'
		IsAnimated = true 	
		Citizen.CreateThread(function()
	        local x,y,z = table.unpack(GetEntityCoords(playerPed))
	        prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)		
		RequestAnimDict('amb@code_human_wander_drinking@beer@male@base')
			while not HasAnimDictLoaded('amb@code_human_wander_drinking@beer@male@base') do
			Citizen.Wait(1)
			end			
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.10, 0, -0.001, 80.0, 150.0, 200.0, true, true, false, true, 1, true)
			TaskPlayAnim(playerPed, "amb@code_human_wander_drinking@beer@male@base", "static", 3.5, -8, -1, 49, 0, 0, 0, 0)
		end)
		
	elseif IsAnimated then		
		IsAnimated = false
		ClearPedSecondaryTask(playerPed)
		DeleteObject(prop)
	end
end)

--End of ros
--Start of Redbull

RegisterNetEvent('esx_extraitems:monster')
AddEventHandler('esx_extraitems:monster', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_energy_drink', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, 2000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	ESX.ShowNotification('du känner dig hypad och energifull. Du kan nu springa ~y~5~w~ minuter ~o~utan att bli trött~w~!')
	
	local timer = 0
	while timer < 300 do
		ResetPlayerStamina(PlayerId())
		Citizen.Wait(2000)
		timer = timer + 2
	end
	ESX.ShowNotification('Du känner din att puls återgår till en normal nivå')
end)