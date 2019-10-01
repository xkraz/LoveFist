TryToSell = function(pedId, coords)
    if not DoesEntityExist(pedId) or IsPedDeadOrDying(pedId) or IsPedAPlayer(pedId) or IsPedFalling(pedId) then
        Citizen.Trace("disc-drugsales: ped: " .. pedId .. " not able to sell to.")
        return
    end

    cachedPeds[pedId] = true

    FreezeEntityPosition(pedId, true)
    FreezeEntityPosition(PlayerPedId(), true)
    TaskStandStill(pedId, Config.DiscussTime)

    Citizen.Wait(Config.DiscussTime)

    math.randomseed(GetGameTimer())

    local canSell = math.random(0, 100)

    if canSell > 5 then
        Sell()
    else
        serverId = GetPlayerServerId(PlayerId())
        message = 'Dispatch Message: Drug Sale Attempt in progress at GPS: ' .. coords.x .. ', ' .. coords.y
        TriggerServerEvent('disc-gcphone:sendMessageFrom', 'police', 'police', message, serverId)
        exports['mythic_notify']:DoHudText('error', "Are you stupid? Don't ever contact me again.")
    end

    SetPedAsNoLongerNeeded(pedId)

    FreezeEntityPosition(PlayerPedId(), false)
    FreezeEntityPosition(pedId, false)
end

Sell = function()
    ESX.TriggerServerCallback("disc-drugsales:sellDrug", function(soldDrug)
        if soldDrug then
            exports['mythic_notify']:DoHudText('success', "Thanks! Here's $" .. soldDrug)
        else
            exports['mythic_notify']:DoHudText('error', "Well don't try to waste my time if you don't even have something to sell?")
        end
    end)
end


