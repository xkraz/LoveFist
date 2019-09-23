
local drifting = false

RegisterNetEvent('drifting')

Citizen.CreateThread(function()
	while true do
    if (IsControlJustReleased(1, 70)) and (IsControlJustReleased(1, 57)) then
      if not drifting then
        drifting = true
        TriggerEvent('esx:showNotification', 'Drift mode ~g~Engaged~w~!')
        TriggerEvent('drifting', true)
      else
        drifting = false
        TriggerEvent('esx:showNotification', 'Drift mode ~r~Disengaged~w~!')
        TriggerEvent('drifting', false)
      end
    end
    if drifting then
			DisableControlAction(0, 25,  true) -- disable aim
			DisableControlAction(0, 47,  true) -- disable weapon
			DisableControlAction(0, 58,  true) -- disable weapon
    else

			DisableControlAction(0, 25,  false) -- disable aim
			DisableControlAction(0, 47,  false) -- disable weapon
			DisableControlAction(0, 58,  false) -- disable weapon
    end

    Citizen.Wait(1)
  end
end)
