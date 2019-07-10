print("[txAdmin] Starting...")


-- Kick all players
RegisterCommand("txaKickAll", function(source, args)
    if args[1] == nil then
        args[1] = 'Kicking all players for server restart.'
    end
    print("[txAdmin] Kicking all players with reason: "..args[1])
    for _, pid in pairs(GetPlayers()) do
        DropPlayer(pid, "Kicked for: " .. args[1])
    end
    CancelEvent()
end, true)


-- Kick specific player
RegisterCommand("txaKickID", function(source, args)
    if args[1] ~= nil then
        if args[2] == nil then
            args[2] = 'no reason provided'
        end
        print("[txAdmin] Kicking #"..args[1].." with reason: "..args[2])
        DropPlayer(args[1], "Kicked for: " .. args[2])
    else
        print('[txAdmin] invalid arguments for txaKickID')
    end
    CancelEvent()
end, true)


-- Broadcast admin message to all players
RegisterCommand("txaBroadcast", function(source, args)
    if args[1] ~= nil then
        print("[txAdmin] Admin Broadcast: "..args[1])
        TriggerClientEvent("chat:addMessage", -1, {
            args = {
                "Admin Broadcast",
                args[1]
            },
            color = {255, 0, 0}
        })
    else
        print('[txAdmin] invalid arguments for txaBroadcast')
    end
    CancelEvent()
end, true)


-- Send admin direct message to specific player
RegisterCommand("txaSendDM", function(source, args)
    if args[1] ~= nil and args[2] ~= nil then
        print("[txAdmin] Admin DM to #"..args[1]..": "..args[2])
        TriggerClientEvent("chat:addMessage", args[1], {
            args = {
                "Admin Direct Message",
                args[2]
            },
            color = {255, 0, 0}
        })
    else
        print('[txAdmin] invalid arguments for txaSendDM')
    end
    CancelEvent()
end, true)


-- Get all resources/statuses and report back to txAdmin
RegisterCommand("txaReportResources", function(source, args)
    print("===============================================")
    local max = GetNumResources() - 1
    -- max = 1
    for i = 0, max do 
        local name = GetResourceByFindIndex(i)
        local state = GetResourceState(name)
        local path = GetResourcePath(name)
        print(state .. "\t" .. name .. "\t" .. path)
    end
end, true)




--[[

ensure txAdmin

GetPlayerEndpoint

https://runtime.fivem.net/doc/natives/

GetPlayerEP

]]
