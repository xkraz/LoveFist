local enableCruise = false
Citizen.CreateThread( function()
	while true do 
		Citizen.Wait( 0 )   
		local ped = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(ped, false)
		local vehicleModel = GetEntityModel(vehicle)
		local speed = GetEntitySpeed(vehicle)
		local float Max = GetVehicleMaxSpeed(vehicleModel)
			if ( ped ) then
				if IsControlJustPressed(1, 20) then
					local inVehicle = IsPedSittingInAnyVehicle(ped)
					if (inVehicle) then
						if (GetPedInVehicleSeat(vehicle, -1) == ped) then
							if enableCruise == false then
								SetEntityMaxSpeed(vehicle, speed)
					TriggerEvent("pNotify:SendNotification", {
       				  	   text = "[Cruise Control] ENABLED",
       				   	  type = "error",
         			  		 queue = "lmao",
            					timeout = 2000,
           				 	layout = "CenterRight"
        					})
							enableCruise = true
							else
							
								SetEntityMaxSpeed(vehicle, Max)
					TriggerEvent("pNotify:SendNotification", {
       				  	   text = "[Cruise Control] DISABLED",
       				   	  type = "error",
         			  		 queue = "lmao",
            					timeout = 2000,
           				 	layout = "CenterRight"
        					})
								enableCruise = false
							end
						else
					TriggerEvent("pNotify:SendNotification", {
       				  	   text = "[Cruise Control] You are not the driver!!",
       				   	  type = "error",
         			  		 queue = "lmao",
            					timeout = 2000,
           				 	layout = "CenterRight"
        					})
						end
					end
				end
			end
		end
end)


