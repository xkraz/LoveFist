RegisterServerEvent('mythic_hud:server:GetMoneyStuff')
AddEventHandler('mythic_hud:server:GetMoneyStuff', function()
    local cData = {}
    while exports['mythic_base']:getPlayerFromId(source) == nil do
        Citizen.Wait(0)
    end
    while exports['mythic_base']:getPlayerFromId(source).getChar() == nil do
        Citizen.Wait(0)
    end
    cData = exports['mythic_base']:getPlayerFromId(source).getChar().getCharData()
    TriggerClientEvent('mythic_hud:client:DisplayMoneyStuff', source, cData.cash, cData.bank)
end)