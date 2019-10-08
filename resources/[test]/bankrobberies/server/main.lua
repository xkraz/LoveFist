local ESX = nil

local cachedData = {}

TriggerEvent('esx:getSharedObject', function(obj) 
	ESX = obj 
end)

ESX.RegisterServerCallback("bankrobberies:getCurrentRobbery", function(source, callback)
	callback(cachedData)
end)

ESX.RegisterServerCallback("bankrobberies:fetchCops", function(source, callback)
	local players = ESX.GetPlayers()

	local policeMen = 0

	for index, player in ipairs(players) do
		local player = ESX.GetPlayerFromId(player)

		if player then
			if player["job"]["name"] == "police" then
				policeMen = policeMen + 1
			end
		end
	end

	callback(policeMen >= Config.CopsNeeded)
end)

RegisterServerEvent("bankrobberies:globalEvent")
AddEventHandler("bankrobberies:globalEvent", function(options)
	if type(options["data"]) == "table" then
		if options["data"]["save"] then
			cachedData[options["data"]["bank"]] = {
				["started"] = os.time(),
				["robber"] = source,
				["trolleys"] = options["data"]["trolleys"]
			}
		end
	end

    TriggerClientEvent("bankrobberies:eventHandler", -1, options["event"] or "none", options["data"] or nil)
end)

RegisterServerEvent("bankrobberies:receiveCash")
AddEventHandler("bankrobberies:receiveCash", function()
	local player = ESX.GetPlayerFromId(source)

	if player then
		local randomMoney = math.random(Config.Trolley["cash"][1], Config.Trolley["cash"][2])

		player.addMoney(randomMoney)

		TriggerClientEvent("esx:showNotification", source, "You received $" .. randomMoney)
	end
end)
