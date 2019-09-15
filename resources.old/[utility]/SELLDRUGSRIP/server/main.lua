ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx-qalle-hunting:reward')
AddEventHandler('esx-qalle-hunting:reward', function(Weight)
    local xPlayer = ESX.GetPlayerFromId(source)

    if Weight >= 1 then
        xPlayer.addInventoryItem('meat', 1)
    elseif Weight >= 9 then
        xPlayer.addInventoryItem('meat', 2)
    elseif Weight >= 15 then
        xPlayer.addInventoryItem('meat', 3)
    end

    xPlayer.addInventoryItem('leather', math.random(1, 4))
        
end)

RegisterServerEvent('esx-qalle-hunting:sell')
AddEventHandler('esx-qalle-hunting:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

	local weedprice = 5
	local weedpoochprice = 16
	local opiumpoochprice = 85
	local cokeprice = 5
	local cokepoochprice = 85
	local methpoochprice = 85
	local methingredientsprice = 600
	local cokeingredientsprice = 600
	local drugfillerprice = 200

    local WeedQuantity = xPlayer.getInventoryItem('weed').count
	local WeedPoochQuantity = xPlayer.getInventoryItem('weed_pooch').count
	local OpiumPoochQuantity = xPlayer.getInventoryItem('opium_pooch').count
	local CokeQuantity = xPlayer.getInventoryItem('coke').count
	local CokePoochQuantity = xPlayer.getInventoryItem('coke_pooch').count
	local MethPoochQuantity = xPlayer.getInventoryItem('meth_pooch').count
	local MethIngredientsQuantity = xPlayer.getInventoryItem('meth_ingredients').count
	local CokeIngredientsQuantity = xPlayer.getInventoryItem('coke_ingredients').count
	local DrugFillerQuantity = xPlayer.getInventoryItem('drug_filler').count
	

    if WeedQuantity > 0 then
        xPlayer.addMoney(WeedQuantity * weedprice)

        xPlayer.removeInventoryItem('weed', WeedQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. WeedQuantity .. ' for $' .. weedprice * WeedQuantity)
	
	end
	if WeedPoochQuantity > 0 then
		xPlayer.addMoney(WeedPoochQuantity * weedpoochprice)

        xPlayer.removeInventoryItem('weed_pooch', WeedPoochQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. WeedPoochQuantity .. ' for $' .. weedpoochprice * WeedPoochQuantity)
	
	end

	if OpiumPoochQuantity > 0 then
	xPlayer.addMoney(OpiumPoochQuantity * opiumpoochprice)

        xPlayer.removeInventoryItem('opium_pooch', OpiumPoochQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. OpiumPoochQuantity .. ' for $' .. opiumpoochprice * OpiumPoochQuantity)
	
	end
	if CokeQuantity > 0 then
		xPlayer.addMoney(CokeQuantity * cokeprice)

        xPlayer.removeInventoryItem('coke', CokeQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. CokeQuantity .. ' for $' .. cokeprice * CokeQuantity)
	
	end
	if CokePoochQuantity > 0 then
		xPlayer.addMoney(CokePoochQuantity * cokepoochprice)

        xPlayer.removeInventoryItem('coke_pooch', CokePoochQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. CokePoochQuantity .. ' for $' .. cokepoochprice * CokePoochQuantity)
	
	end
	if MethPoochQuantity > 0 then
		xPlayer.addMoney(MethPoochQuantity * methpoochprice)

        xPlayer.removeInventoryItem('meth_pooch', MethPoochQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. MethPoochQuantity .. ' for $' .. methpoochprice * MethPoochQuantity)
	
	end
	if MethIngredientsQuantity > 0 then
		xPlayer.addMoney(MethIngredientsQuantity * methingredientsprice)

        xPlayer.removeInventoryItem('meth_ingredients', MethIngredientsQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. MethIngredientsQuantity .. ' for $' .. methingredientsprice * MethIngredientsQuantity)
	
	end
	if CokeIngredientsQuantity > 0 then
		xPlayer.addMoney(CokeIngredientsQuantity * cokeingredientsprice)

        xPlayer.removeInventoryItem('coke_ingredients', CokeIngredientsQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. CokeIngredientsQuantity .. ' for $' .. cokeingredientsprice * CokeIngredientsQuantity)
	
	end
	if DrugFillerQuantity > 0 then
		xPlayer.addMoney(DrugFillerQuantity * drugfillerprice)

        xPlayer.removeInventoryItem('drug_filler', DrugFillerQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You sold ' .. DrugFillerQuantity .. ' for $' .. drugfillerprice * DrugFillerQuantity)
   
    end   
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end