-- Made by Kylie version 0.1
RegisterCommand('livery', function(source, args, rawCommand)
	local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
	local livery = tonumber(args[1])

		SetVehicleLivery(Veh, livery)
  			TriggerEvent("pNotify:SendNotification", {
            text = "Vehicle Livery "..livery.." loaded!",
            type = "error",
            queue = "lmao",
            timeout = 5000,
            layout = "CenterRight"
        	})
end)

-- Made by Kylie version 0.1
RegisterCommand('extras', function(source, args, rawCommand)
	local Veh = GetVehiclePedIsIn(GetPlayerPed(-1)) 
	local Extra = tonumber(args[1])

		SetVehicleExtra(Veh, Extra)
  			TriggerEvent("pNotify:SendNotification", {
            text = "Vehicle Livery "..livery.." loaded!",
            type = "error",
            queue = "lmao",
            timeout = 5000,
            layout = "CenterRight"
        	})
end)



