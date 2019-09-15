ESX = nil
LastDelivery = 0.0


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function GetCopsOnline()

	local PoliceConnected = 0
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'dea' or xPlayer.job.name == 'fib' then
			PoliceConnected = PoliceConnected + 1
		end
	end

	return PoliceConnected
end



RegisterServerEvent('esx_cargodelivery:resetEvent')
AddEventHandler('esx_cargodelivery:resetEvent', function()
	LastDelivery = 0.0
end)

RegisterServerEvent('esx_cargodelivery:cooldown')
AddEventHandler('esx_cargodelivery:cooldown', function()
deliverycomplete = true
Citizen.Wait(60000 * 180)
deliverycomplete = false
end)




ESX.RegisterServerCallback('esx_cargodelivery:getCopsOnline', function(source, cb)
	cb(GetCopsOnline())
end)






ESX.RegisterServerCallback('esx_cargodelivery:sellCargo', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.UsesBlackMoney then
	
		xPlayer.addAccountMoney('black_money', price)
	
	else

		xPlayer.addMoney(price)

	end
	
	TriggerClientEvent('esx:showNotification', source, "You earned ~r~" .. price .. "~w~ for delivering the cargo.")
	cb(true)

	LastDelivery = 0.0

end)





ESX.RegisterServerCallback('esx_cargodelivery:buyCargo', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)


	if (os.time() - LastDelivery) < Config.TimerBeforeNewDel and LastDelivery ~= 0 or deliverycomplete == true then
		TriggerClientEvent('esx:showNotification', source, "Delivery in progress or has been completed in the last 3 hours.")
		cb(false)

	else 

		police_alarm_time = os.time() + math.random(10000, 20000)

		if Config.UsesBlackMoney then

local methQuantity = xPlayer.getInventoryItem('meth_pooch').count
local opiumQuantity = xPlayer.getInventoryItem('opium_pooch').count
local weedQuantity = xPlayer.getInventoryItem('weed_pooch').count
local cokeQuantity = xPlayer.getInventoryItem('coke_pooch').count
			if methQuantity > 15 and weedQuantity > 15 and cokeQuantity > 15 then

				xPlayer.removeInventoryItem('meth_pooch', 16)
				--xPlayer.removeInventoryItem('opium_pooch', 16)
				xPlayer.removeInventoryItem('weed_pooch', 16)
				xPlayer.removeInventoryItem('coke_pooch', 16)
				LastDelivery = os.time()

				cb(true)
			else

				TriggerClientEvent('esx:showNotification', source, "Not enough ~r~drugs~w~.")
	

				cb(false)
			end

		else 

				if xPlayer.getMoney() >= price then

				xPlayer.removeMoney(price)

				LastDelivery = os.time()

				cb(true)
			else

				TriggerClientEvent('esx:showNotification', source, "Not enough ~r~money~w~.")
	
				cb(false)
			end
		end

	end

end)

-- Simple cargo Command (With Location & Blip) -- 
		-- Made By Chezza --

displayLocation = true  -- By Changing this to 'false' it will make it so your location is not displayed in chat --
displayTime = 20 -- Changes how long the blip will show (In Seconds) [Default 2 Mins] --  
webhookurl = 'https://discordapp.com/api/webhooks/561449152903643156/iRksKD4VEgUPvP3IN8V9wQHExOUy-HBAPulxci9_Zl4361dyBGzABAMleI9aNYOI0rsm' -- Add your discord webhook url here, if you do not want this leave it blank (More info on FiveM post) --

-- Code --

RegisterServerEvent('cargo')
AddEventHandler('cargo', function(location, x, y, z, name, ped)
	local playername = GetPlayerName(source)
	local ped = GetPlayerPed(source)
	cargo = 'Someone is moving product...'
	if displayLocation == false then
		TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4cargo | Caller ID: ^r' .. playername .. '^*^4 | Report: ^r' .. msg)
   	else
		TriggerClientEvent('cargo:setBlip', -1, name, x, y, z)
		Citizen.Wait(12400)
		TriggerClientEvent('cargo:killBlip', -1)
	end
end)

function sendDiscord(name, message)
  	PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end


RegisterServerEvent('cargo1')
AddEventHandler('cargo1', function(location, x, y, z, name, ped)
	local playername = GetPlayerName(source)
	local ped = GetPlayerPed(source)
	cargo = 'Someone is moving product...'
	catch = 'better go catch them...'
	if displayLocation == false then
		TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4cargo | Caller ID: ^r' .. playername .. '^*^4 | Report: ^r' .. msg)
   	else
		TriggerClientEvent('chatMessage', -1, '', {255,0,0}, '^*^1CARGO DELIEVERY: ^4' .. cargo .. '^*^1 | Location: ^4' .. catch .. '^*^4  ' )
		TriggerClientEvent('cargo:setBlip', -1, name, x, y, z)
		Citizen.Wait(12400)
		TriggerClientEvent('cargo:killBlip', -1)
	end
end)

function sendDiscord(name, message)
  	PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end


	