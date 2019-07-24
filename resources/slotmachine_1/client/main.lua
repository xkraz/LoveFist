local input = {["E"] = 38,["DOWN"] = 173,["TOP"] = 27,["NENTER"] =  201}
ESX                           = nil
local PlayerData                = {}



Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)


Citizen.CreateThread(function()
SetNuiFocus(false, false)
end)


RegisterNetEvent('errormessage2')
AddEventHandler('errormessage2', function()
PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
end)


RegisterNetEvent('spinit2')
AddEventHandler('spinit2', function()
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)

	SendNUIMessage({
			canspin = true
		})
	Citizen.Wait(100)

		SendNUIMessage({
			canspin = false
		})

end)


RegisterNUICallback('close', function(data, cb)

	SetNuiFocus(false, false)
	SendNUIMessage({
		show = false
	})
	cb("ok")
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)

end)




RegisterNUICallback('payforplayer', function(winnings, cb)
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0, 0, 1)
	TriggerServerEvent('payforplayer2',winnings)
end)


RegisterNUICallback('playerpays', function(bet, cb)
	TriggerServerEvent('playerpays2',bet)
end)

local moneymachine_slot = {
	{ ['x'] = 1105.81, ['y'] = 228.97, ['z'] = -49.20 },
	{ ['x'] = 1101.80, ['y'] = 231.58, ['z'] = -49.20 },
	{ ['x'] = 1107.61, ['y'] = 233.40, ['z'] = -49.20 },
	{ ['x'] = 1109.31, ['y'] = 238.55, ['z'] = -49.20 },
	{ ['x'] = 1112.72, ['y'] = 238.46, ['z'] = -49.20 },
	{ ['x'] = 1103.75, ['y'] = 230.53, ['z'] = -49.20 },
	{ ['x'] = 1109.75, ['y'] = 235.06, ['z'] = -49.20 },
	{ ['x'] = 1114.90, ['y'] = 233.15, ['z'] = -49.20 },
	{ ['x'] = 1112.79, ['y'] = 234.68, ['z'] = -49.20 },
	{ ['x'] = 1120.14, ['y'] = 231.46, ['z'] = -49.20 },
    { ['x'] = 1118.00, ['y'] = 228.28, ['z'] = -49.20 },
	
	{ ['x'] = 1133.02, ['y'] = 248.42, ['z'] = -50.40 },
	{ ['x'] = 1132.12, ['y'] = 250.06, ['z'] = -50.40 },
    { ['x'] = 1130.53, ['y'] = 250.99, ['z'] = -50.40 },
	
	{ ['x'] = 1135.03, ['y'] = 255.06, ['z'] = -50.40 },
    { ['x'] = 1137.54, ['y'] = 252.93, ['z'] = -50.40 },

}



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(moneymachine_slot) do
			if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 20.0)then
				DrawMarker(29, v.x, v.y, v.z + 0.2, 0, 0, 0, 0, 0, 0, 0.2, 0.2, 0.2, 0, 255, 5, 190, 0,0, 0,1)
			--	DrawMarker(21, v.Armories[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
				if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 1.0)then
				
						DisplayHelpText("Press ~INPUT_CONTEXT~   ~y~to play Slots.")
						StopSound()
					if IsControlJustPressed(1,input["E"]) then
						SendNUIMessage({
							show = true
						})
						SetNuiFocus(true,true)
						PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)

					end
				end
			end
		end
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

