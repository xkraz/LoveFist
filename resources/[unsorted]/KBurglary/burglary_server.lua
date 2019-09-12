ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('99kr-burglary:Add')
AddEventHandler('99kr-burglary:Add', function(item, qtty)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.addInventoryItem(item, qtty)
end)

RegisterServerEvent('99kr-burglary:Remove')
AddEventHandler('99kr-burglary:Remove', function(item, qtty)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.removeInventoryItem(item, qtty)
end)

ESX.RegisterUsableItem('lockpick', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('99kr-burglary:Lockpick', _source)
	TriggerClientEvent('99kr-burglary:onUse', _source)
end)

RegisterNetEvent('99kr-burglary:removeKit')
AddEventHandler('99kr-burglary:removeKit', function()
	local _source = source 
	local xPlayer = ESX.GetPlayerFromId(_source)
		xPlayer.removeInventoryItem('lockpick', 1)

end)

---- CUSTOM ---- 

            ---------- Pawn Shop --------------
RegisterServerEvent('99kr-burglary:sellring')
AddEventHandler('99kr-burglary:sellring', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local ring = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "ring" then
			ring = item.count
		end
	end
				
		if ring > 0 then
			xPlayer.removeInventoryItem('ring', 1)
			xPlayer.addMoney(20)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$20 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a ring to sell!")
		end
end)
			
RegisterServerEvent('99kr-burglary:sellrolex')
AddEventHandler('99kr-burglary:sellrolex', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local rolex = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "rolex" then
			rolex = item.count
		end
	end
				
		if rolex > 0 then
			xPlayer.removeInventoryItem('rolex', 1)
			xPlayer.addMoney(100)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$100 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a rolex to sell!")
		end
end)
			
RegisterServerEvent('99kr-burglary:sellcamera')
AddEventHandler('99kr-burglary:sellcamera', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local camera = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "camera" then
			camera = item.count
		end
	end
				
	    if camera > 0 then
		  xPlayer.removeInventoryItem('camera', 1)
			xPlayer.addMoney(45)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$45 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a camera to sell!")
	    end
end)
			
RegisterServerEvent('99kr-burglary:sellgoldNecklace')
AddEventHandler('99kr-burglary:sellgoldNecklace', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local goldNecklace = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "goldNecklace" then
			goldNecklace = item.count
		end
	end
				
		if goldNecklace > 0 then
			xPlayer.removeInventoryItem('goldNecklace', 1)
			xPlayer.addMoney(35)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$35 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a goldNecklace to sell!")
		end
end)
			
RegisterServerEvent('99kr-burglary:selllaptop')
AddEventHandler('99kr-burglary:selllaptop', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local laptop = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "laptop" then
			laptop = item.count
		end
	end
				
		if laptop > 0 then
			xPlayer.removeInventoryItem('laptop', 1)
			xPlayer.addMoney(55)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$55 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a laptop to sell!")
		end
end)
			
			
RegisterServerEvent('99kr-burglary:sellsamsungS10')
AddEventHandler('99kr-burglary:sellsamsungS10', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local samsungS10 = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "samsungS10" then
			samsungS10 = item.count
		end
	end
				
		if samsungS10 > 0 then
			xPlayer.removeInventoryItem('samsungS10', 1)
			xPlayer.addMoney(25)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$25 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a samsungS10 to sell!")
		end
end)

RegisterServerEvent('99kr-burglary:sellruby')
AddEventHandler('99kr-burglary:sellruby', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local ruby = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "ruby" then
			ruby = item.count
		end
	end
				
		if ruby > 0 then
			xPlayer.removeInventoryItem('ruby', 1)
			xPlayer.addMoney(65)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$65 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a Ruby to sell!")
		end
end)

RegisterServerEvent('99kr-burglary:sellsapphire')
AddEventHandler('99kr-burglary:sellsapphire', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sapphire = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "sapphire" then
			sapphire = item.count
		end
	end
				
		if sapphire > 0 then
			xPlayer.removeInventoryItem('sapphire', 1)
			xPlayer.addMoney(75)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$75 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a samsungS10 to sell!")
		end
end)

RegisterServerEvent('99kr-burglary:sellemerald')
AddEventHandler('99kr-burglary:sellemerald', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local emerald = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "emerald" then
			emerald = item.count
		end
	end
				
		if emerald > 0 then
			xPlayer.removeInventoryItem('emerald', 1)
			xPlayer.addMoney(85)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "$85 added")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a samsungS10 to sell!")
		end
end)

RegisterServerEvent('KFlowerShop:buyweedseed')
AddEventHandler('KFlowerShop:buyweedseed', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local WeedAmount = 1
	local WeedPrice = 150
	
		if WeedPrice < xPlayer.getMoney() then
        xPlayer.addInventoryItem('weed_seed', WeedAmount)
		xPlayer.removeMoney(WeedPrice)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained a Weed Seed')
	 end
end)

RegisterServerEvent('KFlowerShop:buyrose')
AddEventHandler('KFlowerShop:buyrose', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local RoseAmount = 1
	local RosePrice = 10
	
		if RosePrice < xPlayer.getMoney() then
        xPlayer.addInventoryItem('rose', RoseAmount)
		xPlayer.removeMoney(RosePrice)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained a Rose')
	 end
end)

RegisterServerEvent('KFlowerShop:buytulip')
AddEventHandler('KFlowerShop:buytulip', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local TulipAmount = 1
	local TulipPrice = 10
	
		if TulipPrice < xPlayer.getMoney() then
        xPlayer.addInventoryItem('tulip', TulipAmount)
		xPlayer.removeMoney(TulipPrice)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained a Tulip')
	 end
end)

RegisterServerEvent('KFlowerShop:buylily')
AddEventHandler('KFlowerShop:buylily', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local LilyAmount = 1
	local LilyPrice = 10
	
		if LilyPrice < xPlayer.getMoney() then
        xPlayer.addInventoryItem('lily', LilyAmount)
		xPlayer.removeMoney(LilyPrice)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained a Lily')
	 end
end)

RegisterServerEvent('KFlowerShop:buybouquet')
AddEventHandler('KFlowerShop:buybouquet', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local BouquetAmount = 1
	local BouquetPrice = 30
	
		if BouquetPrice < xPlayer.getMoney() then
        xPlayer.addInventoryItem('bouquet', BouquetAmount)
		xPlayer.removeMoney(BouquetPrice)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You obtained a Bouquet')
	 end
end)
			
			
function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end