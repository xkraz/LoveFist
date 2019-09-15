ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("unrack", function(source)
local xPlayer = ESX.GetPlayerFromId(source)
if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' or xPlayer.job.name == 'warrant'then
    --TriggerClientEvent("chatMessage", -1, tostring(GetPlayerName(source) .. " ^1  Unracks Carbine Rifle From Their Cruiser!"))
	xPlayer.addWeapon('WEAPON_SPECIALCARBINE_MK2', 1000)
	end
end)

RegisterCommand("rack", function(source)
local xPlayer = ESX.GetPlayerFromId(source)
if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' or xPlayer.job.name == 'warrant' then
    --TriggerClientEvent("chatMessage", -1, tostring(GetPlayerName(source) .. " ^1  Racks Carbine Rifle Back Into Their Cruiser!"))
	xPlayer.removeWeapon('WEAPON_SPECIALCARBINE_MK2')
	end
end) 
