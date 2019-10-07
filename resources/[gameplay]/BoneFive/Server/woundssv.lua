local playerInjury = {}

function GetCharsInjuries(source)
    return playerInjury[source]
end

RegisterServerEvent('bonefive:server:SyncInjuries')
AddEventHandler('bonefive:server:SyncInjuries', function(data)
    TriggerEvent('log', source, 'bonefive')
    playerInjury[source] = data
end)

RegisterServerEvent('bonefive:server:CheckInjury')
AddEventHandler('bonefive:server:CheckInjury', function(targetPed)
    TriggerEvent('log', 'server side targetPed: ' .. targetPed, 'bonefive')
    if playerInjury[targetPed] and playerInjury[targetPed].isBleeding ~= nil then
      TriggerEvent('log', '{green}FOUND', 'bonefive')
      TriggerClientEvent('bonefive:client:ShowInjury', source, playerInjury[targetPed], targetPed)
    else
      TriggerEvent('log', '{red}NOT FOUND', 'bonefive')
      TriggerClientEvent('bonefive:client:ShowInjury', source, -1, targetPed)
    end
end)
