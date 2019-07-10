ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('buykeys')
AddEventHandler('buykeys', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local KeyAmount = 1
	local org1 = xPlayer.getInventoryItem('org1key').count
	local org2 = xPlayer.getInventoryItem('org2key').count
	local org3 = xPlayer.getInventoryItem('org3key').count
	local warrant = xPlayer.getInventoryItem('warrantkey').count
	local unicorn = xPlayer.getInventoryItem('unicornkey').count
	local police = xPlayer.getInventoryItem('policekey').count
	local mechanic = xPlayer.getInventoryItem('mechanickey').count
	local marducas = xPlayer.getInventoryItem('marducaskey').count
	local journaliste = xPlayer.getInventoryItem('journalistekey').count
	local fruitgang = xPlayer.getInventoryItem('fruitgangkey').count
	local fib = xPlayer.getInventoryItem('fibkey').count
	local courthouse = xPlayer.getInventoryItem('courthousekey').count
	local casino = xPlayer.getInventoryItem('casinokey').count
	local ambulance = xPlayer.getInventoryItem('ambulancekey').count
	
    if xPlayer.job.name == 'org1' and org1 == 0 then
        xPlayer.addInventoryItem('org1key', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
    else if xPlayer.job.name == 'org2' and org2 == 0 then
        xPlayer.addInventoryItem('org2key', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'org3' and org3 == 0 then
        xPlayer.addInventoryItem('org3key', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'warrant' and warrant == 0 then
        xPlayer.addInventoryItem('warrantkey', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'unicorn' and unicorn == 0 then
        xPlayer.addInventoryItem('unicornkey', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'police' and police == 0 then
        xPlayer.addInventoryItem('policekey', KeyAmount)
		xPlayer.addInventoryItem('courthousekey', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'mechanic' and mechanic == 0 then
        xPlayer.addInventoryItem('mechanickey', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'marducas' and marducas == 0 then
        xPlayer.addInventoryItem('marducaskey', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'journaliste' and journaliste == 0 then
        xPlayer.addInventoryItem('journalistekey', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'fruitgang' and fruitgang == 0 then
        xPlayer.addInventoryItem('fruitgangkey', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'fib' and fib == 0 then
        xPlayer.addInventoryItem('fibkey', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'courthouse' and courthouse == 0 then
        xPlayer.addInventoryItem('courthousekey', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'casino' and casino == 0 then
        xPlayer.addInventoryItem('casinokey', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	else if xPlayer.job.name == 'ambulance' and ambulance == 0 then
        xPlayer.addInventoryItem('ambulancekey', KeyAmount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained your organization key.')
	 end
	 end
	 end
	 end
	 end
	 end
	 end
	 end
	 end
	 end
	 end
	 end
	 end
	 end
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end