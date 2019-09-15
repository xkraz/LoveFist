ESX          = nil
local HasAlreadyEnteredMarker = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local havebike = false

Citizen.CreateThread(function()

	if not Config.EnableBlips then return end
	
	for _, info in pairs(Config.BlipZones) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 1.0)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
        for k in pairs(Config.MarkerZones) do
		if(Config.TypeMarker ~= -1 and GetDistanceBetweenCoords(coords, Config.MarkerZones[k].x, Config.MarkerZones[k].y, Config.MarkerZones[k].z, true) < Config.DrawDistance) then
            DrawMarker(Config.TypeMarker, Config.MarkerZones[k].x, Config.MarkerZones[k].y, Config.MarkerZones[k].z, 0, 0, 0, 0, 0, 0, Config.MarkerScale.x, Config.MarkerScale.y, Config.MarkerScale.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, 0, 0, 0, 0)	
		end
    end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.MarkerZones) do
				if(GetDistanceBetweenCoords(coords, Config.MarkerZones[k].x, Config.MarkerZones[k].y, Config.MarkerZones[k].z, true) < Config.MarkerScale.x) then
					isInMarker  = true
					currentZone = k
					LastZone    = k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_bike-rental:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_bike-rental:hasExitedMarker', LastZone)
		end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
	
        for k in pairs(Config.MarkerZones) do
        	local ped = PlayerPedId()
			local playerPed = PlayerPedId(-1)
            local pedcoords = GetEntityCoords(ped, false)
            local distance = Vdist(pedcoords.x, pedcoords.y, pedcoords.z, Config.MarkerZones[k].x, Config.MarkerZones[k].y, Config.MarkerZones[k].z)
            if distance <= 1.40 then
				if havebike == false then

					helptext(_U('press_e'))
					--Disable control to be controller friendly.
					DisableControlAction(0, 24, true) -- Attack
			        DisableControlAction(0, 257, true) -- Attack 2
			        DisableControlAction(0, 25, true) -- Aim
			        DisableControlAction(0, 263, true) -- Melee Attack 1
			        DisableControlAction(0, 47, true)  -- Disable weapon
			        DisableControlAction(0, 264, true) -- Disable melee
			        DisableControlAction(0, 257, true) -- Disable melee
			        DisableControlAction(0, 140, true) -- Disable melee
			        DisableControlAction(0, 141, true) -- Disable melee
			        DisableControlAction(0, 142, true) -- Disable melee
			        DisableControlAction(0, 143, true) -- Disable melee
					
					if IsControlJustPressed(0, Config.Key) and IsPedOnFoot(ped) then
						OpenBikesMenu()
					end 
				elseif havebike == true then

					helptext(_U('storebike'))

					if IsControlJustPressed(0, Config.Key) and IsPedOnAnyBike(ped) then
						TriggerEvent('esx:deleteVehicle')
						ESX.ShowNotification(_U('bikemessage'))
						havebike = false
					end
				end
			elseif distance < 1.45 then
				ESX.UI.Menu.CloseAll()
            end
        end
    end
end)



function OpenBikesMenu()
	local elements = {}
	
	if Config.EnablePrice == false then
		table.insert(elements, {label = _U('bikefree'), value = 'bike'}) 
		--table.insert(elements, {label = _U('bike2free'), value = 'bike2'}) 
		table.insert(elements, {label = _U('bike3free'), value = 'bike3'}) 
		table.insert(elements, {label = _U('bike4free'), value = 'bike4'}) 
	end
	
	if Config.EnablePrice == true then
		table.insert(elements, {label = _U('bike'), value = 'bike'}) 
		--table.insert(elements, {label = _U('bike2'), value = 'bike2'}) 
		table.insert(elements, {label = _U('bike3'), value = 'bike3'}) 
		table.insert(elements, {label = _U('bike4'), value = 'bike4'}) 
	end
	
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'client',
    {
		title    = _U('biketitle'),
		align    = 'bottom-right',
		elements = elements,
    },
	
	
	function(data, menu)

	if data.current.value == 'bike' then
		if Config.EnablePrice then
			TriggerServerEvent("esx:bike:lowmoney", Config.PriceTriBike) 
			TriggerEvent("chatMessage", _U('bikes'), {255,0,255}, _U('bike_pay', Config.PriceTriBike))
			ESX.ShowNotification(_U('enjoy_bike'))
		end
		
		if Config.EnableEffects then
			spawn_effect("tribike2")
		else
			TriggerEvent('esx:spawnVehicle', "tribike2")
		end
	end
	
	if data.current.value == 'bike2' then
		if Config.EnablePrice then
			TriggerServerEvent("esx:bike:lowmoney", Config.PriceScorcher) 
			TriggerEvent("chatMessage", _U('bikes'), {255,0,255}, _U('bike_pay', Config.PriceScorcher))
			ESX.ShowNotification(_U('enjoy_bike'))
		end
		
		if Config.EnableEffects then
			spawn_effect("scorcher")
		else
			TriggerEvent('esx:spawnVehicle', "scorcher")
		end
		
	end
	
	if data.current.value == 'bike3' then
		if Config.EnablePrice then
			TriggerServerEvent("esx:bike:lowmoney", Config.PriceCruiser) 
			TriggerEvent("chatMessage", _U('bikes'), {255,0,255}, _U('bike_pay', Config.PriceCruiser))
			ESX.ShowNotification(_U('enjoy_bike'))
		end
		
		if Config.EnableEffects then
			spawn_effect("cruiser")
		else
			TriggerEvent('esx:spawnVehicle', "cruiser")
		end
	end
	
	if data.current.value == 'bike4' then
		if Config.EnablePrice then
			TriggerServerEvent("esx:bike:lowmoney", Config.PriceBmx) 
			TriggerEvent("chatMessage", _U('bikes'), {255,0,255}, _U('bike_pay', Config.PriceBmx))
			ESX.ShowNotification(_U('enjoy_bike'))
		end
		
		if Config.EnableEffects then
			spawn_effect("bmx")
		else
			TriggerEvent('esx:spawnVehicle', "bmx")
		end
	end

	ESX.UI.Menu.CloseAll()
	havebike = true	
	

    end,
	function(data, menu)
		menu.close()
		end
	)
end


function helptext(text)
	SetTextComponentFormat('STRING')
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function spawn_effect(somecar) 
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	TriggerEvent('esx:spawnVehicle', somecar)
	DoScreenFadeIn(3000) 
end
