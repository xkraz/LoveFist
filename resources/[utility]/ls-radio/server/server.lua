ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('radio', function(source)
	local _source = source
	TriggerClientEvent('esx_inventoryhud:close', _source)
	TriggerClientEvent('ls-radio:use', _source)
end)
