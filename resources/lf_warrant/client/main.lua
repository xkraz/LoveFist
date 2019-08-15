local guiEnabled = false
local myIdentity = {}
local myIdentifiers = {}
local hasIdentity = false
local isDead = false

ESX = nil
local PlayerData              = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
        PlayerData = ESX.GetPlayerData()
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
function EnableGui(state)
	SetNuiFocus(state, state)
	guiEnabled = state

	SendNUIMessage({
		type = "enableui",
		enable = state
	})
end
RegisterNetEvent('lf_warrantstart')
AddEventHandler('lf_warrantstart', function()
local closestPlayer, distance = ESX.Game.GetClosestPlayer()
local id = GetPlayerServerId(closestPlayer)
		xPlayer = ESX.GetPlayerData()
	if xPlayer.job.name == 'courthouse' then
			EnableGui(true)
		else 
			ESX.ShowNotification('Your not allowed to do that!')
	end
end)
RegisterNetEvent('lf_warrantstop')
AddEventHandler('lf_warrantstop', function(args)
local closestPlayer, distance = ESX.Game.GetClosestPlayer()
local id = GetPlayerServerId(closestPlayer)
		xPlayer = ESX.GetPlayerData()
	if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' or xPlayer.job.name == 'courthouse' then
		if args ~= nil then
			TriggerServerEvent('lf_removewarrant',args)
			ESX.ShowNotification('You have deleted the Warrant sucessfully')
			end
		else 
			ESX.ShowNotification('Your not allowed to do that!')
	end
end)


RegisterNUICallback('escape', function(data, cb)
	if hasIdentity then
		EnableGui(false)
	else
		EnableGui(false)
	end
end)

RegisterNUICallback('register', function(data, cb)
	local reason = ""
	myIdentity = data
	if reason == "" then
		TriggerServerEvent('lf_addwarrant', data, myIdentifiers)
		EnableGui(false)
		Citizen.Wait(500)
	else
		ESX.ShowNotification(reason)
	end
end)

Citizen.CreateThread(function()
	while true do
		if guiEnabled then
			DisableControlAction(0, 1,   true) -- LookLeftRight
			DisableControlAction(0, 2,   true) -- LookUpDown
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 30,  true) -- MoveLeftRight
			DisableControlAction(0, 31,  true) -- MoveUpDown
			DisableControlAction(0, 21,  true) -- disable sprint
			DisableControlAction(0, 24,  true) -- disable attack
			DisableControlAction(0, 25,  true) -- disable aim
			DisableControlAction(0, 47,  true) -- disable weapon
			DisableControlAction(0, 58,  true) -- disable weapon
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 75,  true) -- disable exit vehicle
			DisableControlAction(27, 75, true) -- disable exit vehicle
		end
		Citizen.Wait(10)
	end
end)


function openbolo()
  TriggerEvent('esx_identity:showRegisterIdentity')
end