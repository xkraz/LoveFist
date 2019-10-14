-------- START KNOCKOUT -----------------

local knockedOut = false
local wait = 15
local count = 25
ESX  = nil

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

-------- END KNOCKOUT ------------
----------- START WEAPON DAMAGE MODIFIER ------------

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
----------- END WEAPON DAMAGE MODIFIER ---------
------------ START DISABLE PISTOL WHIP ----------

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
--------------END DISABLE PISTOL WHIP ----------
-------------- START STRIP CLOTHING COMMANDS ---------------

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)


RegisterCommand("shirt", function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['tshirt_1'] = 15, ['tshirt_2'] = 0,
		['torso_1'] = 15, ['torso_2'] = 0,
		['arms'] = 15, ['arms_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)

RegisterCommand("pants", function()

	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['pants_1'] = 21, ['pants_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)

end)

RegisterCommand("shoes", function()

	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['shoes_1'] = 34, ['shoes_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)

end)

RegisterCommand("clothes", function()

	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)

end)

---------------STRIP CLOTHES COMMANDS END-----------------
-------------- POINTING START ----------------------
local mp_pointing = false
local keyPressed = false

local function startPointing()
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if once then
            once = false
        end

        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = GetPlayerPed(-1)
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
    end
end)

--------END POINTING ----------
------START RAGDOLL ----------
local canrag = true

RegisterNetEvent('ragdollset')
AddEventHandler('ragdollset', function(bl)
  canrag = bl
end)


 Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(0)
 		if IsControlPressed(1, 303) and canrag then
 		   SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
 		end
 	end
 end)
 
 --------END RAGDOLL--------
 -------START CROUCH-----------
 
 local crouched = false

Citizen.CreateThread( function()
    while true do
        Citizen.Wait( 1 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
            DisableControlAction( 0, 36, true ) -- INPUT_DUCK

            if ( not IsPauseMenuActive() ) then
              if not(IsPedInAnyVehicle(ped, false)) then
                if ( IsDisabledControlJustPressed( 0, 36 ) ) then
                    RequestAnimSet( "move_ped_crouched" )

                    while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do
                        Citizen.Wait( 100 )
                    end

                    if ( crouched == true ) then
                        ResetPedMovementClipset( ped, 0 )
                        TriggerEvent('bonefive:client:ResetWalk')
                        crouched = false
                    elseif ( crouched == false ) then
                        SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                        crouched = true
                    end

                    TriggerEvent('bonefive:client:crouched', crouched)
                end
              end
            end
        end
    end
end )

----------END CROUCH --------------
----------------------------------------------
-- External Vehicle Commands, Made by FAXES --
----------------------------------------------

function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

RegisterCommand("trunk", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 5

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            ShowInfo("[Vehicle] ~g~Trunk Closed.")
        else	
            SetVehicleDoorOpen(veh, door, false, false)
            ShowInfo("[Vehicle] ~g~Trunk Opened.")
        end
    else
        if distanceToVeh < 6 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                ShowInfo("[Vehicle] ~g~Trunk Closed.")
            else
                SetVehicleDoorOpen(vehLast, door, false, false)
                ShowInfo("[Vehicle] ~g~Trunk Opened.")
            end
        else
            ShowInfo("[Vehicle] ~y~Too far away from vehicle.")
        end
    end
end)

RegisterCommand("hood", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 4

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            ShowInfo("[Vehicle] ~g~Hood Closed.")
        else	
            SetVehicleDoorOpen(veh, door, false, false)
            ShowInfo("[Vehicle] ~g~Hood Opened.")
        end
    else
        if distanceToVeh < 4 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                ShowInfo("[Vehicle] ~g~Hood Closed.")
            else	
                SetVehicleDoorOpen(vehLast, door, false, false)
                ShowInfo("[Vehicle] ~g~Hood Opened.")
            end
        else
            ShowInfo("[Vehicle] ~y~Too far away from vehicle.")
        end
    end
end)

RegisterCommand("door", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    
    if args[1] == "1" then -- Front Left Door
        door = 0
    elseif args[1] == "2" then -- Front Right Door
        door = 1
    elseif args[1] == "3" then -- Back Left Door
        door = 2
    elseif args[1] == "4" then -- Back Right Door
        door = 3
    else
        door = nil
        ShowInfo("Usage: ~n~~b~/door [door]")
        ShowInfo("~y~Possible doors:")
        ShowInfo("1(Front Left Door), 2(Front Right Door)")
        ShowInfo("3(Back Left Door), 4(Back Right Door)")
    end

    if door ~= nil then
        if IsPedInAnyVehicle(ped, false) then
            if GetVehicleDoorAngleRatio(veh, door) > 0 then
                SetVehicleDoorShut(veh, door, false)
                TriggerEvent("^*[Vehicle] ~g~Door Closed.")
            else	
                SetVehicleDoorOpen(veh, door, false, false)
                TriggerEvent("^*[Vehicle] ~g~Door Opened.")
            end
        else
            if distanceToVeh < 4 then
                if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                    SetVehicleDoorShut(vehLast, door, false)
                    TriggerEvent("[Vehicle] ~g~Door Closed.")
                else	
                    SetVehicleDoorOpen(vehLast, door, false, false)
                    TriggerEvent("[Vehicle] ~g~Door Opened.")
                end
            else
                TriggerEvent("[Vehicle] ~y~Too far away from vehicle.")
            end
        end
    end
end)
--- END VEHICLE COMMANDS ---
