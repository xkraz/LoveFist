ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_outlawalertspeeding:FelonySpeedingInProgress')
AddEventHandler('esx_outlawalertspeeding:FelonySpeedingInProgress', function(targetCoords, streetName, vehicleLabel)
	TriggerClientEvent('esx_outlawalertspeeding:outlawNotify', -1, _U('speeding', vehicleLabel, streetName))
	TriggerClientEvent('esx_outlawalertspeeding:FelonySpeedingInProgress', -1, targetCoords)
end)




