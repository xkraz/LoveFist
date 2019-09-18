local plyPed = GetPlayerPed(-1)
local plyVeh = GetVehiclePedIsUsing(GetPlayerPed(-1))
local shortR = true

-----------------------------------------------------------------------
----------------------------GARAGE-LOCATION----------------------------
-----------------------------------------------------------------------

vehicleRepairStation = {
	{4263.55,  8751.04,  91.86},
	{-2836.71,  -6923.89,  10.21},

}




	
Citizen.CreateThread(function ()
	Citizen.Wait(0)
	for i = 1, #vehicleRepairStation do
		garageCoords = vehicleRepairStation[i]
		stationBlip = AddBlipForCoord(garageCoords[1], garageCoords[2], garageCoords[3])
		SetBlipSprite(stationBlip, 446) --446 = Tools
		SetBlipAsShortRange(stationBlip, true)
	end
	return
end)

function DrawSpecialText(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
			for i = 1, #vehicleRepairStation do
				garageCoords2 = vehicleRepairStation[i]
				DrawMarker(1, garageCoords2[1], garageCoords2[2], garageCoords2[3], 0, 0, 0, 0, 0, 0, 10.0, 10.0, 2.0, 0, 157, 0, 155, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) < 20 then 
					SetVehicleFixed(GetVehiclePedIsUsing(GetPlayerPed(-1)))
					SetVehicleDeformationFixed(GetVehiclePedIsUsing(GetPlayerPed(-1)))
					SetVehicleUndriveable(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
					DrawSpecialText("Vehicle ~h~~y~fixed~w~!!! Go! Go! Go!", 5000)
				end
			end
		end
	end
end)
