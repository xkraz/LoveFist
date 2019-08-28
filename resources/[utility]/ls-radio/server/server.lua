ESX               = nil


Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
  while ESX == nil do
    Citizen.Wait(100)
  end
	ESX.RegisterUsableItem('radio', function(source)
		local _source = source
		TriggerClientEvent('esx_inventoryhud:close', _source)
		TriggerClientEvent('ls-radio:use', _source)
	end)
end)
