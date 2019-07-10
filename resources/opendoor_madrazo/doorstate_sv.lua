lockState = {}
allowedtouse = {
"steam:110000104b88dd8",
"steam:1100001051e5022",
"steam:1100001084c0a85",
"steam:110000100121f77",
"steam:110000104c82ee1",
"steam:11000010e700a83",
}
--
RegisterServerEvent('OD:updateState')
AddEventHandler('OD:updateState', function(doorID, state)
    --
        local steam 
        ids = GetPlayerIdentifiers(source)
        for i,theIdentifier in ipairs(ids) do
            if string.find(theIdentifier,"steam:") or -1 > -1 then
                steam = theIdentifier
            end
        end
        if steam ~= nil then
            local canuse = false
            for i=1, #allowedtouse do
                if allowedtouse[i] == steam then
                    canuse = true
                end
            end
            if canuse then
                -- make each door a table, and clean it when toggled
                lockState[doorID] = {}
                -- assign information
                lockState[doorID].state = state
                lockState[doorID].doorID = doorID
                TriggerClientEvent('OD:state', -1, doorID, state)
            end
        end
end)