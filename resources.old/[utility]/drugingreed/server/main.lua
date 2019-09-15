ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('buymethingredients')
AddEventHandler('buymethingredients', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local MethAmount = 1
	local MethPrice = 600
	
		if MethPrice < xPlayer.getMoney() then
        xPlayer.addInventoryItem('meth_ingredients', MethAmount)
		xPlayer.removeMoney(MethPrice)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained some Meth Ingredients')
	 end
end)

RegisterServerEvent('buycokeingredients')
AddEventHandler('buycokeingredients', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local CokeAmount = 1
	local CokePrice = 600
	
		if CokePrice < xPlayer.getMoney() then
        xPlayer.addInventoryItem('coke_ingredients', CokeAmount)
		xPlayer.removeMoney(CokePrice)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained some Coke Ingredients')
	 end
end)


function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end