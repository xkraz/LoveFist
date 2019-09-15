ESX = nil

local give = false
local usedRope = false

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterCommand('carry', function(source, args)
    local _source = source
    TriggerClientEvent('carry:StartCarryC', _source)
end, false)

RegisterServerEvent('carry:LiftTargetS')
AddEventHandler('carry:LiftTargetS', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)
	TriggerClientEvent('carry:LiftTargetC', targetPlayer.source, source)
end)

