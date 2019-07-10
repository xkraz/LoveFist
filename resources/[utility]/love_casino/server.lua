--local Tunnel = module("vrp", "lib/Tunnel")
--local Proxy = module("vrp", "lib/Proxy")
ESX              = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


print("[exs_casino]")
print(Tunnel)
print(Proxy)
print(Tools)

vRPcs = {}
--vRP = Proxy.getInterface("vRP")
--vRPclient = Tunnel.getInterface("vRP","vRP_casino")
--vRPCasinoC = Tunnel.getInterface("vRP_casino","vRP_casino")
--Tunnel.bindInterface("vRP_casino",vRPcs)

rouletteBetters = {}
slotMachinesBetters = {}

barbutPlayers = {}

-- KEK TOP KEK --
local price = {}
price.line3 = {
	cherry = 20,
	lemon = 15,
	other = 10
}
price.line2 = {
	cherry = 3,
	other = 2
}

rouletteBets = {
	{"Green", "Bet on <font color='green'>Green</font><br>Win Chance: <font color='red'>2.7%</font><br>Winnings: <font color='yellow'>x5</font>", 10, 0},
	{"Red", "Bet on <font color='red'>Red</font><br>Win Chance: <font color='green'>48.65%</font><br>Winnings: <font color='yellow'>x2</font>", 2, 1},
	{"Black", "Bet on <font color='grey'>Black</font><br>Win Chance: <font color='green'>48.65%</font><br>Winnings: <font color='yellow'>x2</font>", 2, 2}
}

tokenDealer = {
	{924.5140991211, -943.33154296875, 43.85},
	{924.35131835938, -942.13037109375,43.3}
}

barbutDealer = {
	{968.11149658204, 23.57079101562, 3.45},
	{967.65846435546, 26.763934326172, 3.45}
}

roulettes = {
	{924.38452148438, -947.25469970704, 43.85},
	{924.28399658204, -954.68328857422, 43.85}
}

local casinoCasier_menu = {name="Casino Cashier",css={top="75px", header_color="rgba(0,125,255,0.75)"}}
local casinoRoulette_menu = {name="Roulette",css={top="75px", header_color="rgba(0,125,255,0.75)"}}
local casinoBarbut_menu = {name="Throw Craps",css={top="75px", header_color="rgba(0,125,255,0.75)"}}
local casinoBarbut1v1_menu = {name="Throw Craps 1v1",css={top="75px", header_color="rgba(0,125,255,0.75)"}}

function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end


RegisterServerEvent('esx_casino:giveChips')
AddEventHandler('esx_casino:giveChips', function(amount)
	print("[esx_casino:giveChips] Giving Chips")
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	amount = ESX.Math.Round(amount)
	xPlayer.addInventoryItem('casino_chip', amount)
end)

RegisterServerEvent('esx_casino:takeChips')
AddEventHandler('esx_casino:takeChips', function(amount)
	local _source = source
	print("[esx_casino:giveChips] Taking Chips")
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local chips = xPlayer.getInventoryItem('casino_chip')
	print(chips)
	print(chips.count)
	amount = ESX.Math.Round(amount)

	if chips.count >= amount then
		xPlayer.removeInventoryItem('casino_chip', amount)
		TriggerClientEvent('esx_casino:startRoulette', _source, xPlayer)
	else
		TriggerClientEvent('esx:showNotification', _source, "Not Enough Chips")
	end
end)


RegisterServerEvent('esx_casino:startBarbut')
AddEventHandler('esx_casino:startBarbut', function(amount)
	local _source = source
	print("[esx_casino:startBarbut] Taking Chips")
	local xPlayer = ESX.GetPlayerFromId(_source)
	local chips = xPlayer.getInventoryItem('casino_chip')
	print(chips)
	print(chips.count)
	amount = ESX.Math.Round(amount)
	if chips.count >= amount then
		xPlayer.removeInventoryItem('casino_chip', amount)
		TriggerClientEvent('esx_casino:startBarbut', _source, xPlayer)
		Barbut1v1(_source, "NPC", amount)
	else
		TriggerClientEvent('esx:showNotification', _source, "Not Enough Chips")
	end
end)

RegisterServerEvent('esx_casino:spinSlotMachine')
AddEventHandler('esx_casino:spinSlotMachine', function(amount, rand1, rand2, rand3)
	local _source = source
	print("[esx_casino:spinSlotMachine] Taking Chips")
	local xPlayer = ESX.GetPlayerFromId(_source)
	local chips = xPlayer.getInventoryItem('casino_chip')
	print(chips)
	print(chips.count)
	amount = ESX.Math.Round(amount)
	if chips.count >= amount then
		xPlayer.removeInventoryItem('casino_chip', amount)
		TriggerClientEvent('esx_casino:spinSlotMachine', _source, rand1, rand2, rand3)
		spinSlotMachine(amount, rand1, rand2, rand3)
		--Barbut1v1(_source, "NPC", amount)
	else
		TriggerClientEvent('esx:showNotification', _source, "Not Enough Chips")
	end
end)

casinoBarbut1v1_menu[".🎲Create Craps Match🎲"] = {function(player, choice)
	local user_id = vRP.getUserId({player})
	if((barbutPlayers[user_id].oponent == 0) and (barbutPlayers[user_id].cota == 0)) or (barbutPlayers[user_id] == nil) then
		vRP.prompt({player, "Stake:", "How many chips should each player bet", function(player, chips)
			if(chips ~= "" and chips ~= nil)then
				if(tonumber(chips))then
					chips = tonumber(chips)
					if(chips > 0) and (chips <= 999)then
						if vRP.tryGetInventoryItem({user_id,"casino_token",chips,false}) then
							barbutPlayers[user_id] = {oponent = 0, cota = chips}
							vRPclient.notify(player, {"[CASINO] ~g~You created a Craps match with the stake of ~y~"..chips.." Chips"})
							vRPclient.notify(player, {"[CASINO] ~g~Wait for someone to join your match!"})
							vRP.closeMenu({player})
							SetTimeout(15000, function()
								if(barbutPlayers[user_id].cota ~= 0)then
									vRPclient.notify(player, {"[CASINO] ~r~The Craps match has ended! No one joined your match!"})
									barbutPlayers[user_id] = {oponent = 0, cota = 0}
									casinoBarbut1v1_menu[GetPlayerName(player)] = nil
									vRP.giveInventoryItem({user_id,"casino_token",chips,false})
								end
							end)

							casinoBarbut1v1_menu[GetPlayerName(player)] = {function(thePlayer, choice)
								local pID = vRP.getUserId({thePlayer})
								if(pID == user_id)then
									vRPclient.notify(thePlayer, {"[CASINO] ~r~Nu poti sa iti accepti propria cerere de barbut!"})
								else
									if(barbutPlayers[pID].cota ~= 0) and (barbutPlayers[pID].oponent == 0)then
										if vRP.tryGetInventoryItem({pID,"casino_token",chips,false}) then
											casinoBarbut1v1_menu[GetPlayerName(player)] = nil
											vRPclient.notify(thePlayer, {"[CASINO] ~g~You accepted ~r~"..GetPlayerName(player).."'s Craps match!"})
											vRPclient.notify(player, {"[CASINO] ~r~"..GetPlayerName(thePlayer).." ~g~accepted your Craps match!"})
											vRP.closeMenu({thePlayer})
											barbutPlayers[user_id] = {oponent = pID, cota = chips}
											vRPcs.doBarbut1v1(player)
										end
									else
										vRPclient.notify(thePlayer, {"[CASINO] ~r~This Craps match is expired!"})
									end
								end
							end, "Opponent: <font color='red'>"..GetPlayerName(player).." ["..user_id.."]</font><br>Stake: <font color='green'>"..chips.." Chips</font><br>Potential Winning: <font color='green'>"..(chips*2).." Chips</font>"}
						else
							vRPclient.notify(player, {"[CASINO] ~r~You don't have enough Chips!"})
						end
					else
						vRPclient.notify(player, {"[CASINO] ~r~You need to add a Chips number between 0 and 99!"})
					end
				else
					vRPclient.notify(player, {"[CASINO] ~r~You need to enter a number of Chips!"})
				end
			else
				vRPclient.notify(player, {"[CASINO] ~r~You need to enter a number of Chips!"})
			end
		end})
	else
		vRPclient.notify(player, {"[CASINO] ~r~You already have a Craps match active! Wait till someone joins your match!"})
	end
end, "Create a 'Throw Craps' match"}

casinoBarbut_menu["Throw Craps"] = {function(player, choice)
	local user_id = vRP.getUserId({player})
	
	if(user_id ~= nil and user_id ~= "")then
		vRP.prompt({player, "Stake (Chips):", "", function(player, tokenNr)
			if(tokenNr ~= "" and tokenNr ~= nil)then
				if(tonumber(tokenNr))then
					tokenNr = tonumber(tokenNr)
					if(tokenNr > 0) and (tokenNr <= 999)then
						if vRP.tryGetInventoryItem({user_id,"casino_token",tokenNr,false}) then
							vRP.closeMenu({player})
							local whoIsFirst = math.random(1, 2)
							local brokerRoll = math.random(1, 20000)
							local brokerRoll2 = math.random(1, 20000)
							local playerRoll = math.random(1, 20000)
							local playerRoll2 = math.random(1, 20000)
							local totalBroker = tonumber(brokerRoll + brokerRoll2)
							local totalPlayer = tonumber(playerRoll + playerRoll2)
							if(whoIsFirst == 1)then
								SetTimeout(1000, function()
									vRPclient.notify(player, {"[CASINO] ~g~Broker's Hand:\n~p~(~y~"..brokerRoll.."~r~ , ~y~"..brokerRoll2.."~p~) ~b~("..totalBroker..")"})
									SetTimeout(1000, function()
										vRPclient.notify(player, {"[CASINO] ~g~Your Hand:\n~p~(~y~"..playerRoll.."~r~ , ~y~"..playerRoll2.."~p~) ~b~("..totalPlayer..")"})
										if(totalBroker < totalPlayer)then
											vRPclient.notify(player, {"[CASINO] ~g~You won this hand! You won ~y~"..(tokenNr*2).." Chips"})
											vRP.giveInventoryItem({user_id,"casino_token",tokenNr*2,false})
										elseif(totalPlayer < totalBroker)then
											vRPclient.notify(player, {"[CASINO] ~r~You lost this hand!"})
										elseif((brokerRoll == playerRoll) and (brokerRoll2 == playerRoll2))then
											vRPclient.notify(player, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..tokenNr.." Chips"})
											vRP.giveInventoryItem({user_id,"casino_token",tokenNr,false})
										elseif((brokerRoll == playerRoll2) and (brokerRoll2 == playerRoll))then
											vRPclient.notify(player, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..tokenNr.." Chips"})
											vRP.giveInventoryItem({user_id,"casino_token",tokenNr,false})
										elseif (totalPlayer == totalBroker)then
											vRPclient.notify(player, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..tokenNr.." Chips"})
											vRP.giveInventoryItem({user_id,"casino_token",tokenNr,false})
										end
									end)
								end)
							else
								SetTimeout(1000, function()
									vRPclient.notify(player, {"[CASINO] ~g~Your Hand:\n~p~(~y~"..playerRoll.."~r~ , ~y~"..playerRoll2.."~p~) ~b~("..totalPlayer..")"})
									SetTimeout(1000, function()
										vRPclient.notify(player, {"[CASINO] ~g~Broker's Hand:\n~p~(~y~"..brokerRoll.."~r~ , ~y~"..brokerRoll2.."~p~) ~b~("..totalBroker..")"})
										if(totalBroker < totalPlayer)then
											vRPclient.notify(player, {"[CASINO] ~g~You won this hand! You won ~y~"..(tokenNr*2).." Chips"})
											vRP.giveInventoryItem({user_id,"casino_token",tokenNr*2,false})
										elseif(totalPlayer < totalBroker)then
											vRPclient.notify(player, {"[CASINO] ~r~You lost this hand!"})
										elseif((brokerRoll == playerRoll) and (brokerRoll2 == playerRoll2))then
											vRPclient.notify(player, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..tokenNr.." Chips"})
											vRP.giveInventoryItem({user_id,"casino_token",tokenNr,false})
										elseif((brokerRoll == playerRoll2) and (brokerRoll2 == playerRoll))then
											vRPclient.notify(player, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..tokenNr.." Chips"})
											vRP.giveInventoryItem({user_id,"casino_token",tokenNr,false})
										elseif (totalPlayer == totalBroker)then
											vRPclient.notify(player, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..tokenNr.." Chips"})
											vRP.giveInventoryItem({user_id,"casino_token",tokenNr,false})
										end
									end)
								end)
							end
						else
							vRPclient.notify(player, {"[CASINO] ~r~You don't have enough Chips!"})
						end
					else
						vRPclient.notify(player, {"[CASINO] ~r~You need to add a Chips number between 0 and 99!"})
					end
				else
					vRPclient.notify(player, {"[CASINO] ~r~You need to enter a number of Chips!"})
				end
			else
				vRPclient.notify(player, {"[CASINO] ~r~You need to enter a number of Chips!"})
			end
		end})
	end
end, "Play 'Throw Craps' with the Broker"}

for i, v in pairs(rouletteBets) do
	casinoRoulette_menu[v[1]] = {function(player, choice)
		local user_id = vRP.getUserId({player})
		if(user_id ~= nil and user_id ~= "")then
			if(rouletteBetters[user_id] ~= nil)then
				vRPclient.notify(player, {"[CASINO] ~r~You already have a roulette active!"})
			else
				vRP.prompt({player, "Bet Chips:", "", function(player, tokenNr)
					if(tokenNr ~= "" and tokenNr ~= nil)then
						if(tonumber(tokenNr))then
							tokenNr = tonumber(tokenNr)
							if(tokenNr > 0) and (tokenNr <= 999)then
								if vRP.tryGetInventoryItem({user_id,"casino_token",tokenNr,false}) then
									if(v[4] == 1)then
										vRPCasinoC.startRoulette(player, {"Red", tokenNr, 2})
										vRPclient.notify(player, {"[CASINO] ~g~You've bet ~y~"..tokenNr.." Chips ~g~on ~r~Red"})
									elseif(v[4] == 2)then
										vRPCasinoC.startRoulette(player, {"Black", tokenNr, 2})
										vRPclient.notify(player, {"[CASINO] ~g~You've bet ~y~"..tokenNr.." Chips ~g~on ~c~Black"})
									elseif(v[4] == 0)then
										vRPCasinoC.startRoulette(player, {"Green", tokenNr, 5})
										vRPclient.notify(player, {"[CASINO] ~g~You've bet ~y~"..tokenNr.." Chips ~g~on ~b~Green"})
									end
									rouletteBetters[user_id] = true
								else
									vRPclient.notify(player, {"[CASINO] ~r~You don't have enough Chips!"})
								end
							else
								vRPclient.notify(player, {"[CASINO] ~r~You need to add a Chips number between 0 and 99!"})
							end
						else
							vRPclient.notify(player, {"[CASINO] ~r~You need to enter a number of Chips!"})
						end
					else
						vRPclient.notify(player, {"[CASINO] ~r~You need to enter a number of Chips!"})
					end
				end})
			end
		end
	end, v[2]}
end

casinoCasier_menu["Buy Chips"] = {function(player, choice)
	local user_id = vRP.getUserId({player})
	if(user_id ~= nil and user_id ~= "")then
		vRP.prompt({player, "Buy Chips:", "1 Chip = $100.000", function(player, tokenNr)
			if(tokenNr ~= "" and tokenNr ~= nil)then
				if(tonumber(tokenNr))then
					tokenNr = tonumber(tokenNr)
					if(tokenNr > 0) and (tokenNr <= 999)then
						local totalPrice = tokenNr * 100000
						if(vRP.tryPayment({user_id, totalPrice}))then
							vRPclient.notify(player, {"[CASINO] ~g~You paid ~r~$"..totalPrice.." ~g~for ~y~"..tokenNr.." Chips"})
							vRP.giveInventoryItem({user_id,"casino_token",tokenNr,false})
							vRP.closeMenu({player})
						else
							vRPclient.notify(player, {"[CASINO] ~r~You don't have enough money to buy ~y~"..tokenNr.." Chips"})
						end
					else
						vRPclient.notify(player, {"[CASINO] ~r~You need to add a Chips number between 0 and 99!"})
					end
				else
					vRPclient.notify(player, {"[CASINO] ~r~You need to enter a number of Chips!"})
				end
			else
				vRPclient.notify(player, {"[CASINO] ~r~You need to enter a number of Chips!"})
			end
		end})
	end
end, "<font color='green'>1 Chip </font>-> <font color='red'>$100.000</font>"}

--[[casinoCasier_menu["Sell Chips"] = {function(player, choice)
	local _source = source
	print("[esx_casino:spinSlotMachine] Taking Chips")
	local xPlayer = ESX.GetPlayerFromId(_source)
	local chips = xPlayer.getInventoryItem('casino_chip')
	print(chips)
	print(chips.count)
	amount = ESX.Math.Round(amount)
						if chips.count >= amount then

						if vRP.tryGetInventoryItem({user_id,"casino_token",tokenNr,false}) then
							local tokensValue = math.floor(tokenNr * (100000 - (100000 * 0.25)))
							vRP.giveMoney({user_id, tokensValue})
							vRPclient.notify(player, {"[CASINO] ~g~You sold ~y~"..tokenNr.." Chips ~g~for ~r~$"..tokensValue})
							vRP.closeMenu({player})
						else
							vRPclient.notify(player, {"[CASINO] ~r~Nu ai destule Chip-uri!"})
						end
					else
						vRPclient.notify(player, {"[CASINO] ~r~Trebuie sa introduci un numar de Chip-uri intre 0 si 99!"})
					end
				else
					vRPclient.notify(player, {"[CASINO] ~r~Trebuie sa introduci un numar de Chip-uri!"})
				end
			else
				vRPclient.notify(player, {"[CASINO] ~r~Trebuie sa introduci un numar de Chip-uri!"})
			end
		end})
	end
end, "<font color='green'>1 Chip</font> = <font color='red'>75%</font> off its value"}
--]]
function vRPcs.spawnTokenDealer(thePlayer)
	local casCasier_enter = function(player, area)
		local user_id = vRP.getUserId({player})
		if user_id ~= "" and user_id ~= nil then
			vRP.openMenu({player, casinoCasier_menu})
		end
	end

	local casCasier_leave = function(player, area)
		local user_id = vRP.getUserId({player})
		if user_id ~= "" and user_id ~= nil then
			vRP.closeMenu({player})
		end
	end

	--[[
	for i, v in pairs(tokenDealer) do
		if(i == 1)then
			vRPCasinoC.createCasinoText(thePlayer,{v[1], v[2], v[3]+0.7, "~b~Casino Cashier"})
			vRP.setArea({thePlayer,"vRP:cashier:"..i,v[1], v[2], v[3],1.7,1.5,casCasier_enter,casCasier_leave})
		else
			vRPCasinoC.createCasinoNPCs(thePlayer,{"A_M_Y_business_01",v[1], v[2], v[3], 179.9213104248, "Jimmy_Anderson"})
		end
	end
	]]--
end

function vRPcs.payRouletteWinnings(winnings, timesby)
	local thePlayer = source
	local user_id = vRP.getUserId({thePlayer})
	if user_id ~= "" and user_id ~= nil then
		local amountToPay = (winnings-1) * (timesby-1)
		vRP.giveInventoryItem({user_id,"casino_token",amountToPay,false})
		vRPclient.notify(thePlayer, {"[CASINO] ~g~Congratulations! You won ~y~"..amountToPay.." Chips"})
		rouletteBetters[user_id] = nil
	end
end

function vRPcs.didntWinRoulette()
	local thePlayer = source
	local user_id = vRP.getUserId({thePlayer})
	if user_id ~= "" and user_id ~= nil then
		rouletteBetters[user_id] = nil
	end
end

function vRPcs.spawnTheRoulettes(thePlayer)
	local xPlayer = ESX.GetPlayerFromId(thePlayer)

	local casRoulette_enter = function(player, area)
		local user_id = vRP.getUserId({player})
		if user_id ~= "" and user_id ~= nil then
			vRP.openMenu({player, casinoRoulette_menu})
		end
	end

	local casRoulette_leave = function(player, area)
		local user_id = vRP.getUserId({player})
		if user_id ~= "" and user_id ~= nil then
			vRP.closeMenu({player})
		end
	end
--[[
	for i, v in pairs(roulettes)do
		vRPCasinoC.createCasinoText(thePlayer,{v[1], v[2], v[3]+0.7, "~r~Roulette"})
		vRP.setArea({thePlayer,"vRP:casino:roulette:"..i,v[1], v[2], v[3],1,1.5,casRoulette_enter, casRoulette_leave})
	end
	]]--
end

function vRPcs.spawnTheBarbut(thePlayer)
	local casBarbut_enter = function(player, area)
		local user_id = vRP.getUserId({player})
		if user_id ~= "" and user_id ~= nil then
			vRP.openMenu({player, casinoBarbut_menu})
		end
	end

	local casBarbut1v1_enter = function(player, area)
		local user_id = vRP.getUserId({player})
		if user_id ~= "" and user_id ~= nil then
			vRP.openMenu({player, casinoBarbut1v1_menu})
		end
	end

	local casBarbut_leave = function(player, area)
		local user_id = vRP.getUserId({player})
		if user_id ~= "" and user_id ~= nil then
			vRP.closeMenu({player})
		end
	end
--[[
	for i, v in pairs(barbutDealer) do
		if(i == 1)then
			vRPCasinoC.createCasinoText(thePlayer,{v[1], v[2], v[3]+0.7, "~p~Throw Craps 1v1"})
			vRP.setArea({thePlayer,"vRP:casino:barbut:mk:2",v[1], v[2], v[3]+0.2,2.3,1.5,casBarbut1v1_enter,casBarbut_leave})
		elseif(i == 2)then
			vRPCasinoC.createCasinoText(thePlayer,{v[1], v[2], v[3]+0.7, "~p~Throw Craps 1v1"})
			vRP.setArea({thePlayer,"vRP:casino:barbut:mk:3",v[1], v[2], v[3]+0.2,2.3,1.5,casBarbut1v1_enter,casBarbut_leave})
		elseif(i == 3)then
			vRPCasinoC.createCasinoNPCs(thePlayer,{"S_M_M_MovPrem_01",v[1], v[2], v[3], 267.94094848633, "Billy_Dice"})
			vRP.setArea({thePlayer,"vRP:casino:barbut:npc:2",v[1], v[2], v[3],2.0, 1.5, casBarbut_enter, casBarbut_leave})
		elseif(i == 4)then
			vRPCasinoC.createCasinoNPCs(thePlayer,{"S_M_M_MovPrem_01",v[1], v[2], v[3], 267.94094848633, "Christian_Dice"})
			vRP.setArea({thePlayer,"vRP:casino:barbut:npc:3",v[1], v[2], v[3],2.0, 1.5, casBarbut_enter, casBarbut_leave})
		end
	end
	]]--
end

function vRPcs.spinSlotMachine(amount, a, b, c)
	local thePlayer = source
	local user_id = vRP.getUserId({thePlayer})
	if(slotMachinesBetters[user_id] == nil)then
		if vRP.tryGetInventoryItem({user_id,"casino_token",amount,false}) then
			slotMachinesBetters[user_id] = true
			vRPCasinoC.checkWinSlotmachine(thePlayer, {tonumber(amount),tostring(a),tostring(b),tostring(c)})
		else
			vRPclient.notify(thePlayer, {"[CASINO] ~r~You don't have enough Chips!"})
		end
	else
		vRPclient.notify(thePlayer, {"[CASINO] ~r~You're already playing Slots!"})
	end
end

function spinSlotMachine(amount, a, b, c)
	local thePlayer = source
	local xPlayer = ESX.GetPlayerFromId(thePlayer)
	local user_id = xPlayer.name
	--local user_id = vRP.getUserId({thePlayer})
	if(slotMachinesBetters[user_id] == nil)then
		slotMachinesBetters[user_id] = true
		--checkWinSlotmachine(thePlayer, {tonumber(amount),tostring(a),tostring(b),tostring(c)})
		if a == b and a == c then
			if a == 'cherry' then
				local reward = tonumber(amount*(price.line3.cherry))
				TriggerClientEvent('esx:showNotification', thePlayer, "[CASINO] ~g~You won ~b~"..reward.." Chips")
				xPlayer.addInventoryItem('casino_chip', reward)
				--vRPcasinoS.winSlotMachine({reward})
			elseif a == 'lemon' then
				local reward = tonumber(amount*(price.line3.lemon))
				TriggerClientEvent('esx:showNotification', thePlayer, "[CASINO] ~g~You won ~b~"..reward.." Chips")
				xPlayer.addInventoryItem('casino_chip', reward)
				--vRPcasinoS.winSlotMachine({reward})
			else
				local reward = tonumber(amount*(price.line3.other))
				TriggerClientEvent('esx:showNotification', thePlayer, "[CASINO] ~g~You won ~b~"..reward.." Chips")
				xPlayer.addInventoryItem('casino_chip', reward)
				--vRPcasinoS.winSlotMachine({reward})
			end
			-- Chat('AI CASTIGAT', a..' '..b..' '..c, 0, 255, 0)
		elseif a == b or b == c then
			if b =='cherry' then
				local reward = tonumber(amount*(price.line2.cherry))
				TriggerClientEvent('esx:showNotification', thePlayer, "[CASINO] ~g~You won ~b~"..reward.." Chips")
				xPlayer.addInventoryItem('casino_chip', reward)
				--vRPcasinoS.winSlotMachine({reward})
			else
				local reward = tonumber(amount*(price.line2.other))
				TriggerClientEvent('esx:showNotification', thePlayer, "[CASINO] ~g~You won ~b~"..reward.." Chips")
				xPlayer.addInventoryItem('casino_chip', reward)
				--vRPcasinoS.winSlotMachine({reward})
			end
			elseif a == c then
			if a =='cherry' then
				local reward = tonumber(amount*(price.line2.cherry))
				TriggerClientEvent('esx:showNotification', thePlayer, "[CASINO] ~g~You won ~b~"..reward.." Chips")
				xPlayer.addInventoryItem('casino_chip', reward)
				--vRPcasinoS.winSlotMachine({reward})
			else
				local reward = tonumber(amount*(price.line2.other))
				TriggerClientEvent('esx:showNotification', thePlayer, "[CASINO] ~g~You won ~b~"..reward.." Chips")
				xPlayer.addInventoryItem('casino_chip', reward)
				--vRPcasinoS.winSlotMachine({reward})
			end

		else
			--vRPcasinoS.lostSlotMachine({})
			--Chat('You Lost', a..' '..b..' '..c, 255, 0, 0)
		end
		--Chat('Result', a..' '..b..' '..c, 0, 255, 0)
		TriggerClientEvent('esx:showNotification', thePlayer, "[CASINO] ~g~" .. a .. " - " .. b .. " - " .. c .. "~b~")
		slotMachinesBetters[user_id] = nil
	else
		TriggerClientEvent('esx:showNotification', source, "[CASINO] ~r~You're already playing Slots!")
		-- vRPclient.notify(thePlayer, {"[CASINO] ~r~You're already playing Slots!"})
	end
end

function vRPcs.winSlotMachine(reward)
	local thePlayer = source
	local user_id = vRP.getUserId({thePlayer})
	if(reward > 0)then
		reward = reward-1
		vRP.giveInventoryItem({user_id,"casino_token",reward,false})
		slotMachinesBetters[user_id] = nil
		vRPclient.notify(thePlayer, {"[CASINO] ~g~You won ~b~"..reward.." Chips"})
	end
end

function vRPcs.lostSlotMachine()
	local thePlayer = source
	local user_id = vRP.getUserId({thePlayer})
	slotMachinesBetters[user_id] = nil
end

function vRPcs.doBarbut1v1(thePlayer)
	local user_id = vRP.getUserId({thePlayer})
	local opponentID = barbutPlayers[user_id].oponent
	if(opponentID ~= 0)then
		local theOpponent = vRP.getUserSource({opponentID})

		local opponentRoll = math.random(1, 6)
		local opponentRoll2 = math.random(1, 6)
		local playerRoll = math.random(1, 6)
		local playerRoll2 = math.random(1, 6)
		local totalOpponent = tonumber(opponentRoll + opponentRoll2)
		local totalPlayer = tonumber(playerRoll + playerRoll2)

		local winnings = barbutPlayers[user_id].cota
		SetTimeout(1000, function()
			vRPclient.notify(thePlayer, {"[CASINO] ~g~Your Hand: ~p~(~y~"..playerRoll.."~r~ , ~y~"..playerRoll2.."~p~) ~b~("..totalPlayer..")"})
			vRPclient.notify(theOpponent, {"[CASINO] ~g~Opponent's Hand: ~p~(~y~"..playerRoll.."~r~ , ~y~"..playerRoll2.."~p~) ~b~("..totalPlayer..")"})
			SetTimeout(1000, function()
				vRPclient.notify(thePlayer, {"[CASINO] ~g~Opponent's Hand: ~p~(~y~"..opponentRoll.."~r~ , ~y~"..opponentRoll2.."~p~) ~b~("..totalOpponent..")"})
				vRPclient.notify(theOpponent, {"[CASINO] ~g~Your Hand: ~p~(~y~"..opponentRoll.."~r~ , ~y~"..opponentRoll2.."~p~) ~b~("..totalOpponent..")"})
				if(totalOpponent < totalPlayer)then
					vRPclient.notify(theOpponent, {"[CASINO] ~r~You lost this hand!"})
					vRPclient.notify(thePlayer, {"[CASINO] ~g~You won this hand! You received ~y~"..(winnings*2).." Chips"})
					vRP.giveInventoryItem({user_id,"casino_token",winnings*2,false})
				elseif(totalPlayer < totalOpponent)then
					vRPclient.notify(thePlayer, {"[CASINO] ~r~You lost this hand!"})
					vRPclient.notify(theOpponent, {"[CASINO] ~g~You won this hand! You received ~y~"..(winnings*2).." Chips"})
					vRP.giveInventoryItem({opponentID,"casino_token",winnings*2,false})
				elseif((opponentRoll == playerRoll) and (opponentRoll2 == playerRoll2))then
					vRPclient.notify(theOpponent, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..winnings.." Chips"})
					vRPclient.notify(thePlayer, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..winnings.." Chips"})
					vRP.giveInventoryItem({user_id,"casino_token",winnings,false})
					vRP.giveInventoryItem({opponentID,"casino_token",winnings,false})
				elseif((opponentRoll == playerRoll2) and (opponentRoll2 == playerRoll))then
					vRPclient.notify(theOpponent, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..winnings.." Chips"})
					vRPclient.notify(thePlayer, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..winnings.." Chips"})
					vRP.giveInventoryItem({user_id,"casino_token",winnings,false})
					vRP.giveInventoryItem({opponentID,"casino_token",winnings,false})
				elseif (totalPlayer == totalOpponent)then
					vRPclient.notify(theOpponent, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..winnings.." Chips"})
					vRPclient.notify(thePlayer, {"[CASINO] ~g~This hand was a draw! You received back ~y~"..winnings.." Chips"})
					vRP.giveInventoryItem({user_id,"casino_token",winnings,false})
					vRP.giveInventoryItem({opponentID,"casino_token",winnings,false})
				end
			end)
		end)
		barbutPlayers[user_id] = {oponent = 0, cota = 0}
	end
end


function Barbut1v1(player1, player2, chips)
	print("[esx_casino:startBarbut] Barbut1v1")
	local xPlayer1 = ESX.GetPlayerFromId(player1)
	local user_id = xPlayer1.name
	local opponentID = "NPC"
	local xPlayer2
	if player2 ~= "NPC" then
		xPlayer2 = ESX.GetPlayerFromId(player2)
		opponentID = xPlayer2.name
	end

	if(opponentID ~= 0)then
		local opponentRoll = math.random(1, 6)
		local opponentRoll2 = math.random(1, 6)
		local playerRoll = math.random(1, 6)
		local playerRoll2 = math.random(1, 6)
		local totalOpponent = tonumber(opponentRoll + opponentRoll2)
		local totalPlayer = tonumber(playerRoll + playerRoll2)

		local winnings = chips
		SetTimeout(1000, function()
			TriggerClientEvent('esx:showNotification', player1, "[CASINO] ~g~Your Hand: ~p~(~y~"..playerRoll.."~r~ , ~y~"..playerRoll2.."~p~) ~b~("..totalPlayer..")")
			if player2 ~= "NPC" then
				TriggerClientEvent('esx:showNotification', player2, "[CASINO] ~g~Opponent's Hand: ~p~(~y~"..playerRoll.."~r~ , ~y~"..playerRoll2.."~p~) ~b~("..totalPlayer..")")
			end
			SetTimeout(1000, function()
				TriggerClientEvent('esx:showNotification', player1, "[CASINO] ~g~Opponent's Hand: ~p~(~y~"..opponentRoll.."~r~ , ~y~"..opponentRoll2.."~p~) ~b~("..totalOpponent..")")
				if player2 ~= "NPC" then
					TriggerClientEvent('esx:showNotification', player2, "[CASINO] ~g~Your Hand: ~p~(~y~"..opponentRoll.."~r~ , ~y~"..opponentRoll2.."~p~) ~b~("..totalOpponent..")")
				end
				if(totalOpponent < totalPlayer)then
					TriggerClientEvent('esx:showNotification', player1, "[CASINO] ~g~You won this hand! You received ~y~"..(winnings*2).." Chips")
					xPlayer1.addInventoryItem('casino_chip', winnings*2)
					if player2 ~= "NPC" then
						TriggerClientEvent('esx:showNotification', player2, "[CASINO] ~r~You lost this hand!")
					end
				elseif(totalPlayer < totalOpponent)then
					TriggerClientEvent('esx:showNotification', player1, "[CASINO] ~r~You lost this hand!")
					if player2 ~= "NPC" then
						TriggerClientEvent('esx:showNotification', player2, "[CASINO] ~g~You won this hand! You received ~y~"..(winnings*2).." Chips")
						xPlayer2.addInventoryItem('casino_chip', winnings*2)
					end
				elseif (totalPlayer == totalOpponent)then
					TriggerClientEvent('esx:showNotification', player1, "[CASINO] ~g~This hand was a draw! You received back ~y~"..winnings.." Chips")
					xPlayer1.addInventoryItem('casino_chip', winnings)
					if player2 ~= "NPC" then
						TriggerClientEvent('esx:showNotification', player2, "[CASINO] ~g~This hand was a draw! You received back ~y~"..winnings.." Chips")
						xPlayer2.addInventoryItem('casino_chip', winnings)
					end
				end
			end)
		end)
		--barbutPlayers[user_id] = {oponent = 0, cota = 0}
	end
end

AddEventHandler("vRP:playerLeave", function(user_id, source)
	rouletteBetters[user_id] = nil
	slotMachinesBetters[user_id] = nil
	barbutPlayers[user_id] = nil
end)

AddEventHandler("esx:playerLoaded", function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	SetTimeout(1500, function()
		--vRPcs.spawnTheRoulettes(source)
		--vRPcs.spawnTokenDealer(source)
		--vRPcs.spawnTheBarbut(source)
		local user_id = xPlayer.name
		rouletteBetters[user_id] = nil
		slotMachinesBetters[user_id] = nil
		barbutPlayers[user_id] = {oponent = 0, cota = 0}
		--vRPclient.setNamedBlip(source, {"vRP:casino:blip", 926.05487060546,43.760063171386,80.899948120118, 214, 2, "Casino"})
	end)
end)
