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

local Radio = false -- Radio On/ Off after the engine starts
local Time = math.random(10,60)*1000 -- Time for each stage (ms)

local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
local anim = "machinic_loop_mechandplayer"
local flags = 49

ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

local vehicle
function disableEngine()
	Citizen.CreateThread(function()
		while hotwiring do
			SetVehicleEngineOn(vehicle, false, true, false)
			if not hotwiring then
				break
			end
			Citizen.Wait(0)
		end
	end)
end

function startUI(time, text, bgcolor) 
	local dcolor = 'rgba(200 ,0, 0,0.7)'
	if bgcolor then
		dcolor = bgcolor
	end
	SendNUIMessage({
		type = "ui",
		display = true,
		time = time,
		text = text,
		color = dcolor
	})
end
function stopUI(time, text, bgcolor) 
	local dcolor = 'rgba(200 ,0, 0,0.7)'
	if bgcolor then
		dcolor = bgcolor
	end
	SendNUIMessage({
		type = "ui",
		display = true,
		time = time,
		text = text,
		color = dcolor
	})
end
Citizen.CreateThread(function()
while true do
	Citizen.Wait(0)
	local player_entity = PlayerPedId()
	if IsControlJustReleased(0, Keys['F']) then
	
		if hotwiring2 then
					hotwiring3 = false
					hotwiring2 = false
					hotwiring  = false
					Citizen.Wait(1750)
					ClearPedTasksImmediately(player_entity)
					stopUI(1, "Hotwire Stage 1", "rgba(194, 54, 22,0.7)")
		end
	end
	end
end)
Citizen.CreateThread(function()
	local player_entity = PlayerPedId()
	while true do
		Citizen.Wait(0)
		if GetSeatPedIsTryingToEnter(player_entity) == -1 then
	                Citizen.Wait(10)
			vehicle = GetVehiclePedIsTryingToEnter(player_entity)
			if IsVehicleNeedsToBeHotwired(vehicle) then
				disableEngine()
				hotwiring = true
				loadAnimDict(animDict)
				Citizen.Wait(7000)
				ClearPedTasks(player_entity)
				TaskPlayAnim(player_entity, animDict, anim, 3.0, 1.0, -1, flags, 1, 0, 0, 0)
				if hotwiring then
					hotwiring2 = true
					startUI(Time, "Hotwire Stage 1", "rgba(194, 54, 22,0.7)")
					Citizen.Wait(Time+500)
					hotwiring2 = false
				end
				if hotwiring then
					hotwiring2 = true
					startUI(Time, "Hotwire Stage 2", "rgba(232, 65, 24,0.7)")
					Citizen.Wait(Time+500)
					hotwiring2 = false
				end
				if GetVehiclePedIsIn(player_entity, false) == vehicle then
					hotwiring2 = true
					hotwiring = false
					StopAnimTask(player_entity, animDict, anim, 1.0)
					Citizen.Wait(1000)
					SetVehicleEngineOn(vehicle, true, true, false)
					SetVehicleJetEngineOn(vehicle, true)
					RemoveAnimDict(animDict)
					hotwiring2 = false
					if not Radio then
						SetVehicleRadioEnabled(vehicle, false)
					end
				end
				if not hotwiring3 then
					hotwiring3 = true
					hotwiring = false
					StopAnimTask(player_entity, animDict, anim, 1.0)
					Citizen.Wait(1000)
					RemoveAnimDict(animDict)
				end
			end
		end
	end
end)
