local holdingup = false
local hackholdingup = false
local bombholdingup = false
local bank = ""
local savedbank = {}
local secondsRemaining = 0
local dooropen = false
local platingbomb = false
local platingbombtime = 20
local blipRobbery = nil
globalcoords = nil
globalrotation = nil
globalDoortype = nil
globalbombcoords = nil
globalbombrotation = nil
globalbombDoortype = nil
local playerJob = ""



ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	playerJob = ESX.GetPlayerData().job.name
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y+ 0.005)
end

RegisterNetEvent('esx_holdupbank:currentlyrobbing')
AddEventHandler('esx_holdupbank:currentlyrobbing', function(robb)
	holdingup = true
	bank = robb
	secondsRemaining = Banks[robb].robtime
end)

RegisterNetEvent('esx_holdupbank:currentlyhacking')
AddEventHandler('esx_holdupbank:currentlyhacking', function(robb, thisbank)
	hackholdingup = true
	TriggerEvent("mhacking:show")
	TriggerEvent("mhacking:start",1,20, opendoors)
	savedbank = thisbank
	bank = robb
	secondsRemaining = 20000
end)

RegisterNetEvent('esx_holdupbank:plantingbomb')
AddEventHandler('esx_holdupbank:plantingbomb', function(robb, thisbank)
	bombholdingup = true

	savedbank = thisbank
	bank = robb
	plantBombAnimation()
	secondsRemaining = 20000
end)

RegisterNetEvent('esx_holdupbank:newsbroadcast')
AddEventHandler('esx_holdupbank:newsbroadcast', function(bankk, robb, _c4)

	if (playerJob == 'police') or (playerJob == 'fib') then
			TriggerEvent('chatMessage', 'NEWS',{ 255, 0, 0}, " Robbery in progress at ^2" .. bankk)
			TriggerEvent('esx:showNotification', _U('rob_in_prog') .. bankk)

			if (_c4 == false) then
				TriggerEvent('esx_holdupbank:setblip',Banks[robb].position)
			end
	end

	if (playerJob == 'reporter') then
		Citizen.CreateThread(function()
			Citizen.Wait(1000*Config.NewsDelay)
			TriggerEvent('chatMessage', 'NEWS',{ 255, 0, 0}, " Robbery in progress at ^2" .. bankk)
		end)
	end
end)

function opendoors(success, timeremaining)
	if success then
		print('Success with '..timeremaining..'s remaining.')
		TriggerEvent('mhacking:hide')
		TriggerEvent('esx_holdupbank:hackcomplete')

	else
		print('Failure')
		TriggerEvent('mhacking:hide')
	end
end

RegisterNetEvent('esx_holdupbank:killblip')
AddEventHandler('esx_holdupbank:killblip', function()
    RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdupbank:setblip')
AddEventHandler('esx_holdupbank:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
	TriggerEvent('mhacking:hide')
end)

RegisterNetEvent('esx_holdupbank:toofarlocal')
AddEventHandler('esx_holdupbank:toofarlocal', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_cancelled'))
	robbingName = ""
	secondsRemaining = 0
	incircle = false
end)

RegisterNetEvent('esx_holdupbank:toofarlocalhack')
AddEventHandler('esx_holdupbank:toofarlocalhack', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_cancelled'))
	robbingName = ""
	secondsRemaining = 0
	incircle = false
end)

RegisterNetEvent('esx_holdupbank:closedoor')
AddEventHandler('esx_holdupbank:closedoor', function()
	dooropen = false
end)

RegisterNetEvent('esx_holdupbank:robberycomplete')
AddEventHandler('esx_holdupbank:robberycomplete', function(_amount)
	holdingup = false
	ESX.ShowNotification(_U('robbery_complete') .. _amount.. ', ~w~now run!')
	bank = ""
	TriggerEvent('esx_blowtorch:finishclear')
	TriggerServerEvent('esx_holdupbank:closedoor')
	TriggerEvent('esx_blowtorch:stopblowtorching')
	secondsRemaining = 0
	dooropen = false
	incircle = false
end)

RegisterNetEvent('esx_holdupbank:hackcomplete')
AddEventHandler('esx_holdupbank:hackcomplete', function()
	hackholdingup = false
	ESX.ShowNotification(_U('hack_complete'))

	TriggerServerEvent('esx_holdupbank:opendoor', Banks[bank].hackposition.x, Banks[bank].hackposition.y, Banks[bank].hackposition.z, Banks[bank].doortype)

	bank = ""

	secondsRemaining = 0
	incircle = false
	TriggerEvent('mhacking:hide')
end)
RegisterNetEvent('esx_holdupbank:plantbombcomplete')
AddEventHandler('esx_holdupbank:plantbombcomplete', function(bank)
	bombholdingup = false


	ESX.ShowNotification(_U('bombplanted_run'))
	TriggerServerEvent('esx_holdupbank:plantbombtoall', bank.bombposition.x,  bank.bombposition.y, bank.bombposition.z, bank.bombdoortype)

	incircle = false
end)

RegisterNetEvent('esx_holdupbank:plantedbomb')
AddEventHandler('esx_holdupbank:plantedbomb', function(x,y,z,doortype)
	local coords = {x,y,z}
	local obs, distance = ESX.Game.GetClosestObject(doortype, coords)

    --AddExplosion( bank.bombposition.x,  bank.bombposition.y, bank.bombposition.z , 0, 0.5, 1, 0, 1065353216, 0)
    AddExplosion( x,  y, z , 0, 0.5, 1, 0, 1065353216, 0)
    AddExplosion( x,  y, z , 0, 0.5, 1, 0, 1065353216, 0)
   -- AddExplosion( bank.bombposition.x,  bank.bombposition.y, bank.bombposition.z , 0, 0.5, 1, 0, 1065353216, 0)

	local rotation = GetEntityHeading(obs) + 47.2869
	SetEntityHeading(obs,rotation)
	globalbombcoords = coords
	globalbombrotation = rotation
	globalbombDoortype = doortype
	Citizen.CreateThread(function()
		while dooropen do
			Wait(2000)
			local obs, distance = ESX.Game.GetClosestObject(globalbombDoortype, globalbombcoords)
			SetEntityHeading(obs, globalbombrotation)
			Citizen.Wait(0);
		end
	end)
end)


RegisterNetEvent('esx_holdupbank:opendoors')
AddEventHandler('esx_holdupbank:opendoors', function(x,y,z,doortype)
	dooropen = true;

	local coords = {x,y,z}
	local obs, distance = ESX.Game.GetClosestObject('hei_v_ilev_bk_gate2_pris', coords)

	local pos = GetEntityCoords(obs);


	local rotation = GetEntityHeading(obs) + 70
	globalcoords = coords
	globalrotation = rotation
	globalDoortype = doortype
	Citizen.CreateThread(function()
	while dooropen do
		Wait(2000)
		local obs, distance = ESX.Game.GetClosestObject(globalDoortype, globalcoords)
		SetEntityHeading(obs, globalrotation)
	end
	end)
end)


RegisterNetEvent('esx_holdupbank:exit')
AddEventHandler('esx_holdupbank:exit', function(bank)
	SetEntityCoordsNoOffset(GetPlayerPed(-1), bank.hackposition.x , bank.hackposition.y, bank.hackposition.z, 0, 0, 1)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if holdingup then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1000
			end
			if secondsRemaining < 1000 and secondsRemaining > 0 then
				secondsRemaining = 0
			end
		end
		if hackholdingup then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1000
			end
			if secondsRemaining < 1000 and secondsRemaining > 0 then
				secondsRemaining = 0
			end
		end
		if bombholdingup then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1000
			end
			if secondsRemaining < 1000 and secondsRemaining > 0 then
				secondsRemaining = 0
			end
		end
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(Banks)do
		local ve = v.position

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 255)--156
		SetBlipScale(blip, 0.8)
		SetBlipColour(blip, 75)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('bank_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)
incircle = false

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(Banks)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if not holdingup then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob') .. v.nameofbank)
						end
						incircle = true
						if IsControlJustReleased(1, 51) then
							TriggerServerEvent('esx_holdupbank:rob', k)
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				end
			end
		end

		if holdingup then
			drawTxt(0.4, 0.94, 1.0,1.0,0.4, _U('robbery_of') .. fmtTime(secondsRemaining) .. ' remains!', 255, 255, 255, 255)
			DisplayHelpText(_U('press_to_cancel'))

			local pos2 = Banks[bank].position


			if IsControlJustReleased(1, 51) then
				TriggerServerEvent('esx_holdupbank:toofar', bank)
				TriggerEvent('esx_blowtorch:stopblowtorching')
			end

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5)then
				TriggerServerEvent('esx_holdupbank:toofar', bank)
			end
		end

		Citizen.Wait(0)
	end
end)
-- esx_knatusrobberybank
RegisterNetEvent('bankstartalarm')
AddEventHandler('bankstartalarm', function(_bank)
	TriggerEvent('PlayLoopAt',Banks[_bank].position,"bankAlarm")
end)

RegisterNetEvent('bankstopalarm')
AddEventHandler('bankstopalarm', function(_bank)
	TriggerEvent('StopLoopAt',Banks[_bank].position)
end)

RegisterCommand('sound',  function(source, args)
	TriggerEvent('PlayLoopAt',vector3(-107.06505584717, 6474.8012695313, 31.62670135498 ),"bankAlarm")
end)

RegisterCommand('soundoff',  function(source, args)
	local pos = GetEntityCoords(GetPlayerPed(-1), true)
	TriggerEvent('StopLoopAll')
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

		if _in >= (_second) and _tmp < 600000 then
			local tmp = math.floor(_in / _second)
			_in = _in - tmp * _second
			if out ~= "" then out = out .. " " end
			out = out .. tmp .. 's'
		end

		if _in >= 1 and _tmp < 30000 then
			local tmp = _in
			_in = _in - tmp
			if out ~= "" then out = out .. " " end
			out = out .. tmp .. 'ms'
		end

		return out
	end
end
Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(Banks)do
			local pos2 = v.hackposition
			if pos2 ~= nil then
				if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0) then
					if not hackholdingup then
						DrawMarker(1, v.hackposition.x, v.hackposition.y, v.hackposition.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

						if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
							if (incircle == false) then
								DisplayHelpText(_U('press_to_hack') .. v.nameofbank)
							end
							incircle = true
							if IsControlJustReleased(1, 51) then
								TriggerServerEvent('esx_holdupbank:hack', k)
							end
						elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
							incircle = false
						end
					end
				end
			end
		end

		if hackholdingup then

			--drawTxt(0.66, 1.44, 1.0,1.0,0.4, _U('hack_of') .. secondsRemaining .. _U('seconds_remaining'), 255, 255, 255, 255)

			local pos2 = Banks[bank].hackposition

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5)then
				TriggerServerEvent('esx_holdupbank:toofarhack', bank)
			end
		end

		Citizen.Wait(0)
	end
end)


Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(Banks)do
			local pos2 = v.bombposition
			if (pos2 ~= nil) then
				if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
					if not bombholdingup then
						DrawMarker(1, v.bombposition.x, v.bombposition.y, v.bombposition.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

						if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
							if (incircle == false) then
								DisplayHelpText(_U('press_to_bomb') .. v.nameofbank)
							end
							incircle = true
							if IsControlJustReleased(1, 51) then
								TriggerServerEvent('esx_holdupbank:plantbomb', k)
							end
						elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
							incircle = false
						end
					end
				end
			end
		end
		if bombholdingup then

		--	drawTxt(0.66, 1.44, 1.0,1.0,0.4, _U('bomb_of') .. secondsRemaining .. _U('seconds_remaining'), 255, 255, 255, 255)
			--DisplayHelpText(_U('press_to_cancel'))

			local pos2 = Banks[bank].bombposition


			if IsControlJustReleased(1, 51) then
			--	TriggerServerEvent('esx_holdupbank:toofar', bank)
			end

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 7.5)then
			--	TriggerServerEvent('esx_holdupbank:toofar', bank)
			end
		end

		Citizen.Wait(0)
	end

end)

function plantBombAnimation()
	local playerPed = GetPlayerPed(-1)

	Citizen.CreateThread(function()
		platingbomb = true
			while platingbomb do
				Wait(1000)

				TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_KNEEL", 0, true)


				if secondsRemaining <= 1 then
					platingbomb = false
					ClearPedTasksImmediately(PlayerPedId())
				end
				Citizen.Wait(0)
			end

	end)
end
