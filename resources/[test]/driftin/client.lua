
local drifting = false

RegisterNetEvent('drifting')

local onePressed = {state = false, timePressed = 0}
local twoPressed = {state = false, timePressed = 0}
local timeout = 200

Citizen.CreateThread(function()
	while true do
		local timeStart = GetGameTimer()
		if IsPedInAnyVehicle(GetPlayerPed(-1)) then
	    if (IsControlJustReleased(1, 70)) and not onePressed.state then
				onePressed.state = true
				onePressed.timePressed = GetGameTimer()
			end

			if (IsControlJustReleased(1, 57)) and not twoPressed.state  then
				twoPressed.state = true
				twoPressed.timePressed = GetGameTimer()
			end

			if onePressed.state and twoPressed.state then
				if not drifting then
	        drifting = true
	        TriggerEvent('esx:showNotification', 'Drift mode ~g~Engaged~w~!')
	        TriggerEvent('drifting', true)
					onePressed.state = false
					twoPressed.state = false
	      else
	        drifting = false
	        TriggerEvent('esx:showNotification', 'Drift mode ~r~Disengaged~w~!')
	        TriggerEvent('drifting', false)
					onePressed.state = false
					twoPressed.state = false
	      end
	    end
	    if drifting then
				DisableControlAction(0, 25,  true) -- disable aim
				DisableControlAction(0, 47,  true) -- disable weapon
				DisableControlAction(0, 58,  true) -- disable weapon
	    end

			if onePressed.state and GetGameTimer() - onePressed.timePressed > timeout then
				onePressed.state = false
			end

			if twoPressed.state and GetGameTimer() - twoPressed.timePressed > timeout then
				twoPressed.state = false
			end
		else
			if drifting then
				drifting = false
				TriggerEvent('drifting', false)
				onePressed.state = false
				twoPressed.state = false
			end
		end
		Citizen.Wait(0)

		TriggerServerEvent('logAdd', GetCurrentResourceName(), GetGameTimer() - timeStart)
	end
end)
