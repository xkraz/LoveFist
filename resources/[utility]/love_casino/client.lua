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

local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local IsInUIMenu            = false
local IsInGame               = false



ESX                           = nil

Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	Citizen.Wait(10000)
end)

thePeds = {}
thePedNames = {}
markerTexts = {}
vRPcasinoC = {}
--Tunnel.bindInterface("vRP_casino",vRPcasinoC)
--Proxy.addInterface("vRP_casino",vRPcasinoC)
--vRP = Proxy.getInterface("vRP")
--vRPcasinoS = Tunnel.getInterface("vRP_casino","vRP_casino")

local rltNumbers = {"~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36","~g~0", "~c~1", "~r~2", "~c~3", "~r~4", "~c~5", "~r~6", "~c~7", "~r~8", "~c~9", "~r~10", "~c~11", "~r~12", "~c~13", "~r~14", "~c~15", "~r~16", "~c~17", "~r~18", "~c~19", "~r~20", "~c~21", "~r~22", "~c~23", "~r~24", "~c~25", "~r~26", "~c~27", "~r~28", "~c~29", "~r~30", "~c~31", "~r~32", "~c~33", "~r~34", "~c~35", "~r~36",}
local rltBetOn = ""
local rltTryingToBetOn = ""
local rltWinnings = 0
local rltTimesBy = 0
local rltNumber = ""
local theI = 1
local rltSpeed = 5


rouletteBetters = {}
slotMachinesBetters = {}
barbutPlayers = {}


-- Create Blips
--Citizen.CreateThread(function ()
	--local blip = AddBlipForCoord(926.05487060546,43.760063171386,80.899948120118)
	--SetBlipSprite (blip, 214)
	--SetBlipDisplay(blip, 2)
	--SetBlipScale  (blip, 1.0)
	--SetBlipAsShortRange(blip, true)
	--BeginTextCommandSetBlipName("STRING")
	--AddTextComponentString("Casino")
	--EndTextCommandSetBlipName(blip)
--end)


-- Display markers
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Zones) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
				rando()
			end
		end
	end
end)


-- Enter / Exit marker events
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)

		local coords      = GetEntityCoords(PlayerPedId())
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker  = true
				currentZone = k
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone                = currentZone
			TriggerEvent('esx_casino:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_casino:hasExitedMarker', LastZone)
		end
	end
end)

function rando()
math.randomseed(1,100000)
end

-- NPC's
Citizen.CreateThread(function ()
	print('esx_casino:NPC')
	print(source)
	vRPcasinoC.createCasinoNPCs("A_M_Y_business_01",964.53, 24.75037109375, 2.47, 291.9213104248, "Jimmy_Anderson")
	vRPcasinoC.createCasinoNPCs("S_M_M_MovPrem_01",957.39, 18.53037109375, 2.47, 275.9213104248, "Billy_Dice")
	vRPcasinoC.createCasinoNPCs("S_M_M_MovPrem_01",951.42, 25.52, 2.47, 275.9213104248, "Dewey_Cox")
	--vRPcasinoC.createCasinoNPCs("S_M_M_MovPrem_01",956.53, 23.75037109375, 2.27, 291.9213104248, "Christian_Dice")
end)


AddEventHandler('esx_casino:hasEnteredMarker', function (zone)
	print('[esx_casino:hasEnteredMarker]')
	print(zone)
	if zone == 'Roulettes' then
		CurrentAction     = 'roulettes_menu'
		CurrentActionMsg  = 'roulettes_menu'
		CurrentActionData = {}

	elseif zone == 'BarbutDealer' then
		CurrentAction     = 'barbut_dealer_actions_menu'
		CurrentActionMsg  = 'barbut_dealer_actions_menu'
		CurrentActionData = {}
	elseif zone == 'BarbutDealer2' then
		CurrentAction     = 'barbut_dealer_actions_menu'
		CurrentActionMsg  = 'barbut_dealer_actions_menu'
		CurrentActionData = {}
	elseif zone == 'BarbutDealer3' then
		CurrentAction     = 'barbut_dealer_actions_menu'
		CurrentActionMsg  = 'barbut_dealer_actions_menu'
		CurrentActionData = {}
	elseif zone == 'BarbutDealer4' then
		CurrentAction     = 'barbut_dealer_actions_menu'
		CurrentActionMsg  = 'barbut_dealer_actions_menu'
		CurrentActionData = {}
	elseif zone == 'BarbutDealer5' then
		CurrentAction     = 'barbut_dealer_actions_menu'
		CurrentActionMsg  = 'barbut_dealer_actions_menu'
		CurrentActionData = {}
	elseif zone == 'BarbutDealer6' then
		CurrentAction     = 'barbut_dealer_actions_menu'
		CurrentActionMsg  = 'barbut_dealer_actions_menu'
		CurrentActionData = {}
	end
end)


AddEventHandler('esx_casino:hasExitedMarker', function (zone)
	print('[esx_casino:hasExitedMarker]')
	print(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if CurrentAction == nil then
			Citizen.Wait(500)
		else
			ESX.ShowHelpNotification(CurrentActionMsg)
			if IsControlJustReleased(0, Keys['E']) then
				if CurrentAction == 'roulettes_menu' then
					OpenRoulettesMenu()
				elseif CurrentAction == 'barbut_dealer_actions_menu' then
					OpenBarbutMenu()
				end
			end
		end
	end
end)

function OpenShopMenu()
	IsInUIMenu = true
	--StartShopRestriction()
	ESX.UI.Menu.CloseAll()
	local playerPed = PlayerPedId()
	print("Opening Shop Menu")
end


function OpenRoulettesMenu()
	IsInUIMenu = true
	--StartShopRestriction()
	ESX.UI.Menu.CloseAll()
	local playerPed = PlayerPedId()
	print("Opening RoulettesMenu")
	local elements           = {}
	elements = {
		{label = 'Bet on <font color="green">Green</font> Win Chance: <font color="red">2.7%</font>Winnings: <font color="yellow">x35</font>',  value = 'Green', times_by = 35},
		{label = 'Bet on <font color="red">Red</font> Win Chance: <font color="green">48.65%</font>Winnings: <font color="yellow">x2</font>', value = 'Red', times_by = 2},
		{label = 'Bet on <font color="grey">Black</font> Win Chance: <font color="green">48.65%</font>Winnings: <font color="yellow">x2</font>', value = 'Black', times_by = 2}
	}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'roulettes_menu', {
		title    = 'RoulettesMenu',
		align    = 'top',
		elements = elements
	}, function (data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'chip_amount', {
			title    = 'NumChips',
			align    = 'bottom-right',
			elements = {
				{label = 'Chips',  item = "casino_chip", value = 1, type = 'slider', min = 1, max = 1000},
			}
		}, function(data2, menu2)
			if not IsInGame then
				print("trying to bet - " .. data2.current.value .. " chips on - " .. data.current.value)
				rltTryingToBetOn = data.current.value
				--rltBetOn = data.current.value
				rltWinnings = data2.current.value
				rltTimesBy = data.current.times_by
				TriggerServerEvent("esx_casino:takeChips", data2.current.value)
				--TriggerServerEvent("esx:removeInventoryItem", "item_standard", "casino_chip", data2.current.value)
				menu2.close()
			else
				ESX.ShowNotification("Already in a game.")
			end
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function (data, menu)
		print("Second function")
		menu.close()
	end)
end


RegisterNetEvent('esx_casino:startRoulette')
AddEventHandler('esx_casino:startRoulette', function(xPlayer)
	rando()
	--vRPcasinoC.startRoulette(data.current.value, data2.current.value, data.current.times_by)
	vRPcasinoC.startRoulette()
	ESX.ShowNotification("betting - " .. rltWinnings .. " chips on - " .. rltBetOn)
end)



-- Barbar
function OpenBarbutMenu()
	IsInUIMenu = true
	--StartShopRestriction()
	ESX.UI.Menu.CloseAll()
	local playerPed = PlayerPedId()
	print("Opening BarbutMenu")
	local elements           = {}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'barbut_menu', {
		title    = 'NumChips',
			align    = 'bottom-right',
			elements = {
				{label = 'Chips',  item = "casino_chip", value = 1, type = 'slider', min = 1, max = 1000},
			}
	}, function (data, menu)
		print("trying to bet - " .. data.current.value .. " chips")
		ESX.ShowNotification("trying to bet - " .. data.current.value .. " chips")
		TriggerServerEvent("esx_casino:startBarbut", data.current.value)
		menu.close()
	end, function (data, menu)
		print("Second function")
		menu.close()
	end)
end


RegisterNetEvent('esx_casino:startBarbut')
AddEventHandler('esx_casino:startBarbut', function(xPlayer)
	--vRPcasinoC.startRoulette(data.current.value, data2.current.value, data.current.times_by)
	-- vRPcasinoC.startRoulette()
	ESX.ShowNotification("betting - Barbut ")
end)

RegisterNetEvent('esx_casino:spinSlotMachine')
AddEventHandler('esx_casino:spinSlotMachine', function(rand1, rand2, rand3)
	--vRPcasinoC.startRoulette(data.current.value, data2.current.value, data.current.times_by)
	-- vRPcasinoC.startRoulette()
	print("in esx_casino:spinSlotMachine")
	-- \xF0\x9F\x8D\x8B
	-- text_drawTxt("[SLOTS] " .. rand1 .. " - " .. rand2 .. " - " .. rand3,1,1,0.5,0.8,1.0,255,255,255,255)
	-- text_drawTxt("[SLOTS] &#x1F34B" ,1,1,0.5,0.8,1.0,255,255,255,255)
	ESX.ShowNotification("betting - slots ")
end)


-- Casino Functions
function text_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end


function vRPcasinoC.startRoulette()
	rando()
	theI = math.random(#rltNumbers)
	rltBetOn = rltTryingToBetOn
	IsInGame = true

	SetEntityHeading(GetPlayerPed(-1), 179.63815307617)
	FreezeEntityPosition(GetPlayerPed(-1), true)
	coords = GetEntityCoords(GetPlayerPed(-1))
	TaskStartScenarioAtPosition(GetPlayerPed(-1), "WORLD_HUMAN_STAND_FIRE", coords.x, coords.y, coords.z-0.3, GetEntityHeading(GetPlayerPed(-1)), 0, 0, false)
end


function vRPcasinoC.createCasinoNPCs(model, x, y, z, rot, name)
	thePedNames[name] = {x = x, y = y, z = z}
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Wait(0)
	end
	thePeds[name] = CreatePed(26,GetHashKey(model),x,y,z,rot,false,false)
	FreezeEntityPosition(thePeds[name], true)
	SetEntityCollision(thePeds[name], false)
	SetEntityDynamic(thePeds[name], false)
	SetEntityInvincible(thePeds[name], true)
	SetBlockingOfNonTemporaryEvents(thePeds[name], true)
end


function vRPcasinoC.createCasinoText(x, y, z, name)
	markerTexts[#markerTexts+1] = {name = name, x = x, y = y, z = z}
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(rltSpeed)
		if(rltBetOn ~= "")then
			if(theI == #rltNumbers)then
				theI = 1
			else
				theI = theI + 1
			end
			rltNumber = rltNumbers[theI]
		end
	end
end)

function DrawText3D(x,y,z, text, scl) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i, v in pairs(thePedNames) do
			if GetDistanceBetweenCoords(v.x,v.y,v.z,coords.x,coords.y,coords.z,true) <= 20.0 then
				DrawText3D(v.x,v.y,v.z+1.95, i, 0.8)
			end
		end
		
		for i, v in pairs(markerTexts) do
			if GetDistanceBetweenCoords(v.x,v.y,v.z,coords.x,coords.y,coords.z,true) <= 20.0 then
				DrawText3D(v.x,v.y,v.z, v.name, 0.8)
			end
		end
		
		if(rltBetOn ~= "")then
			text_drawTxt("[ROULETTE] ~y~Number: "..rltNumber,1,1,0.5,0.8,1.0,255,255,255,255)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300)
		if(rltBetOn ~= "") then
			if(rltSpeed < 1600)then
				if(rltSpeed > 500)then
					rltSpeed  = rltSpeed + 30
				elseif(rltSpeed < 500)then
					rltSpeed  = rltSpeed + 10
				elseif(rltSpeed > 500 and rltSpeed < 1000)then
					rltSpeed  = rltSpeed + 100
				end
			else
				print(rltNumber)
				ESX.ShowNotification("Landed On: " .. rltNumber)
				if(rltBetOn == "Black")then
					if(string.match(rltNumber, "c"))then
						ESX.ShowNotification("You Won! : " .. rltWinnings * rltTimesBy .. " chips.")
						TriggerServerEvent("esx_casino:giveChips", rltWinnings * rltTimesBy)
						--vRPcasinoS.payRouletteWinnings({rltWinnings, rltTimesBy})
					else
						ESX.ShowNotification("You Lost")
						--vRP.notify({"[CASINO] ~r~You didn't win this time!"})
						--vRPcasinoS.didntWinRoulette({})
					end
				elseif(rltBetOn == "Red")then
					if(string.match(rltNumber, "r"))then
						ESX.ShowNotification("You Won! : " .. rltWinnings * rltTimesBy .. " chips.")
						TriggerServerEvent("esx_casino:giveChips", rltWinnings * rltTimesBy)
					else
						ESX.ShowNotification("You Lost")
						--vRP.notify({"[CASINO] ~r~You didn't win this time!"})
						--vRPcasinoS.didntWinRoulette({})
					end
				elseif(rltBetOn == "Green")then
					if(string.match(rltNumber, "g"))then
						ESX.ShowNotification("You Won! : " .. rltWinnings * rltTimesBy .. " chips.")
						TriggerServerEvent("esx_casino:giveChips", rltWinnings * rltTimesBy)
					else
						ESX.ShowNotification("You Lost")
						--vRP.notify({"[CASINO] ~r~You didn't win this time!"})
						--vRPcasinoS.didntWinRoulette({})
					end
				end

				ClearPedTasks(GetPlayerPed(-1))
				FreezeEntityPosition(GetPlayerPed(-1), false)
				rltSpeed = 5
				rltBetOn = ""
				rltNumber = ""
				theI = 1
				rltWinnings = 0
				rltTimesBy = 0
				IsInGame = false
			end
		end
	end
end)

local EmojiList = {
	'🍎',
	'🍋',
	'🍉',
	'🍊',
	'🍒',
	'🍇',
	'🍑',
	'🍓'
}

local EmojiList2 = {
	'lemon',
	'apple',
	'melon',
	'grapefruit',
	'cherry',
	'grape',
	'peach',
	'strawberry'
}
-- KEK TOP KEK --
local price = {}
price.line3 = {
	cherry = 6,
	lemon = 5,
	other = 4
}
price.line2 = {
	cherry = 3,
	other = 3
}


-- Thank you ideo for GUI
Menu = {}
Menu.GUI = {}
Menu.TitleGUI = {}
Menu.buttonCount = 0
Menu.titleCount = 0
Menu.selection = 0
Menu.hidden = true
MenuTitle = "Menu"

-------------------
posXMenu = 0.1
posYMenu = 0.05
width = 0.1
height = 0.05

posXMenuTitle = 0.1
posYMenuTitle = 0.05
widthMenuTitle = 0.1
heightMenuTitle = 0.05
-------------------
function Menu.addTitle(name)
  local yoffset = 0.3
  local xoffset = 0
  local xmin = posXMenuTitle
  local ymin = posYMenuTitle
  local xmax = widthMenuTitle
  local ymax = heightMenuTitle
  Menu.TitleGUI[Menu.titleCount +1] = {}
  Menu.TitleGUI[Menu.titleCount +1]["name"] = name
  Menu.TitleGUI[Menu.titleCount+1]["xmin"] = xmin + xoffset
  Menu.TitleGUI[Menu.titleCount+1]["ymin"] = ymin * (Menu.titleCount + 0.01) +yoffset
  Menu.TitleGUI[Menu.titleCount+1]["xmax"] = xmax
  Menu.TitleGUI[Menu.titleCount+1]["ymax"] = ymax
  Menu.titleCount = Menu.titleCount+1
end
function Menu.addButton(name, func,args)
  local yoffset = 0.3
  local xoffset = 0
  local xmin = posXMenu
  local ymin = posYMenu
  local xmax = width
  local ymax = height
  Menu.GUI[Menu.buttonCount +1] = {}
  Menu.GUI[Menu.buttonCount +1]["name"] = name
  Menu.GUI[Menu.buttonCount+1]["func"] = func
  Menu.GUI[Menu.buttonCount+1]["args"] = args
  Menu.GUI[Menu.buttonCount+1]["active"] = false
  Menu.GUI[Menu.buttonCount+1]["xmin"] = xmin + xoffset
  Menu.GUI[Menu.buttonCount+1]["ymin"] = ymin * (Menu.buttonCount + 0.01) +yoffset
  Menu.GUI[Menu.buttonCount+1]["xmax"] = xmax
  Menu.GUI[Menu.buttonCount+1]["ymax"] = ymax
  Menu.buttonCount = Menu.buttonCount+1
end
local input = {["E"] = 38,["DOWN"] = 173,["TOP"] = 27,["NENTER"] =  201}
function Menu.updateSelection()
  if IsControlJustPressed(1, input["DOWN"])  then
    if(Menu.selection < Menu.buttonCount -1  )then
      Menu.selection = Menu.selection +1
    else
      Menu.selection = 0
    end
  elseif IsControlJustPressed(1, input["TOP"]) then
    if(Menu.selection > 0)then
      Menu.selection = Menu.selection -1
    else
      Menu.selection = Menu.buttonCount-1
    end
  elseif IsControlJustPressed(1, input["NENTER"])  then
      MenuCallFunction(Menu.GUI[Menu.selection +1]["func"], Menu.GUI[Menu.selection +1]["args"])
  end
  local iterator = 0
  for id, settings in ipairs(Menu.GUI) do
    Menu.GUI[id]["active"] = false
    if(iterator == Menu.selection ) then
      Menu.GUI[iterator +1]["active"] = true
    end
    iterator = iterator +1
  end
end
function Menu.renderGUI()
  if not Menu.hidden then
    Menu.renderTitle()
    Menu.renderButtons()
    Menu.updateSelection()
  end
end
function Menu.renderBox(xMin,xMax,yMin,yMax,color1,color2,color3,color4)
  DrawRect(xMin, yMin,xMax, yMax, color1, color2, color3, color4);
end
function drawText(x,y ,width,height,scale, text, r,g,b,a,n)
    SetTextFont(n)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0,0,0,0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.0125)
end
function Menu.renderTitle()
  local yoffset = 0.3
  local xoffset = 0
  local xmin = posXMenuTitle
  local ymin = posYMenuTitle
  local xmax = widthMenuTitle
  local ymax = heightMenuTitle
  for id, settings in pairs(Menu.TitleGUI) do
    local screen_w = 0
    local screen_h = 0
    screen_w, screen_h =  GetScreenResolution(0, 0)
    boxColor = {20,30,10,255}
    SetTextFont(7)
    SetTextScale(0.0,0.5)
    SetTextColour(255, 255, 255, 255)
    SetTextCentre(true)
    SetTextDropShadow(0, 0, 0, 0, 0)
    SetTextEdge(0, 0, 0, 0, 0)
    SetTextEntry("STRING")
    AddTextComponentString('~y~'..string.upper(settings["name"]))
    DrawText(settings["xmin"], (settings["ymin"] - heightMenuTitle - 0.0125))
    Menu.renderBox(settings["xmin"] ,settings["xmax"], settings["ymin"] - heightMenuTitle, settings["ymax"],boxColor[1],boxColor[2],boxColor[3],boxColor[4])
  end
end
function Menu.renderButtons()
  for id, settings in pairs(Menu.GUI) do
    local screen_w = 0
    local screen_h = 0
    screen_w, screen_h =  GetScreenResolution(0, 0)
    boxColor = {42,63,17,255}
    if(settings["active"]) then
      boxColor = {107,158,44,255}
    end
    SetTextFont(0)
    SetTextScale(0.0,0.4)
    SetTextColour(255, 255, 255, 255)
    SetTextCentre(true)
    SetTextDropShadow(0, 0, 0, 0, 0)
    SetTextEdge(0, 0, 0, 0, 0)
    SetTextEntry("STRING")
    AddTextComponentString(settings["name"])
    DrawText(settings["xmin"], (settings["ymin"] - 0.0125 ))
    Menu.renderBox(settings["xmin"] ,settings["xmax"], settings["ymin"], settings["ymax"],boxColor[1],boxColor[2],boxColor[3],boxColor[4])
   end
end
--------------------------------------------------------------------------------------------------------------------
function ClearMenu()
  Menu.GUI = {}
  Menu.buttonCount = 0
  Menu.titleCount = 0
  Menu.selection = 0
end

function MenuCallFunction(fnc, arg)
  _G[fnc](arg)
end
--------------------------------------------------------------------------------------------------------------------
-- _Darkz
local money = 1
function SlotMenu()
  ClearMenu()
  Menu.addTitle("Slots")
  Menu.addButton("~h~SlotMachine","Spin",nil)
  --Menu.addButton("+","Plus",nil)
  --Menu.addButton("-","Minus",nil)
end

function Spin()
	print("spinning slot")
	rand1 = EmojiList2[math.random(#EmojiList2)]
	rand2 = EmojiList2[math.random(#EmojiList2)]
	rand3 = EmojiList2[math.random(#EmojiList2)]
	--print(rand1)
	--print(rand2)
	--print(rand2)

	--vRPcasinoS.spinSlotMachine({money,rand1,rand2,rand3})
	TriggerServerEvent("esx_casino:spinSlotMachine", 1, rand1, rand2, rand3)
end

function Chat(title,text,r,g,b)
	TriggerEvent("chatMessage", title, {r,g,b}, text)
end

function Plus(a)
	money = money + 1
	return money
end

function Minus(a)
	if money > 1 then
		money = money - 1
		return money
	end
	return money
end

function vRPcasinoC.checkWinSlotmachine(MoneyRecive,a,b,c)
	SlotMenu()
	Menu.hidden = not Menu.hidden
	if a == b and a == c then
		if a == '??' then
			reward = tonumber(MoneyRecive*(price.line3.cherry-1))
			vRPcasinoS.winSlotMachine({reward})
		elseif a == '??' then
			reward = tonumber(MoneyRecive*(price.line3.lemo-1))
			vRPcasinoS.winSlotMachine({reward})
		else
			reward = tonumber(MoneyRecive*(price.line3.other-1))
			vRPcasinoS.winSlotMachine({reward})
		end
		Chat('AI CASTIGAT', a..' '..b..' '..c, 0, 255, 0)
	elseif a == b or b == c then
		if b =='??' then
			reward = tonumber(MoneyRecive*(price.line2.cherry-1))
			vRPcasinoS.winSlotMachine({reward})
		else
			reward = tonumber(MoneyRecive*(price.line2.other-1))
			vRPcasinoS.winSlotMachine({reward})
		end
		Chat('You Won', a..' '..b..' '..c, 0, 255, 0)
	else
		vRPcasinoS.lostSlotMachine({})
		Chat('You Lost', a..' '..b..' '..c, 255, 0, 0)
	end
end

local moneymachine_slot = {
	{ ['x'] = 960.82733154296, ['y'] = 34.44130859375, ['z'] = 3.392375946044 },
	{ ['x'] = 960.82733154296, ['y'] = 33.09130859375, ['z'] = 3.392375946044 },
	{ ['x'] = 960.82733154296, ['y'] = 42.90130859375, ['z'] = 3.392375946044 },
	{ ['x'] = 960.82733154296, ['y'] = 33.09130859375, ['z'] = 3.392375946044 },


}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(moneymachine_slot) do
			if(GetDistanceBetweenCoords(v.x, v.y, v.z, pos.x, pos.y, pos.z, true) < 20.0)then
				DrawText3D(v.x, v.y, v.z, "~g~Slot Machine", 1)
				DrawMarker(29, v.x, v.y, v.z-0.5, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 25, 165, 165, 0, 0, 0, true)
				if(GetDistanceBetweenCoords(v.x, v.y, v.z, pos.x, pos.y, pos.z, true) < 1.0)then
					if(Menu.hidden == true)then
						text_drawTxt("[SLOTS] ~g~Press ~r~'E' ~g~to play",4,1,0.5,0.8,0.7,255,255,255,255)
					end
					if IsControlJustPressed(1,input["E"]) then
						SlotMenu()
						Menu.hidden = not Menu.hidden
					end
					if not Menu.hidden then
						DrawRect(0.1, 0.45, 0.1, 0.05, 0,0,0,255)
						drawText(0.55, 0.42+0.5, 1.0,1.0,0.6,'~w~'..tostring(money).."~g~Chips",255,0,0,255,7)
					end
					Menu.renderGUI()
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

