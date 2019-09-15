TriggerEvent('es:addCommand', 'sendping', function(source, args, user)
    if tonumber(args[1]) then
        local xPlayer2 = ESX.GetPlayerFromId(args[1])
        local player_id = args[1]

        if xPlayer2 then
            TriggerClientEvent('esx_phone:sendping', source, player_id)
        else
            TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
        end
    else
        TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Invalid usage.' } })
    end
end, {help = 'sendping', params = {{name = "player_id", help = 'person you want to send gps to'}}})
