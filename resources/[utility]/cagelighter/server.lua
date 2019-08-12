-- ESX
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj

  ESX.RegisterUsableItem('lighter', function(source)
    TriggerClientEvent("cagelighter:spark", source)
  end)
end)

RegisterNetEvent("cagelighter:breakLighter")
AddEventHandler("cagelighter:breakLighter", function()
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer ~= nil then
    xPlayer.removeInventoryItem("lighter", 1)
  end
end)
