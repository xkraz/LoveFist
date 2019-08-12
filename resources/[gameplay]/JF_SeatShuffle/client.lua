--[[ SEAT SHUFFLE ]]--
--[[ BY JAF ]]--

local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				end
			end
		end
	end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		disableSeatShuffle(false)
		Citizen.Wait(5000)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end)

RegisterCommand("shuffle", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false) --False, allow everyone to run it

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = PlayerPedId()
            	if IsPedArmed(ped, 6) then
	    	DisableControlAction(1, 140, true)
            	DisableControlAction(1, 141, true)
            	DisableControlAction(1, 142, true)
        end
    end
end)

local gates = {
	"p_barier_test_s",
	"prop_sec_barier_01a",
	"prop_sec_barier_02a",
	"prop_sec_barier_02b",
	"prop_sec_barier_03a",
	"prop_sec_barier_03b",
	"prop_sec_barier_04a",
	"prop_sec_barier_04b",
	"prop_sec_barier_base_01",
	"prop_sec_barrier_ld_01a",
	"prop_sec_barrier_ld_02a"
}
Citizen.CreateThread(function()
   while true do
		for a = 1, #gates do
			local player = PlayerId()
			local plyPed = GetPlayerPed(player)
			local plyPos = GetEntityCoords(plyPed, false)
			local gate = GetClosestObjectOfType(plyPos.x, plyPos.y, plyPos.z, 100.0, GetHashKey(gates[a]), 0, 0, 0)
			if gate ~= 0 then
				SetEntityAsMissionEntity(gate, 1, 1)
				DeleteObject(gate)
				SetEntityAsNoLongerNeeded(gate)
			end
		end
	   Citizen.Wait(5000)
   end
end)


