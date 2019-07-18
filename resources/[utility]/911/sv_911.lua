-- Simple 911 Command (With Location & Blip) --
		-- Made By Chezza --

displayLocation = true  -- By Changing this to 'false' it will make it so your location is not displayed in chat --
displayTime = 120 -- Changes how long the blip will show (In Seconds) [Default 2 Mins] --
webhookurl = 'https://discordapp.com/api/webhooks/561449152903643156/iRksKD4VEgUPvP3IN8V9wQHExOUy-HBAPulxci9_Zl4361dyBGzABAMleI9aNYOI0rsm' -- Add your discord webhook url here, if you do not want this leave it blank (More info on FiveM post) --


-- Code --

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterServerEvent('911')
AddEventHandler('911', function(location, msg, x, y, z, name, ped)
	local playername = GetPlayerName(source)
	local ped = GetPlayerPed(source)
	local xPlayers = ESX.GetPlayers()

	if displayLocation == false then
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' or xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'sheriff' then
				TriggerClientEvent('chatMessage', xPlayers[i], '', {255,255,255}, '^*^1911 Call: ^4Report: ^0' .. msg)
	--		elseif (xPlayer.getInventoryItem('police_scanner')>=1)
	--			TriggerClientEvent('chatMessage', xPlayers[i], 'Scanner:', {255,0,0}, ' ^4Report: ^0' .. msg)
			end
		end
		sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Report: **' .. msg)
  else
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' or xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'sheriff' then
				TriggerClientEvent('chatMessage', xPlayers[i], '', {255,255,255}, '^*^1911 Call: ^4Location: ^0' .. location .. '^*^4  Report: ^0' .. msg)
				TriggerClientEvent('911:setBlip', xPlayers[i], name, x, y, z)
		--elseif (xPlayer.getInventoryItem('police_scanner')>=1)
			--TriggerClientEvent('chatMessage', xPlayers[i], '', {255,255,255}, '^*^1911 Call: ^4Location: ^0' .. location .. '^*^4  Report: ^0' .. msg)
			--TriggerClientEvent('911:setBlip', xPlayers[i], name, x, y, z)
			end
		end
		sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Location: **' .. location .. '** | Report: **' .. msg)

		TriggerClientEvent('gcphone:911', -1, name)

		Wait(displayTime * 1000)
		TriggerClientEvent('911:killBlip', -1)
	end
end)

function sendDiscord(name, message)
  	PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end
