ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('StartArresting')
AddEventHandler('StartArresting', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent('ArrestFindPlayer', targetPlayer.source, source)
	TriggerClientEvent('ArrestAnimation', source)
end)
 