Citizen.CreateThread(function()
	while true do

	ped = GetPlayerPed(-1)

		if IsPedJumping(ped) and IsControlJustPressed(0, 22) then
			TaskClimb(ped, 0)
		end
	Citizen.Wait(70)
	end
end)