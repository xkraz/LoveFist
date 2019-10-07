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

-- internal variables
ESX = nil
local ped = 0
local model = {}
local status = 100
local objCoords = nil
local balle = false
local object = {}
local inanimation = false
local come = 0
local isAttached = false
local animation = {}
local getball = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)

	for k,v in pairs(Config.PetShop) do
		DoRequestModel(v.model)
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Zones) do
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
		end
	end
end)

function OpenPetMenu()
	local elements = {}
	if come == 1 then

		table.insert(elements, {label = _U('hunger', status), value = nil})
		table.insert(elements, {label = _U('givefood'), value = 'graille'})

		if isAttached then
			table.insert(elements, {label = _U('detachpet'), value = 'attached_animal'})
		else
			table.insert(elements, {label = _U('attachpet'), value = 'attached_animal'})
		end

		if isInVehicle then
			table.insert(elements, {label = _U('getpeddown'), value = 'vehicle'})
		else
			table.insert(elements, {label = _U('getpedinside'), value = 'vehicle'})
			table.insert(elements, {label = _U('giveorders'), value = 'give_orders'})
		end
	else
		table.insert(elements, {label = _U('callpet'), value = 'come_animal'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pet_menu', {
		title    = _U('pet_management'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'come_animal' and come == 0 then
			ESX.TriggerServerCallback('eden_animal:getPet', function(pet)
				local found = false
				for k,v in pairs(Config.PetShop) do
					if k == pet then
						model = v.model
						come = 1
						found = true
						opendog()
						break
					end
				end

				if not found then
					print('eden_animal: unknown pet ' .. pet)
				end
			end)
			menu.close()
		elseif data.current.value == 'attached_animal' then
			if ped > 0 and not IsPedSittingInAnyVehicle(ped) then
				if isAttached == false then
					attached()
					isAttached = true
					ESX.UI.Menu.CloseAll()
				else
					detached()
					isAttached = false
					ESX.UI.Menu.CloseAll()
				end
				else
				ESX.ShowNotification(_U('dontattachhiminacar'))
			end
		elseif data.current.value == 'give_orders' then
			GivePetOrders()
		elseif data.current.value == 'graille' and ped > 0 then
			local inventory = ESX.GetPlayerData().inventory
			local coords1   = GetEntityCoords(PlayerPedId())
			local coords2   = GetEntityCoords(ped)
			local distance  = GetDistanceBetweenCoords(coords1, coords2, true)

			local count = 0
			for i=1, #inventory, 1 do
				if inventory[i].name == 'croquettes' then
					count = inventory[i].count
				end
			end
			if distance < 5 then
				if count >= 1 then
					if status < 100 then
						status = status + math.random(30, 40)
						ESX.ShowNotification(_U('gavepetfood'))
						TriggerServerEvent('eden_animal:consumePetFood')
						if status > 100 then
							status = 100
						end
						menu.close()
					else
						ESX.ShowNotification(_U('nomorehunger'))
					end
				else
					ESX.ShowNotification(_U('donthavefood'))
				end
			else
				ESX.ShowNotification(_U('hestoofar'))
			end
		elseif data.current.value == 'vehicle' and ped > 0 then
			local playerPed = PlayerPedId()
			local vehicle  = GetVehiclePedIsUsing(playerPed)
			local coords   = GetEntityCoords(playerPed)
			local coords2  = GetEntityCoords(ped)
			local distance = GetDistanceBetweenCoords(coords, coords2, true)

			if not isInVehicle then
				if IsPedSittingInAnyVehicle(playerPed) then
					if distance < 8 then
						attached()
						Citizen.Wait(200)
						if IsVehicleSeatFree(vehicle, 1) then
							SetPedIntoVehicle(ped, vehicle, 1)
							isInVehicle = true
						elseif IsVehicleSeatFree(vehicle, 2) then
							isInVehicle = true
							SetPedIntoVehicle(ped, vehicle, 2)
						elseif IsVehicleSeatFree(vehicle, 0) then
							isInVehicle = true
							SetPedIntoVehicle(ped, vehicle, 0)
						end

						menu.close()
					else
						ESX.ShowNotification(_U('toofarfromcar'))
					end

				else
					ESX.ShowNotification(_U('youneedtobeincar'))
				end
			else
				if not IsPedSittingInAnyVehicle(playerPed) then
					SetEntityCoords(ped, coords,1,0,0,1)
					Citizen.Wait(100)
					detached()
					isInVehicle = false
					menu.close()
				else
					ESX.ShowNotification(_U('yourstillinacar'))
				end
			end
		end
	end, function(data, menu)
		menu.close()
	end)
end

function returnHome()
	if ped == 0 then
		return
	end

--	local GroupHandle = GetPlayerGroup(PlayerId())
	local coords      = GetEntityCoords(PlayerPedId())

	ESX.ShowNotification(_U('doghouse_returning'))

--	SetGroupSeparationRange(GroupHandle, 1.9)
--	SetPedNeverLeavesGroup(ped, false)
	come = 0

	local pos = nil
	local success = 0
--	success, pos = GetSafeCoordForPed(coords.x + 40, coords.y, coords.z, false, 16)
--	if success == 0 or pos.x == 0 then
		pos = vector3(coords.x + 40.0, coords.y, coords.z)
--	end
	TaskGoToCoordAnyMeans(ped, pos, 5.0, 0, 0, 786603, 0xbf800000)

	Citizen.Wait(4000)
	NetworkFadeOutEntity(ped, 1, 0)
	Citizen.Wait(1000)
	DeleteEntity(ped)
	ped = 0
end

function GivePetOrders()
	ESX.TriggerServerCallback('eden_animal:getPet', function(pet)
		local elements = {}
		if ped == 0 then
			return
		end

		if not inanimation then
			if Config.PetShop[pet] and (Config.PetShop[pet].bringBall == nil or Config.PetShop[pet].bringBall == true) then
				table.insert(elements, {label = _U('balle'), value = 'balle'})
			end

			table.insert(elements, {label = _U('pied'),     value = 'pied'})
			table.insert(elements, {label = _U('doghouse'), value = 'return_doghouse'})

			if pet == 'dog' then
				table.insert(elements, {label = _U('sitdown'), value = 'sitdown'})
				table.insert(elements, {label = _U('getdown'), value = 'getdown'})
			elseif pet == 'cat' then
				table.insert(elements, {label = _U('getdown'), value = 'getdown2'})
			elseif pet == 'wolf' then
				table.insert(elements, {label = _U('getdown'), value = 'getdown3'})
			elseif pet == 'pug' then
				table.insert(elements, {label = _U('sitdown'), value = 'sitdown2'})
			elseif pet == 'retriever' then
				table.insert(elements, {label = _U('sitdown'), value = 'sitdown3'})
			elseif pet == 'rottweiler' then
				table.insert(elements, {label = _U('sitdown'), value = 'sitdown4'})
			end
		else
			table.insert(elements, {label = _U('getup'), value = 'debout'})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'give_orders', {
			title    = _U('pet_orders'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'return_doghouse' then
				ESX.UI.Menu.CloseAll()
				returnHome()

			elseif data.current.value == 'pied' then
				local coords = GetEntityCoords(PlayerPedId())
				TaskGoToCoordAnyMeans(ped, coords, 5.0, 0, 0, 786603, 0xbf800000)
				menu.close()
			elseif data.current.value == 'balle' then
				local pedCoords = GetEntityCoords(ped)
				object = GetClosestObjectOfType(pedCoords, 190.0, GetHashKey('w_am_baseball'))

				if DoesEntityExist(object) then
					balle = true
					objCoords = GetEntityCoords(object)
					TaskGoToCoordAnyMeans(ped, objCoords, 5.0, 0, 0, 786603, 0xbf800000)
--					local GroupHandle = GetPlayerGroup(PlayerId())
--					SetGroupSeparationRange(GroupHandle, 1.9)
--					SetPedNeverLeavesGroup(ped, false)
					menu.close()
				else
					ESX.ShowNotification(_U('noball'))
				end
			elseif data.current.value == 'sitdown' then -- [dog ]
				DoRequestAnimSet('creatures@rottweiler@amb@world_dog_sitting@base')
				TaskPlayAnim(ped, 'creatures@rottweiler@amb@world_dog_sitting@base', 'base' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'getdown' then -- [dog ]
				DoRequestAnimSet('creatures@rottweiler@amb@sleep_in_kennel@')
				TaskPlayAnim(ped, 'creatures@rottweiler@amb@sleep_in_kennel@', 'sleep_in_kennel' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'getdown2' then -- [cat ]
				DoRequestAnimSet('creatures@cat@amb@world_cat_sleeping_ground@idle_a')
				TaskPlayAnim(ped, 'creatures@cat@amb@world_cat_sleeping_ground@idle_a', 'idle_a' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'getdown3' then -- [wolf ]
				DoRequestAnimSet('creatures@coyote@amb@world_coyote_rest@idle_a')
				TaskPlayAnim(ped, 'creatures@coyote@amb@world_coyote_rest@idle_a', 'idle_a' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'sitdown2' then -- [pug ]
				DoRequestAnimSet('creatures@carlin@amb@world_dog_sitting@idle_a')
				TaskPlayAnim(ped, 'creatures@carlin@amb@world_dog_sitting@idle_a', 'idle_b' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'sitdown3' then -- [retriever ]
				DoRequestAnimSet('creatures@retriever@amb@world_dog_sitting@idle_a')
				TaskPlayAnim(ped, 'creatures@retriever@amb@world_dog_sitting@idle_a', 'idle_c' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'sitdown4' then -- [rottweiler ]
				DoRequestAnimSet('creatures@rottweiler@amb@world_dog_sitting@idle_a')
				TaskPlayAnim(ped, 'creatures@rottweiler@amb@world_dog_sitting@idle_a', 'idle_c' ,8.0, -8, -1, 1, 0, false, false, false)
				inanimation = true
				menu.close()
			elseif data.current.value == 'debout' then
				ClearPedTasks(ped)
				inanimation = false
				menu.close()
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30)

		if balle and ped > 0 then
			local coords1 = GetEntityCoords(PlayerPedId())
			local coords2 = GetEntityCoords(ped)
			local distance  = GetDistanceBetweenCoords(objCoords, coords2, true)
			local distance2 = GetDistanceBetweenCoords(coords1, coords2, true)

			if distance < 0.5 then
				local boneIndex = GetPedBoneIndex(ped, 17188)
				AttachEntityToEntity(object, ped, boneIndex, 0.120, 0.010, 0.010, 5.0, 150.0, 0.0, true, true, false, true, 1, true)
				TaskGoToCoordAnyMeans(ped, coords1, 5.0, 0, 0, 786603, 0xbf800000)
				balle = false
				getball = true
			end
		end

		if getball and ped > 0 then
			local coords1 = GetEntityCoords(PlayerPedId())
			local coords2 = GetEntityCoords(ped)
			local distance2 = GetDistanceBetweenCoords(coords1, coords2, true)

			if distance2 < 1.5 then
				DetachEntity(object,false,false)
				Citizen.Wait(50)
				SetEntityAsMissionEntity(object)
				DeleteEntity(object)
				GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_BALL"), 1, false, true)
--				local GroupHandle = GetPlayerGroup(PlayerId())
--				SetGroupSeparationRange(GroupHandle, 999999.9)
--				SetPedNeverLeavesGroup(ped, true)
--				SetPedAsGroupMember(ped, GroupHandle)
				getball = false
			end
		end

		if ped > 0 and isInVehicle and not IsPedSittingInAnyVehicle(ped) then
			isInVehicle = false
		end
	end
end)

Citizen.CreateThread(function()
	local lastPos = vector3(0,0,0)
	local moving = false

	while true do
		Citizen.Wait(100)

		while ped == 0 do
			Citizen.Wait(1000)
		end

		moving = false

		if ped > 0 then
			local pos = GetEntityCoords(ped)
			moving = true

			if #(pos-lastPos) < 0.0001 then
				moving = false
			end

			lastPos = pos
		end

		local playerCoords = GetEntityCoords(PlayerPedId())
		local petCoords = GetEntityCoords(ped)
		local distance = GetDistanceBetweenCoords(playerCoords, petCoords, true)

		if not isAttached and come ~= 0 and not balle and not moving and distance > 3.0 and not IsPedInMeleeCombat(ped) and not isInVehicle then
			TaskFollowToOffsetOfEntity(ped, PlayerPedId(), 1, 1, 0, 5.0, -1, 3.0, 1)
		end
--[[
		if distance > 100.0 and isAttached == false and not isInVehicle then
			returnHome()
			Citizen.Wait(10000)
		end
]]--
		lastDistance = distance
	end
end)


function attached()
	if ped == 0 then
		return
	end

--	local GroupHandle = GetPlayerGroup(PlayerId())
--	SetGroupSeparationRange(GroupHandle, 1.9)
--	SetPedNeverLeavesGroup(ped, false)
--	FreezeEntityPosition(ped, true)
	ClearPedTasks(ped)
end

function detached()
	if ped == 0 then
		return
	end

--	local GroupHandle = GetPlayerGroup(PlayerId())
--	SetGroupSeparationRange(GroupHandle, 999999.9)
--	SetPedNeverLeavesGroup(ped, true)
--	SetPedAsGroupMember(ped, GroupHandle)
--	FreezeEntityPosition(ped, false)
end

function opendog()
	local playerPed = PlayerPedId()
	local LastPosition = GetEntityCoords(playerPed)
--	local GroupHandle = GetPlayerGroup(PlayerId())

	DoRequestAnimSet('rcmnigel1c')

	TaskPlayAnim(playerPed, 'rcmnigel1c', 'hailing_whistle_waive_a' ,8.0, -8, -1, 120, 0, false, false, false)

	Citizen.SetTimeout(5000, function()
		local pos = nil
		local success = 0
--		success, pos = GetSafeCoordForPed(LastPosition.x+40, LastPosition.y, LastPosition.z, true, 16)
--		if success == 0 or pos.x == 0 then
--			pos = vector3(LastPosition.x+2,LastPosition.y+2,LastPosition.z)
--		end

		ped = CreatePed(28, model, LastPosition.x+2,LastPosition.y+2,LastPosition.z, 1, 1)

		if ped == 0 then
			come = 0
			ESX.ShowNotification(_U("unable_to_spawn"))
			return
		end
		NetworkFadeInEntity(ped, 0)

		SetRelationshipBetweenGroups(0, GetHashKey('MISSION2'), GetHashKey('PLAYER'))
		SetPedRelationshipGroupHash(ped, GetHashKey('MISSION2'))

		Citizen.Wait(50)

--		SetPedAsGroupLeader(playerPed, GroupHandle)
--		SetPedAsGroupMember(ped, GroupHandle)
--		SetPedNeverLeavesGroup(ped, true)
--		SetPedCanBeTargetted(ped, false)
--		SetEntityAsMissionEntity(ped, true,true)

		status = math.random(40, 90)
		Citizen.Wait(50)
		attached()
		Citizen.Wait(50)
		detached()
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(math.random(60000, 120000))

		if come == 1 then
			status = status - 1
		end

		if status == 0 and ped > 0 then
			TriggerServerEvent('eden_animal:petDied')
			DeleteEntity(ped)
			ESX.ShowNotification(_U('pet_dead'))
			come = 3
			status = "die"
		end
	end
end)

-- Key Controls

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustPressed(0, Keys['DELETE']) and GetLastInputMethod(2) and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'pet_menu') then
			OpenPetMenu()
		end
	end
end)


-- Create Blips
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(Config.Zones.PetShop.Pos.x, Config.Zones.PetShop.Pos.y, Config.Zones.PetShop.Pos.z)

	SetBlipSprite (blip, Config.Zones.PetShop.Sprite)
	SetBlipDisplay(blip, Config.Zones.PetShop.Display)
	SetBlipScale  (blip, Config.Zones.PetShop.Scale)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('pet_shop'))
	EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coord = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coord, Config.Zones.PetShop.Pos.x, Config.Zones.PetShop.Pos.y, Config.Zones.PetShop.Pos.z, true) < 2 then
			ESX.ShowHelpNotification(_U('enterkey'))

			if IsControlJustReleased(0, Keys['E']) then
				OpenPetShop()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function OpenPetShop()
	returnHome()
	local elements = {}

	for k,v in pairs(Config.PetShop) do
		table.insert(elements, {
			label = ('%s - <span style="color:green;">%s</span>'):format(v.label, _U('shop_item', ESX.Math.GroupDigits(v.price))),
			pet = k,
			price = v.price
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pet_shop', {
		title    = _U('pet_shop'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		ESX.TriggerServerCallback('eden_animal:buyPet', function(boughtPed)
			if boughtPed then
				menu.close()
			end
		end, data.current.pet)
	end, function(data, menu)
		menu.close()
	end)
end

function DoRequestModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(1)
	end
end

function DoRequestAnimSet(anim)
	RequestAnimDict(anim)
	while not HasAnimDictLoaded(anim) do
		Citizen.Wait(1)
	end
end

RegisterNetEvent('eden_animal:openPetMenu')
AddEventHandler('eden_animal:openPetMenu', function()
	OpenPetMenu()
end)
