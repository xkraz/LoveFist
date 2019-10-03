ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('towreward')
AddEventHandler('towreward', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local ImpoundPrice = math.random(6, 15)
	
	if xPlayer.job.name == 'mechanic' or xPlayer.job.name == 'mechanic2' or xPlayer.job.name == 'marducas' then
        xPlayer.addMoney(ImpoundPrice)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You impounded a car for $' .. ImpoundPrice)
		else
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'You got no money because you are not a mechanic!!')
       end
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end



RegisterCommand('repo', function(source, args)
	TriggerClientEvent("asser:tow", source)
end, false)