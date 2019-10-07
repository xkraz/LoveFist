--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function logMoney(enviador,recipient,quantity)

	MySQL.Async.execute("INSERT INTO pk_logTransacciones (Sender,Recipient,Quantity) VALUES (@sender,@recipient,@quantity)",{['@sender'] = enviador, ['@recipient'] = recipient, ['@quantity'] = quantity})

end

RegisterServerEvent('bank:logMoney')
AddEventHandler('bank:logMoney', function(toPlayer,quantity)
	local xPlayerTo = ESX.GetPlayerFromId(toPlayer)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	logMoney(tostring(xPlayer.identifier),tostring(xPlayerTo.identifier),tonumber(quantity))

end)

RegisterServerEvent('bank:depositarPk')
AddEventHandler('bank:depositarPk', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('chatMessage', _source, "Invalid Quantity")
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
	end
end)


RegisterServerEvent('bank:quitarPk')
AddEventHandler('bank:quitarPk', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('chatMessage', _source, "Invalid Quantity")
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
	end
end)

RegisterServerEvent('bank:balancePk')
AddEventHandler('bank:balancePk', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)
	
end)

RegisterServerEvent('bank:transferir')
AddEventHandler('bank:transferir', function(to, amountt)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local zPlayer = ESX.GetPlayerFromId(to)
    local balance = 0
    if zPlayer ~= nil then
        balance = xPlayer.getAccount('bank').money
        zbalance = zPlayer.getAccount('bank').money
        if tonumber(_source) == tonumber(to) then
            -- advanced notification with bank icon
            TriggerClientEvent('esx:showAdvancedNotification', _source, 'Bank',
                               'Transfer',
                               'You cannot make transfers to yourself!',
                               'CHAR_BANK_MAZE', 9)
        else
            if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <=
                0 then
                -- advanced notification with bank icon
                TriggerClientEvent('esx:showAdvancedNotification', _source,
                                   'Bank', 'Transfer',
                                   'You dont have enough money!',
                                   'CHAR_BANK_MAZE', 9)
            else
                xPlayer.removeAccountMoney('bank', tonumber(amountt))
                zPlayer.addAccountMoney('bank', tonumber(amountt))
                logMoney(tostring(xPlayer.identifier),tostring(zPlayer.identifier),tonumber(amountt))
                -- advanced notification with bank icon
                TriggerClientEvent('esx:showAdvancedNotification', _source,
                                   'Bank', 'Transfer',
                                   'Has transfered ~r~$' .. amountt ..
                                       '~s~ to ~r~' .. to .. ' .',
                                   'CHAR_BANK_MAZE', 9)
                TriggerClientEvent('esx:showAdvancedNotification', to, 'Bank',
                                   'Transfer', 'You have received ~r~$' ..
                                       amountt .. '~s~ from ~r~' .. _source ..
                                       ' .', 'CHAR_BANK_MAZE', 9)
            end

        end
    end

end)





