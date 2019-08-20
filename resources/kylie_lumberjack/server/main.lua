ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local vine = 1
local jus = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'lumberjack', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'lumberjack', _U('lumberjackron_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'lumberjack', 'Lumberjackron', 'society_lumberjack', 'society_lumberjack', 'society_lumberjack', {type = 'private'})
local function Harvest(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "woodChopping" then
			local itemQuantity = xPlayer.getInventoryItem('wood').count
			if itemQuantity >= 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place'))
				return
			else
				SetTimeout(1800, function()
					xPlayer.addInventoryItem('wood', 1)
					Harvest(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('kylie_lumberjack:startHarvest')
AddEventHandler('kylie_lumberjack:startHarvest', function(zone)
	local _source = source
  	
	if PlayersHarvesting[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Kylie is always watching you :)')
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('raisin_taken'))  
		Harvest(_source,zone)
	end
end)


RegisterServerEvent('kylie_lumberjack:stopHarvest')
AddEventHandler('kylie_lumberjack:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'You have exited the ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'You can now ~g~harvest')
		PlayersHarvesting[_source]=true
	end
end)


local function Transform(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "woodPackaging" then
			local itemQuantity = xPlayer.getInventoryItem('cutted_wood').count
			
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin'))
				return
			else
				local rand = math.random(0,100)
				if (rand >= 90) then
					SetTimeout(1800, function()
						xPlayer.removeInventoryItem('cutted_wood', 1)
						xPlayer.addInventoryItem('supreme_packaged_plank', 1)
						TriggerClientEvent('esx:showNotification', source, _U('grand_cru'))
						Transform(source, zone)
					end)
				else
					SetTimeout(1800, function()
						xPlayer.removeInventoryItem('cutted_wood', 1)
						xPlayer.addInventoryItem('packaged_plank', 1)
				
						Transform(source, zone)
					end)
				end
			end
		elseif zone == "plankCutting" then
			local itemQuantity = xPlayer.getInventoryItem('wood').count
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin'))
				return
			else
				SetTimeout(1800, function()
					xPlayer.removeInventoryItem('wood', 1)
					xPlayer.addInventoryItem('cutted_wood', 1)
		  
					Transform(source, zone)	  
				end)
			end
		end
	end	
end

RegisterServerEvent('kylie_lumberjack:startTransform')
AddEventHandler('kylie_lumberjack:startTransform', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Kylie is always watching you :)')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress')) 
		Transform(_source,zone)
	end
end)

RegisterServerEvent('kylie_lumberjack:stopTransform')
AddEventHandler('kylie_lumberjack:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'You exited the ~r~zone')
		
	else
		PlayersTransforming[_source]=true
		
	end
end)

local function Sell(source, zone)


	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		local PlayerData = ESX.GetPlayerFromId(source)
		
		if zone == 'SellFarm' then
			if xPlayer.getInventoryItem('packaged_plank').count <= 0 then
				packaged_plank = 0
			else
				packaged_plank = 1
			end
		
		
			if packaged_plank == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('packaged_plank').count <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_vin_sale'))
				packaged_plank = 0
				return
			else
				if (packaged_plank == 1) then
					SetTimeout(1000, function()
						local money = math.random(3,8)
						xPlayer.removeInventoryItem('packaged_plank', 1)
							xPlayer.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('selling_wood') .. money)
						Sell(source,zone)
					end)
				end
				
			end
		end
	end
end

RegisterServerEvent('kylie_lumberjack:startSell')
AddEventHandler('kylie_lumberjack:startSell', function(zone)

	local _source = source
	
	if PlayersSelling[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~Kylie is always watching you :)')
		PlayersSelling[_source]=false
	else
		PlayersSelling[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sell(_source, zone)
	end

end)

RegisterServerEvent('kylie_lumberjack:stopSell')
AddEventHandler('kylie_lumberjack:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'You exited the ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'You can ~g~sell')
		PlayersSelling[_source]=true
	end

end)

RegisterServerEvent('kylie_lumberjack:getStockItem')
AddEventHandler('kylie_lumberjack:getStockItem', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_lumberjack', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('kylie_lumberjack:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_lumberjack', function(inventory)
		cb(inventory.items)
	end)

end)

RegisterServerEvent('kylie_lumberjack:putStockItems')
AddEventHandler('kylie_lumberjack:putStockItems', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_lumberjack', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

	end)
end)

ESX.RegisterServerCallback('kylie_lumberjack:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)

