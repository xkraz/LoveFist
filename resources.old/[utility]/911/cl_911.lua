-- Simple 911 Command (With Location & Blip) --
		-- Made By Chezza --

-- Code --

blip = nil

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/911', 'Submits a 911 call to the Emergency Services!', {
    { name="Report", help="Enter the incident/report here!" }
})
end)

RegisterNetEvent('911:setBlip')
AddEventHandler('911:setBlip', function(name, x, y, z)
    blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 66)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('911 Call - ' .. name)
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent('911:killBlip')
AddEventHandler('911:killBlip', function()
    RemoveBlip(blip)
end)

-- Command --

RegisterCommand('911', function(source, args)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chatMessage', '^5911', {255,255,255}, ' ^7Please enter your ^1report/issue.')
    else
        TriggerServerEvent('911', location, msg, x, y, z, name)
        TriggerEvent('chatMessage', '^5911', {255,255,255}, ' ^7Message received.')
    end
end)

RegisterCommand('311', function(source, args)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chatMessage', '^4311', {255,255,255}, ' ^7Please enter your ^1report/issue.')
    else
        TriggerServerEvent('311', location, msg, x, y, z, name)
        TriggerEvent('chatMessage', '^4311', {255,255,255}, ' ^7Message received.')
    end
end)
