local playerInjury = {}

function GetCharsInjuries(source)
    return playerInjury[source]
end

RegisterServerEvent('bonefive:server:SyncInjuries')
AddEventHandler('bonefive:server:SyncInjuries', function(data)
    playerInjury[source] = data
end)

RegisterServerEvent("bones.getIsAllowed")
AddEventHandler("bones.getIsAllowed", function()
    if IsPlayerAceAllowed(source, "command.limbs") then
        TriggerClientEvent("bones.returnIsAllowed", source, true)
    else
        TriggerClientEvent("bones.returnIsAllowed", source, false)
    end
end)
