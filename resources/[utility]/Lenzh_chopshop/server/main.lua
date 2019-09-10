

ESX = nil
local times = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    ESX.RegisterServerCallback('Lenzh_chopshop:anycops',function(source, cb)
        local anycops = 0
        local playerList = GetPlayers()
        for i=1, #playerList, 1 do
            local _source = playerList[i]
            local xPlayer = ESX.GetPlayerFromId(_source)
            local playerjob = xPlayer.job.name
            if playerjob == 'police' then
                anycops = anycops + 1
            end
        end
        cb(anycops)
    end)

    RegisterServerEvent("chopSetTime")
    AddEventHandler("chopSetTime", function(playID)
      times[playID] = GetGameTimer()
    end)

    RegisterServerEvent("chopGetTime")
    AddEventHandler("chopGetTime", function(playID)
      if times[playID] == nil then
        times[playID] = 0
      end
      TriggerClientEvent("chopGetTime", -1, times[playID], playID)
    end)

    RegisterServerEvent("chopGetServTime")
    AddEventHandler("chopGetServTime", function(playID)
      TriggerClientEvent("chopGetServTime", -1, GetGameTimer(), playID)
    end)

    RegisterServerEvent("chopshopStart")
    AddEventHandler("chopshopStart", function(playID)
      TriggerClientEvent("chopStart", -1, playID)
    end)

    RegisterServerEvent("lenzh_chopshop:rewards")
    AddEventHandler("lenzh_chopshop:rewards", function(_tier)
        --Rewards()
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        if not xPlayer then return; end
        local mathMax = 0
        local mathMin = 0

        for k,v in pairs(Config.Items) do
          local randomCount

          if v == 'battery' then
            if _tier == 'low' then
              mathMax = 1
            elseif _tier == 'mid' then
              mathMax = 3
            elseif _tier == 'high' then
              mathMin = 2
              mathMax = 5
            end
          elseif v == 'lowradio' then
            if _tier == 'low' then
              mathMax = 1
            elseif _tier == 'mid' then
              mathMax = 3
            elseif _tier == 'high' then
              mathMin = 2
              mathMax = 5
            end
          elseif v == 'stockrims' then
            if _tier == 'low' then
              mathMax = 1
            elseif _tier == 'mid' then
              mathMax = 3
            elseif _tier == 'high' then
              mathMin = 2
              mathMax = 5
            end
          elseif v == 'airbag' then
            if _tier == 'low' then
              mathMax = 1
            elseif _tier == 'mid' then
              mathMax = 3
            elseif _tier == 'high' then
              mathMin = 2
              mathMax = 5
            end
          elseif v == 'highradio' then
            if _tier == 'low' then
              mathMax = 0
            elseif _tier == 'mid' then
              mathMax = 2
            elseif _tier == 'high' then
              mathMin = 2
              mathMax = 4
            end
          elseif v == 'highrim' then
            if _tier == 'low' then
              mathMax = 0
            elseif _tier == 'mid' then
              mathMax = 2
            elseif _tier == 'high' then
              mathMin = 2
              mathMax = 4
            end
          end

            local randomCount = math.random(0, mathMax)
            if randomCount ~= 0 then
              if xPlayer.getInventoryItem(v).count + randomCount >= xPlayer.getInventoryItem(v).limit then
                local min = xPlayer.getInventoryItem(v).count
                local max = xPlayer.getInventoryItem(v).limit
                xPlayer.addInventoryItem(v, max - min)
              else
                xPlayer.addInventoryItem(v, randomCount)
              end
            end
        end

    end)


    RegisterServerEvent('chopNotify')
    AddEventHandler('chopNotify', function()
        TriggerClientEvent("chopEnable", source)
    end)


    RegisterServerEvent('ChopInProgress')
    AddEventHandler('ChopInProgress', function()
        TriggerClientEvent("outlawChopNotify", -1)
    end)

    RegisterServerEvent('ChoppingInProgressPos')
    AddEventHandler('ChoppingInProgressPos', function(gx, gy, gz)
        TriggerClientEvent('Choplocation', -1, gx, gy, gz)
    end)


    RegisterServerEvent('lenzh_chopshop:sell')
    AddEventHandler('lenzh_chopshop:sell', function(itemName, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        local price = Config.Itemsprice[itemName]
        local xItem = xPlayer.getInventoryItem(itemName)


        if xItem.count < amount then
            TriggerClientEvent('esx:showNotification', source, _U('not_enough'))
            return
        end

        price = ESX.Math.Round(price * amount)

        if Config.GiveBlack then
            xPlayer.addAccountMoney('black_money', price)
        else
            xPlayer.addMoney(price)
        end

        xPlayer.removeInventoryItem(xItem.name, amount)

        TriggerClientEvent('esx:showNotification', source, _U('sold', amount, xItem.label, ESX.Math.GroupDigits(price)))
    end)
