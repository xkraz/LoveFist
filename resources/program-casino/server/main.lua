ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'casino', 'Casino', 'society_casino', 'society_casino', 'society_casino', {type = 'casino'})

RegisterServerEvent("startblackjack")
AddEventHandler("startblackjack", function()
    local s = source
    local player1
    local player2
    TriggerClientEvent('esx:showAdvancedNotification', s, 'Starting the game', 'Opening the table', 'Hazardzistow ~g~---', 'CHAR_BANK_MAZE', 9)
end)

RegisterServerEvent("program-casino:openTicketMenu")
AddEventHandler("program-casino:openTicketMenu", function(player, worker)
    local s = source
    TriggerClientEvent('program-casino:openTicketMenuClient',player,s)
end)

RegisterServerEvent("program-casino:sendTicket")
AddEventHandler("program-casino:sendTicket", function(ticket, worker)
    worker = worker
    TriggerClientEvent('esx:showNotification', worker, ticket)
end)

ESX.RegisterServerCallback('program-casino:checkMoney', function(source, cb)
    xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()
    cb(money)
end)

RegisterServerEvent("program-casino:sendPlatinium")
AddEventHandler("program-casino:sendPlatinium", function(ticket, worker)
    local s = source
    TriggerClientEvent('program-blackjack:setPlatinium',s)
end)

RegisterServerEvent("program-casino:sendOffPlatinium")
AddEventHandler("program-casino:sendOffPlatinium", function(ticket, worker)
    local s = source
    TriggerClientEvent('program-blackjack:isPlatiniumSetFalse',s)
end)

RegisterServerEvent("program-casino:removeMoney")
AddEventHandler("program-casino:removeMoney", function(price)
    local xPlayer = ESX.GetPlayerFromId(source)
    price = tonumber(price)
    xPlayer.removeMoney(price)
    local societyAccount = nil
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino', function(account)
		societyAccount = account
    end)
    societyAccount.addMoney(price)
end)




RegisterServerEvent('program-casino:craftingCoktails')
AddEventHandler('program-casino:craftingCoktails', function(itemValue)

    local _source = source
    local _itemValue = itemValue
    TriggerClientEvent('esx:showNotification', _source, 'Mixing different ingredients in progress!')

    if _itemValue == 'jagerbomb' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('energy').count
            local bethQuantity      = xPlayer.getInventoryItem('jager').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not enough " .."energy drinks " .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not enough " .."jager " .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'You mixed an average drink ...')
                    xPlayer.removeInventoryItem('energy', 2)
                    xPlayer.removeInventoryItem('jager', 2)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete Mixing " .. 'jagerbomb' .. ' ~w~!')
                    xPlayer.removeInventoryItem('energy', 2)
                    xPlayer.removeInventoryItem('jager', 2)
                    xPlayer.addInventoryItem('jagerbomb', 1)
                end
            end

        end)
    end

    if _itemValue == 'golem' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('limonade').count
            local bethQuantity      = xPlayer.getInventoryItem('vodka').count
            local gimelQuantity     = xPlayer.getInventoryItem('ice').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not enough " .. 'lemonade' .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not enough " .. "vodka" .. '~w~')
            elseif gimelQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Not enough " .. 'ice' .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'On average, this mixture came out ...')
                    xPlayer.removeInventoryItem('limonade', 2)
                    xPlayer.removeInventoryItem('vodka', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete mixing " .. 'golem' .. ' ~w~!')
                    xPlayer.removeInventoryItem('limonade', 2)
                    xPlayer.removeInventoryItem('vodka', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                    xPlayer.addInventoryItem('golem', 1)
                end
            end

        end)
    end
    
    if _itemValue == 'whiskycoca' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('soda').count
            local bethQuantity      = xPlayer.getInventoryItem('whisky').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not enough" .. 'soda' .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not enough" .. "whisky" .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'On average, this mixture came out ...')
                    xPlayer.removeInventoryItem('soda', 2)
                    xPlayer.removeInventoryItem('whisky', 2)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete mixing" .. 'Whisky - cola'.. ' ~w~!')
                    xPlayer.removeInventoryItem('soda', 2)
                    xPlayer.removeInventoryItem('whisky', 2)
                    xPlayer.addInventoryItem('whiskycoca', 1)
                end
            end

        end)
    end

    if _itemValue == 'rhumcoca' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('soda').count
            local bethQuantity      = xPlayer.getInventoryItem('rhum').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not enough " .. 'soda' .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'rum' .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'On average, this mixture came out ...')
                    xPlayer.removeInventoryItem('soda', 2)
                    xPlayer.removeInventoryItem('rhum', 2)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete mixing " .. 'rum-cola' .. ' ~w~!')
                    xPlayer.removeInventoryItem('soda', 2)
                    xPlayer.removeInventoryItem('rhum', 2)
                    xPlayer.addInventoryItem('rhumcoca', 1)
                end
            end

        end)
    end

    if _itemValue == 'vodkaenergy' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('energy').count
            local bethQuantity      = xPlayer.getInventoryItem('vodka').count
            local gimelQuantity     = xPlayer.getInventoryItem('ice').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .."energy drink " .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. "vodka" .. '~w~')
            elseif gimelQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'ice' .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'On average, this mixture came out ...')
                    xPlayer.removeInventoryItem('energy', 2)
                    xPlayer.removeInventoryItem('vodka', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete mixing " .. 'vodka-energy' .. ' ~w~!')
                    xPlayer.removeInventoryItem('energy', 2)
                    xPlayer.removeInventoryItem('vodka', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                    xPlayer.addInventoryItem('vodkaenergy', 1)
                end
            end

        end)
    end

    if _itemValue == 'vodkafruit' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('jusfruit').count
            local bethQuantity      = xPlayer.getInventoryItem('vodka').count
            local gimelQuantity     = xPlayer.getInventoryItem('ice').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " ..'fruit juice' .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. "vodka" .. '~w~')
            elseif gimelQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'ice' .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'On average, this mixture came out ...')
                    xPlayer.removeInventoryItem('jusfruit', 2)
                    xPlayer.removeInventoryItem('vodka', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete mixing " .. 'Vodka - fruit juice' .. ' ~w~!')
                    xPlayer.removeInventoryItem('jusfruit', 2)
                    xPlayer.removeInventoryItem('vodka', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                    xPlayer.addInventoryItem('vodkafruit', 1) 
                end
            end

        end)
    end

    if _itemValue == 'rhumfruit' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('jusfruit').count
            local bethQuantity      = xPlayer.getInventoryItem('rhum').count
            local gimelQuantity     = xPlayer.getInventoryItem('ice').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " ..'fruit juice' .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'rum' .. '~w~')
            elseif gimelQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'ice' .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'On average, this mixture came out ...')
                    xPlayer.removeInventoryItem('jusfruit', 2)
                    xPlayer.removeInventoryItem('rhum', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete mixing " .. 'Rum - fruit juice' .. ' ~w~!')
                    xPlayer.removeInventoryItem('jusfruit', 2)
                    xPlayer.removeInventoryItem('rhum', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                    xPlayer.addInventoryItem('rhumfruit', 1)
                end
            end

        end)
    end

    if _itemValue == 'teqpaf' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('limonade').count
            local bethQuantity      = xPlayer.getInventoryItem('tequila').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'lemonade' .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. "tequila" .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'On average, this mixture came out ...')
                    xPlayer.removeInventoryItem('limonade', 2)
                    xPlayer.removeInventoryItem('tequila', 2)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete mixing " .. 'Teq Paf' .. ' ~w~!')
                    xPlayer.removeInventoryItem('limonade', 2)
                    xPlayer.removeInventoryItem('tequila', 2)
                    xPlayer.addInventoryItem('teqpaf', 1)
                end
            end

        end)
    end

    if _itemValue == 'mojito' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('rhum').count
            local bethQuantity      = xPlayer.getInventoryItem('limonade').count
            local gimelQuantity     = xPlayer.getInventoryItem('menthe').count
            local daletQuantity      = xPlayer.getInventoryItem('ice').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'rum' .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'lemonade' .. '~w~')
            elseif gimelQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'mint' .. '~w~')
            elseif daletQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'ice' .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'On average, this mixture came out ...')
                    xPlayer.removeInventoryItem('rhum', 2)
                    xPlayer.removeInventoryItem('limonade', 2)
                    xPlayer.removeInventoryItem('menthe', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete mixing " .. 'Mojito' .. ' ~w~!')
                    xPlayer.removeInventoryItem('rhum', 2)
                    xPlayer.removeInventoryItem('limonade', 2)
                    xPlayer.removeInventoryItem('menthe', 2)
                    xPlayer.removeInventoryItem('ice', 1)
                    xPlayer.addInventoryItem('mojito', 1)
                end
            end

        end)
    end

    if _itemValue == 'mixapero' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('bolcacahuetes').count
            local bethQuantity      = xPlayer.getInventoryItem('bolnoixcajou').count
            local gimelQuantity     = xPlayer.getInventoryItem('bolpistache').count
            local daletQuantity     = xPlayer.getInventoryItem('bolchips').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'Peanuts' .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'Ground Peanuts' .. '~w~')
            elseif gimelQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'Pistachios' .. '~w~')
            elseif daletQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'Chips' .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'On average, this mixture came out ...')
                    xPlayer.removeInventoryItem('bolcacahuetes', 2)
                    xPlayer.removeInventoryItem('bolnoixcajou', 2)
                    xPlayer.removeInventoryItem('bolpistache', 2)
                    xPlayer.removeInventoryItem('bolchips', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete mixing " .. 'Aperitif Mix' .. ' ~w~!')
                    xPlayer.removeInventoryItem('bolcacahuetes', 2)
                    xPlayer.removeInventoryItem('bolnoixcajou', 2)
                    xPlayer.removeInventoryItem('bolpistache', 2)
                    xPlayer.removeInventoryItem('bolchips', 2)
                    xPlayer.addInventoryItem('mixapero', 1)
                end
            end

        end)
    end

    if _itemValue == 'metreshooter' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('jager').count
            local bethQuantity      = xPlayer.getInventoryItem('vodka').count
            local gimelQuantity     = xPlayer.getInventoryItem('whisky').count
            local daletQuantity     = xPlayer.getInventoryItem('tequila').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .."jager " .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. "vodka" .. '~w~')
            elseif gimelQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. "whisky" .. '~w~')
            elseif daletQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. "tequila" .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'On average, this mixture came out ...')
                    xPlayer.removeInventoryItem('jager', 2)
                    xPlayer.removeInventoryItem('vodka', 2)
                    xPlayer.removeInventoryItem('whisky', 2)
                    xPlayer.removeInventoryItem('tequila', 2)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete mixing " .. 'Shooter meter' .. ' ~w~!')
                    xPlayer.removeInventoryItem('jager', 2)
                    xPlayer.removeInventoryItem('vodka', 2)
                    xPlayer.removeInventoryItem('whisky', 2)
                    xPlayer.removeInventoryItem('tequila', 2)
                    xPlayer.addInventoryItem('metreshooter', 1)
                end
            end

        end)
    end

    if _itemValue == 'jagercerbere' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('jagerbomb').count
            local bethQuantity      = xPlayer.getInventoryItem('vodka').count
            local gimelQuantity     = xPlayer.getInventoryItem('tequila').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. 'jagerbomb' .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. "vodka" .. '~w~')
            elseif gimelQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Not Enough " .. "tequila" .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source,'On average, this mixture came out ...')
                    xPlayer.removeInventoryItem('jagerbomb', 1)
                    xPlayer.removeInventoryItem('vodka', 2)
                    xPlayer.removeInventoryItem('tequila', 2)
                else
                    TriggerClientEvent('esx:showNotification', _source, "Complete mixing " .."jagercerbere" .. ' ~w~!')
                    xPlayer.removeInventoryItem('jagerbomb', 1)
                    xPlayer.removeInventoryItem('vodka', 2)
                    xPlayer.removeInventoryItem('tequila', 2)
                    xPlayer.addInventoryItem('jagercerbere', 1)
                end
            end

        end)
    end

end)

RegisterServerEvent('program-casino:getFridgeStockItem')
AddEventHandler('program-casino:getFridgeStockItem', function(itemName, count)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_casino_fridge', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, "Bad amount")
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, "Withdrew " .. count .. ' ' .. item.label.."from the fridge.")

  end)

end)

ESX.RegisterServerCallback('program-casino:getFridgeStockItems', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_casino_fridge', function(inventory)
      cb(inventory.items)
    end)
  
end)
  
RegisterServerEvent('program-casino:putFridgeStockItems')
AddEventHandler('program-casino:putFridgeStockItems', function(itemName, count)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_casino_fridge', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, "Bad amount")
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, "You put " .. count .. ' ' .. item.label)

  end)

end)


ESX.RegisterServerCallback('program-casino:getStockItems', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_casino', function(inventory)
      cb(inventory.items)
    end)
  
  end)