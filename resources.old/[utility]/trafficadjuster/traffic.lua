Citizen.CreateThread(function()
	while true do
		-- These natives has to be called every frame.
		SetVehicleDensityMultiplierThisFrame(TrafficAmount/1000)
		SetPedDensityMultiplierThisFrame(PedestrianAmount/100)
		SetRandomVehicleDensityMultiplierThisFrame(TrafficAmount/1000)
		SetParkedVehicleDensityMultiplierThisFrame(ParkedAmount/500)
		SetScenarioPedDensityMultiplierThisFrame(PedestrianAmount/100, PedestrianAmount/100)
		for i = 1, 13 do
			EnableDispatchService(i, EnableDispatch)
		end
		RemoveAllPickupsOfType(0xDF711959) -- carbine rifle
    RemoveAllPickupsOfType(0xF9AFB48F) -- pistol
    RemoveAllPickupsOfType(0xA9355DCD) -- pumpshotgun
	
		Citizen.Wait(1)			
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i = 1, 15 do
			EnableDispatchService(i, false)
		end
		local playerPed = GetPlayerPed(-1)
		local playerLocalisation = GetEntityCoords(playerPed)
		ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
	end
end)

-- Citizen.CreateThread(function() 
    -- while true do              
        -- if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then
            -- local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())
            -- local lock = GetVehicleDoorLockStatus(veh)

            -- if lock == 7 then
                -- SetVehicleDoorsLocked(veh, 2)
            -- end
                 
            -- local pedd = GetPedInVehicleSeat(veh, -1)

            -- if pedd then                   
                -- SetPedCanBeDraggedOut(pedd, false)
            -- end             
        -- end   
        -- Citizen.Wait(0)	    							
    -- end
-- end)