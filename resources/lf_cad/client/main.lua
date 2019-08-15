local open = false
callsign = ""

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if ( IsControlJustReleased( 0, 56 ) or IsDisabledControlJustReleased( 0, 56 ) ) then
			xPlayer = ESX.GetPlayerData()
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' or xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'courthouse' then
				ToggleCad()
			end
		end
	end
end)

RegisterNUICallback('close', function(data, cb)
    ToggleCad()
	if cb then cb("ok") end
end)


RegisterCommand("dooff",function()
	SetNuiFocus(false)
end)


function ToggleCad()
	if open then
		SetNuiFocus(false)
		SendNUIMessage({fnc = 'close'})
	else
		SetNuiFocus(true, true)
		SendNUIMessage({
			fnc = 'open'
		})
		ESX.TriggerServerCallback('CAD:getCalls', function(calls)
			SendNUIMessage({
				fnc = 'updateCalls',
				data = calls
			})
		end)
	end
	open = not open
	
end

RegisterNUICallback("lookupPlate", function(data, cb)
	ESX.TriggerServerCallback('CAD:lookupPlate', function(plateInfo)
		SendNUIMessage({
			fnc = 'plateLookup',
			data = plateInfo
		})
	end, data.plate)
	if cb then cb("ok") end
end)

RegisterNUICallback("lookupChars", function(data, cb)
	ESX.TriggerServerCallback('CAD:charLookup', function(charInfo)
		SendNUIMessage({
			fnc = 'charList',
			data = charInfo
		})
	end, data.firstname, data.lastname)
	if cb then cb("ok") end
end)

RegisterNUICallback("fetchChar", function(data, cb)
	ESX.TriggerServerCallback('CAD:getChar', function(charInfo)
		SendNUIMessage({
			fnc = 'showChar',
			data = charInfo
		})
	end, data.id)
	if cb then cb("ok") end
end)


RegisterNUICallback("newCall", function(data, cb)
local playerPed   = PlayerPedId()
local pos      = GetEntityCoords(playerPed)
local tbl = {}
tbl.X = pos.x 
tbl.Y = pos.y
--local posplayer = posX..','..posY
--print(posX..','..posY)
    local call =     {
        ["type"] = data.type,
        ["message"] = data.message,
        ["location"] = data.location,
        ["gpspos"] = tbl,
        ["units"] = {}
    }
    TriggerServerEvent("CAD:addCall", call)
end)


RegisterNUICallback("code4", function(data, cb)
    TriggerServerEvent("CAD:code4", data.id)
end)

RegisterNUICallback("markOnGPS", function(data, cb)
local pos2
local pos
for i,v in pairs(data)do
    for j, k in pairs(v)do
          if j == "X" then
          pos = k    
    else
          pos2 = k
    end
    end
	end

    SetNewWaypoint(pos, pos2)
end)

RegisterNUICallback("setCallsign", function(data, cb)
	callsign = data.callsign
	TriggerEvent("pNotify:SendNotification",{
		text = "<center><b style='color:#FF4233'>Love</b>Fist<b style='color:#33B2FF'>Roleplay</b> CAD Notification<br /> <br /> Saved new callsign! </b>",
		type = "error",
		timeout = (6000),
		layout = "centerRight",
		queue = "global"
	})
end)

RegisterNUICallback("respond", function(data, cb)
	if callsign == "" then
		TriggerEvent("pNotify:SendNotification",{
			text = "<center><b style='color:#FF4233'>Love</b>Fist<b style='color:#33B2FF'>Roleplay</b> CAD Notification<br /> <br /> You can not respond to a call without setting a callsign! </b>",
			type = "error",
			timeout = (6000),
			layout = "centerRight",
			queue = "global"
		})
	else
		TriggerServerEvent("CAD:respondCall", data.id, callsign)
	end
end)

RegisterNetEvent("CAD:updateCalls")
AddEventHandler("CAD:updateCalls", function(calls)
	SendNUIMessage({
		fnc = 'updateCalls',
		data = calls
	})
end)
