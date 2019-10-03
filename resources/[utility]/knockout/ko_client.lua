local knockedOut = false
local wait = 15
local count = 25

Citizen.CreateThread(function()
	while true do
	
		Wait(1)
		local myPed = GetPlayerPed(-1)
		if IsPedInMeleeCombat(myPed) then
			if GetEntityHealth(myPed) < 125 then
				SetPlayerInvincible(PlayerId(), true)
				SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
				ShowNotification("~r~You were knocked out!")
				wait = 15
				knockedOut = true
				SetEntityHealth(myPed, 124)
			end
		end
		if knockedOut == true then
			SetPlayerInvincible(PlayerId(), true)
			DisablePlayerFiring(PlayerId(), true)
			SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
			ResetPedRagdollTimer(myPed)
			
			if wait >= 0 then
				count = count - 1
				if count == 0 then
					count = 15
					wait = wait - 1
					SetEntityHealth(myPed, GetEntityHealth(myPed)+4)
				end
			else
				SetPlayerInvincible(PlayerId(), false)
				knockedOut = false
			end
		end
	end
end)

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

Citizen.CreateThread(function()
     while true do
          Citizen.Wait(0)
          SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
     end
end)

Citizen.CreateThread(function()
    while true do
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.3) 
    	Wait(0)
    	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.3) 
    	Wait(0)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_RAYPISTOL"), 0.0) 
		Wait(0)
    end
end)

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
