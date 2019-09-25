local Vehicle 				= GetVehiclePedIsIn(ped, false)
local licenses 				= {}
local inVehicle 			= IsPedSittingInAnyVehicle(ped)
local lastCar 				= nil
local myIdentity			= {}
local lockStatus 			= 0
local lockStatusOutside 	= 0
local hasKey 				= false
time 						= 0
myIdentifiers 				= {}
ESX							= nil
licenseString				= ""

Citizen.CreateThread(function()
	while true do
		TriggerServerEvent("esx_privatemenu:updateInformation")
		Wait(30000)
	end
end)

RegisterNetEvent("esx_privatemenu:newLicense")
AddEventHandler("esx_privatemenu:newLicense", function(type, id)
	if(type)then
		local type = string.lower(type)
		licenses[type] = newLicense()
		licenses[type].__construct(type, id)
	else
		print("Could not create license. Type was missing.")
	end
end)

function newLicense()
	local self = {}

	self.id = nil
	self.type = nil

	rTable = {}

	rTable.__construct = function(id, type)
		self.id = id
		self.type = type
	end

	return rTable
end

function getLicenses()
	for type, owner in pairs(licenses) do
		Wait(100)
		local newType = ""
		if type ~= nil then
			if tostring(type) == 'aircraft' then
				newType = 'ACL'
			elseif tostring(type) == 'dmv' then
				newType = 'Permit'
			elseif tostring(type) == 'drive' then
				newType = 'DL'
			elseif tostring(type) == 'drive_bike' then
				newType = 'ML'
			elseif tostring(type) == 'boating' then
				newType = 'WCL'
			elseif tostring(type) == 'boat' then
				newType = 'BL'
			elseif tostring(type) == 'drive_truck' then
				newType = 'CDL'
			elseif tostring(type) == 'weed_processing' then
				newType = 'CCCL'
			elseif tostring(type) == 'weapon' then
				newType = 'CCW'
			end
			licenseString = licenseString .. "|" .. tostring(newType)
		end
	end
end

local drifting = false
AddEventHandler('drifting', function(isDrifting)
  drifting = isDrifting
end)

local _focus = false
Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while true do
		Wait(0)
		if not drifting then
			if IsControlJustPressed(1, 10) and GetLastInputMethod(2) then
				SetNuiFocus(true, true)
				SendNUIMessage({type = 'openGeneral'})
				local ped = GetPlayerPed(-1)
				if IsPedInAnyVehicle(ped, true) then
					SendNUIMessage({type = 'showVehicleButton'})
				else
					SendNUIMessage({type = 'hideVehicleButton'})
				end
				_focus = true
			end

			if Config.debug then
				if IsControlJustPressed(1, 42) and GetLastInputMethod(2) then
					local myId = PlayerId()
					local coords = GetEntityCoords(GetPlayerPed(myId))
					ESX.ShowNotification('X: ' .. tostring(coords.x) .. ' Y: ' .. tostring(coords.y) .. ' Z: ' .. tostring(coords.z))
					local heading = GetEntityHeading(GetPlayerPed(-1))
					ESX.ShowNotification('Heading: ' .. tostring(heading))
				end
			end

			if IsControlJustPressed(1, 322) and GetLastInputMethod(2) then
				SetNuiFocus(false, false)
				SendNUIMessage({type = 'close'})
				_focus = false
			end
		else
			if _focus then
				SetNuiFocus(false, false)
				SendNUIMessage({type = 'close'})
				_focus = false
			end
		end
	end
end)

Citizen.CreateThread(function()
	timer = 0
	while true do
		Wait(1000)
		time = time - 1
	end
end)

RegisterNetEvent('esx_privatemenu:saveID')
AddEventHandler('esx_privatemenu:saveID', function(data)
	myIdentifiers = data
end)

RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
end)

RegisterNUICallback('NUIShowGeneral', function()
  SetNuiFocus(true, true)
  SendNUIMessage({type = 'openGeneral'})
end)

RegisterNUICallback('NUIShowInteractions', function()
  SetNuiFocus(true, true)
  SendNUIMessage({type = 'openInteractions'})
end)

RegisterNUICallback('togglephone', function(data)
	TriggerServerEvent('esx_privatemenu:phone', myIdentifiers, data)
end)

RegisterNUICallback('toggleEngineOnOff', function()
	doToggleEngine()
end)

function doToggleEngine()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 then
		if GetPedInVehicleSeat(vehicle, 0) then
			if IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
				SetVehicleEngineOn(vehicle, false, false, true)
			else
				SetVehicleEngineOn(vehicle, true, false, true)
			end
		else
			ESX.ShowNotification('You must be the driver of a vehicle to use this.')
		end
	else
		ESX.ShowNotification('You must be inside of a vehicle to use this.')
	end
end

RegisterNUICallback('toggleVehicleLocks', function()
	doToggleVehicleLocks()
end)

function doToggleVehicleLocks()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 then
		lockStatus = GetVehicleDoorLockStatus(vehicle)
		if lockStatus >= 2 then
			SetVehicleDoorsLocked(vehicle, 1)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 4, "unlock-inside", 0.10)
			ESX.ShowNotification('The doors were unlocked.')
		else
			SetVehicleDoorsLocked(vehicle, 2)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 4, "lock-inside", 0.10)
			ESX.ShowNotification('The doors were locked.')
		end
	else
		ESX.ShowNotification('You must be inside of a vehicle to use this.')
	end
end

--================================================================================================
--==                                  ESX Actions GUI                                           ==
--================================================================================================
RegisterNUICallback('NUIESXActions', function(data)
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openESX'})
	SendNUIMessage({type = 'showInventoryButton'})
	SendNUIMessage({type = 'showPhoneButton'})
	SendNUIMessage({type = 'showBillingButton'})
	SendNUIMessage({type = 'showAnimationsButton'})
end)

RegisterNUICallback('NUIopenInventory', function()
	exports['es_extended']:openInventory()
end)

RegisterNUICallback('NUIopenPhone', function()
	exports['esx_phone']:openESXPhone()
end)

RegisterNUICallback('NUIopenBilling', function()
	exports['esx_billing']:ShowBillsMenu()
end)

RegisterNUICallback('NUIsetVoice', function()
	exports['esx_voice']:setVoice()
end)

RegisterNUICallback('NUIopenAnimations', function()
	exports['esx_animations']:OpenAnimationsMenu()
end)

RegisterNUICallback('NUIJobActions', function(data)
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openJobs'})
	local job = tostring(exports['esx_policejob']:getJob())
	if job == 'police' then
		SendNUIMessage({type = 'showPoliceButton'})
		SendNUIMessage({type = 'hidePortButton'})
		SendNUIMessage({type = 'hideStateButton'})
		SendNUIMessage({type = 'hideSheriffButton'})
		SendNUIMessage({type = 'hideAmbulanceButton'})
		SendNUIMessage({type = 'hideTaxiButton'})
		SendNUIMessage({type = 'hideMechanicButton'})
		SendNUIMessage({type = 'hideFireButton'})
	elseif job == 'port' then
		SendNUIMessage({type = 'hidePoliceButton'})
		SendNUIMessage({type = 'showPortButton'})
		SendNUIMessage({type = 'hideStateButton'})
		SendNUIMessage({type = 'hideSheriffButton'})
		SendNUIMessage({type = 'hideAmbulanceButton'})
		SendNUIMessage({type = 'hideTaxiButton'})
		SendNUIMessage({type = 'hideMechanicButton'})
		SendNUIMessage({type = 'hideFireButton'})
	elseif job == 'state' then
		SendNUIMessage({type = 'hidePoliceButton'})
		SendNUIMessage({type = 'hidePortButton'})
		SendNUIMessage({type = 'showStateButton'})
		SendNUIMessage({type = 'hideSheriffButton'})
		SendNUIMessage({type = 'hideAmbulanceButton'})
		SendNUIMessage({type = 'hideTaxiButton'})
		SendNUIMessage({type = 'hideMechanicButton'})
		SendNUIMessage({type = 'hideFireButton'})
	elseif job == 'sheriff' then
		SendNUIMessage({type = 'hidePoliceButton'})
		SendNUIMessage({type = 'hidePortButton'})
		SendNUIMessage({type = 'hideStateButton'})
		SendNUIMessage({type = 'showSheriffButton'})
		SendNUIMessage({type = 'hideAmbulanceButton'})
		SendNUIMessage({type = 'hideTaxiButton'})
		SendNUIMessage({type = 'hideMechanicButton'})
		SendNUIMessage({type = 'hideFireButton'})
	elseif job == 'ambulance' then
		SendNUIMessage({type = 'showAmbulanceButton'})
		SendNUIMessage({type = 'hidePoliceButton'})
		SendNUIMessage({type = 'hidePortButton'})
		SendNUIMessage({type = 'hideStateButton'})
		SendNUIMessage({type = 'hideSheriffButton'})
		SendNUIMessage({type = 'hideTaxiButton'})
		SendNUIMessage({type = 'hideMechanicButton'})
		SendNUIMessage({type = 'hideFireButton'})
	elseif job == 'taxi' then
		SendNUIMessage({type = 'showTaxiButton'})
		SendNUIMessage({type = 'hidePoliceButton'})
		SendNUIMessage({type = 'hidePortButton'})
		SendNUIMessage({type = 'hideStateButton'})
		SendNUIMessage({type = 'hideSheriffButton'})
		SendNUIMessage({type = 'hideAmbulanceButton'})
		SendNUIMessage({type = 'hideMechanicButton'})
		SendNUIMessage({type = 'hideFireButton'})
	elseif job == 'mechanic' then
		SendNUIMessage({type = 'showMechanicButton'})
		SendNUIMessage({type = 'hidePoliceButton'})
		SendNUIMessage({type = 'hidePortButton'})
		SendNUIMessage({type = 'hideStateButton'})
		SendNUIMessage({type = 'hideSheriffButton'})
		SendNUIMessage({type = 'hideAmbulanceButton'})
		SendNUIMessage({type = 'hideTaxiButton'})
		SendNUIMessage({type = 'hideFireButton'})
	elseif job == 'fire' then
		SendNUIMessage({type = 'showFireButton'})
		SendNUIMessage({type = 'hideMechanicButton'})
		SendNUIMessage({type = 'hidePoliceButton'})
		SendNUIMessage({type = 'hidePortButton'})
		SendNUIMessage({type = 'hideStateButton'})
		SendNUIMessage({type = 'hideSheriffButton'})
		SendNUIMessage({type = 'hideAmbulanceButton'})
		SendNUIMessage({type = 'hideTaxiButton'})
	else
		SendNUIMessage({type = 'hidePoliceButton'})
		SendNUIMessage({type = 'hidePortButton'})
		SendNUIMessage({type = 'hideStateButton'})
		SendNUIMessage({type = 'hideSheriffButton'})
		SendNUIMessage({type = 'hideAmbulanceButton'})
		SendNUIMessage({type = 'hideTaxiButton'})
		SendNUIMessage({type = 'hideMechanicButton'})
		SendNUIMessage({type = 'hideFireButton'})
	end
end)

RegisterNUICallback('NUIambulanceDisabled', function()
	ESX.ShowNotification('Fuctionality disabled. The ESX Team needs to fix the exports on their end.')
end)

RegisterNUICallback('NUIopenAmbulanceMobile', function()
	exports['esx_ambulancejob']:OpenMobileAmbulanceActionsMenu()
end)

RegisterNUICallback('NUIopenAmbulanceBoss', function()
	exports['esx_ambulancejob']:OpenAmbulanceActionsMenu()
end)

RegisterNUICallback('NUIopenPolice', function()
	exports['esx_policejob']:OpenPoliceActionsMenu()
end)

RegisterNUICallback('NUIopenPort', function()
	exports['esx_portjob']:OpenStateActionsMenu()
end)

RegisterNUICallback('NUIopenState', function()
	exports['esx_statejob']:OpenStateActionsMenu()
end)

RegisterNUICallback('NUIopenSheriff', function()
	exports['esx_sheriffjob']:OpenStateActionsMenu()
end)

RegisterNUICallback('NUIopenMechanicBoss', function()
	exports['esx_mecanojob']:OpenMechanicActionsMenu()
end)

RegisterNUICallback('NUIopenMechanicMobile', function()
	exports['esx_mecanojob']:OpenMobileMechanicActionsMenu()
end)

RegisterNUICallback('NUIopenTaxiMobile', function()
	exports['esx_taxijob']:OpenMobileMechanicActionsMenu()
end)

RegisterNUICallback('NUIopenTaxiBoss', function()
	exports['esx_taxijob']:OpenTaxiActionsMenu()
end)

RegisterNUICallback('NUIopenFire', function()
	exports['esx_firejob']:openFire()
end)

RegisterNUICallback('NUIShowVehicleControls', function()
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openVehicleControls'})
end)

RegisterNUICallback('NUIShowDoorControls', function()
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openDoorControls'})
end)

RegisterNUICallback('NUIShowIndividualDoorControls', function()
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openIndividualDoorControls'})
end)

RegisterNUICallback('toggleAllOpenables', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		if GetVehicleDoorAngleRatio(vehicle, 0) > 0.0 then
			SetVehicleDoorShut(vehicle, 0, false)
			SetVehicleDoorShut(vehicle, 1, false)
			SetVehicleDoorShut(vehicle, 2, false)
			SetVehicleDoorShut(vehicle, 3, false)
			SetVehicleDoorShut(vehicle, 4, false)
			SetVehicleDoorShut(vehicle, 5, false)
		else
			SetVehicleDoorOpen(vehicle, 0, false)
			SetVehicleDoorOpen(vehicle, 1, false)
			SetVehicleDoorOpen(vehicle, 2, false)
			SetVehicleDoorOpen(vehicle, 3, false)
			SetVehicleDoorOpen(vehicle, 4, false)
			SetVehicleDoorOpen(vehicle, 5, false)
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleFrontLeftDoor', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local frontLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_f')
		if frontLeftDoor ~= -1 then
			if GetVehicleDoorAngleRatio(vehicle, 0) > 0.0 then
				SetVehicleDoorShut(vehicle, 0, false)
			else
				SetVehicleDoorOpen(vehicle, 0, false)
			end
		else
			ESX.ShowNotification('This vehicle does not have a front driver-side door.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleFrontRightDoor', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local frontRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_f')
		if frontRightDoor ~= -1 then
			if GetVehicleDoorAngleRatio(vehicle, 1) > 0.0 then
				SetVehicleDoorShut(vehicle, 1, false)
			else
				SetVehicleDoorOpen(vehicle, 1, false)
			end
		else
			ESX.ShowNotification('This vehicle does not have a front passenger-side door.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleRearLeftDoor', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local rearLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_r')
		if rearLeftDoor ~= -1 then
			if GetVehicleDoorAngleRatio(vehicle, 2) > 0.0 then
				SetVehicleDoorShut(vehicle, 2, false)
			else
				SetVehicleDoorOpen(vehicle, 2, false)
			end
		else
			ESX.ShowNotification('This vehicle does not have a rear driver-side door.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleRearRightDoor', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local rearRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_r')
		if rearRightDoor ~= -1 then
			if GetVehicleDoorAngleRatio(vehicle, 3) > 0.0 then
				SetVehicleDoorShut(vehicle, 3, false)
			else
				SetVehicleDoorOpen(vehicle, 3, false)
			end
		else
			ESX.ShowNotification('This vehicle does not have a rear passenger-side door.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleHood', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local bonnet = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'bonnet')
		if bonnet ~= -1 then
			if GetVehicleDoorAngleRatio(vehicle, 4) > 0.0 then
				SetVehicleDoorShut(vehicle, 4, false)
			else
				SetVehicleDoorOpen(vehicle, 4, false)
			end
		else
			ESX.ShowNotification('This vehicle does not have a hood.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleTrunk', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local boot = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'boot')
		if boot ~= -1 then
			if GetVehicleDoorAngleRatio(vehicle, 5) > 0.0 then
				SetVehicleDoorShut(vehicle, 5, false)
			else
				SetVehicleDoorOpen(vehicle, 5, false)
			end
		else
			ESX.ShowNotification('This vehicle does not have a trunk.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleWindowsUp', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local frontLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lf')
		local frontRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rf')
		local rearLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lr')
		local rearRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rr')
		local frontMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lm')
		local rearMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rm')
		if frontLeftWindow ~= -1 or frontRightWindow ~= -1 or rearLeftWindow ~= -1 or rearRightWindow ~= -1 or frontMiddleWindow ~= -1 or rearMiddleWindow ~= -1 then
			RollUpWindow(vehicle, 0)
			RollUpWindow(vehicle, 1)
			RollUpWindow(vehicle, 2)
			RollUpWindow(vehicle, 3)
			RollUpWindow(vehicle, 4)
			RollUpWindow(vehicle, 5)
		else
			ESX.ShowNotification('This vehicle has no windows.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleWindowsDown', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local frontLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lf')
		local frontRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rf')
		local rearLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lr')
		local rearRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rr')
		local frontMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lm')
		local rearMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rm')
		if frontLeftWindow ~= -1 or frontRightWindow ~= -1 or rearLeftWindow ~= -1 or rearRightWindow ~= -1 or frontMiddleWindow ~= -1 or rearMiddleWindow ~= -1 then
			RollDownWindow(vehicle, 0)
			RollDownWindow(vehicle, 1)
			RollDownWindow(vehicle, 2)
			RollDownWindow(vehicle, 3)
			RollDownWindow(vehicle, 4)
			RollDownWindow(vehicle, 5)
		else
			ESX.ShowNotification('This vehicle has no windows.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleFrontLeftWindowUp', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local frontLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lf')
		if frontLeftWindow ~= -1 then
			RollUpWindow(vehicle, 0)
		else
			ESX.ShowNotification('This vehicle has no front left window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleFrontLeftWindowDown', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local frontLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lf')
		if frontLeftWindow ~= -1 then
			RollDownWindow(vehicle, 0)
		else
			ESX.ShowNotification('This vehicle has no front left window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleFrontRightWindowUp', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local frontRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rf')
		if frontRightWindow ~= -1 then
			RollUpWindow(vehicle, 1)
		else
			ESX.ShowNotification('This vehicle has no front right window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleFrontRightWindowDown', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local frontRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rf')
		if frontRightWindow ~= -1 then
			RollDownWindow(vehicle, 1)
		else
			ESX.ShowNotification('This vehicle has no front right window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleRearLeftWindowUp', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local rearLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lr')
		if rearLeftWindow ~= -1 then
			RollUpWindow(vehicle, 2)
		else
			ESX.ShowNotification('This vehicle has no rear left window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleRearLeftWindowDown', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local rearLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lr')
		if rearLeftWindow ~= -1 then
			RollDownWindow(vehicle, 2)
		else
			ESX.ShowNotification('This vehicle has no rear left window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleRearRightWindowUp', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local rearRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rr')
		if rearRightWindow ~= -1 then
			RollUpWindow(vehicle, 3)
		else
			ESX.ShowNotification('This vehicle has no rear right window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleRearRightWindowDown', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local rearRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rr')
		if rearRightWindow ~= -1 then
			RollDownWindow(vehicle, 3)
		else
			ESX.ShowNotification('This vehicle has no rear right window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleFrontMiddleWindowUp', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local frontMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lm')
		if frontMiddleWindow ~= -1 then
			RollUpWindow(vehicle, 4)
		else
			ESX.ShowNotification('This vehicle has no front middle window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleFrontMiddleWindowDown', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local frontMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lm')
		if frontMiddleWindow ~= -1 then
			RollDownWindow(vehicle, 4)
		else
			ESX.ShowNotification('This vehicle has no front middle window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleRearMiddleWindowUp', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local rearMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rm')
		if rearMiddleWindow ~= -1 then
			RollUpWindow(vehicle, 5)
		else
			ESX.ShowNotification('This vehicle has no rear middle window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('toggleRearMiddleWindowDown', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		local rearMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rm')
		if rearMiddleWindow ~= -1 then
			RollDownWindow(vehicle, 5)
		else
			ESX.ShowNotification('This vehicle has no rear middle window.')
		end
	else
		ESX.ShowNotification('You must be the driver of a vehicle to use this.')
	end
end)

RegisterNUICallback('NUIShowWindowControls', function()
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openWindowControls'})
end)

RegisterNUICallback('NUIShowIndividiualWindowControls', function()
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openIndividualWindowControls'})
end)

RegisterNUICallback('NUIShowCharacterControls', function()
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openCharacter'})
end)

RegisterNetEvent("esx_privatemenu:setChar")
AddEventHandler("esx_privatemenu:setChar", function(identity)
	myIdentity = identity
end)

RegisterNetEvent("esx_privatemenu:setIdentifier")
AddEventHandler("esx_privatemenu:setIdentifier", function(data)
	myIdentifiers = data
end)

RegisterNUICallback('NUInewCharacter', function(data)
	if myIdentity.characterName == "No Character" then
		exports['esx_identity']:openRegistry()
	else
		ESX.ShowNotification('You can only have one character.')
	end
end)

RegisterNUICallback('NUIDelChar', function(data)
	TriggerServerEvent('esx_privatemenu:deleteCharacter', myIdentifiers, data)
	cb(data)
end)

RegisterNetEvent('esx_privatemenu:sendProximityMessageID')
AddEventHandler('esx_privatemenu:sendProximityMessageID', function(id, message)
	local myId = PlayerId()
	local pid = GetPlayerFromServerId(id)
	if pid == myId then
		TriggerEvent('chatMessage', "[ID]" .. "", {0, 153, 204}, "^7 " .. message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
		TriggerEvent('chatMessage', "[ID]" .. "", {0, 153, 204}, "^7 " .. message)
	end
end)

RegisterNetEvent('esx_privatemenu:sendProximityMessagePhone')
AddEventHandler('esx_privatemenu:sendProximityMessagePhone', function(id, name, message)
	local myId = PlayerId()
	local pid = GetPlayerFromServerId(id)
	if pid == myId then
		TriggerEvent('chatMessage', "[Phone]^3(" .. name .. ")", {0, 153, 204}, "^7 " .. message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
		TriggerEvent('chatMessage', "[Phone]^3(" .. name .. ")", {0, 153, 204}, "^7 " .. message)
	end
end)

RegisterNetEvent('esx_privatemenu:successfulDeleteIdentity')
AddEventHandler('esx_privatemenu:successfulDeleteIdentity', function(data)
	ESX.ShowNotification('Successfully deleted ' .. data.firstname .. ' ' .. data.lastname .. '.')
end)

RegisterNetEvent('esx_privatemenu:failedDeleteIdentity')
AddEventHandler('esx_privatemenu:failedDeleteIdentity', function(data)
	ESX.ShowNotification('Failed to delete ' .. data.firstname .. ' ' .. data.lastname .. '. Please contact a server admin.')
end)

RegisterNetEvent('esx_privatemenu:noIdentity')
AddEventHandler('noIdentity', function()
	ESX.ShowNotification('You do not have an identity.')
end)

RegisterNUICallback('NUItoggleID', function(data)
	TriggerServerEvent('esx_privatemenu:setCharacter', myIdentifiers)
	local job = tostring(exports['esx_policejob']:getJob())
	Wait(1000)
	SetNuiFocus(true, true)
	licenseString = ""
	getLicenses()
	Wait(2000)
	local charName 		= myIdentity.characterName
	local charDOB  		= myIdentity.characterDOB
	local charSex		= myIdentity.characterSex
	local charHeight 	= myIdentity.characterHeight
	local charJob		= "Unemployed"
	local charLicenses	= licenseString
	if job == 'taxi' then
		charJob = "Taxi Driver"
	elseif job == 'tailor' then
		charJob = "Tailor"
	elseif job == 'slaughterer' then
		charJob = "Butcher"
	elseif job == 'reporter' then
		charJob = "Reporter"
	elseif job == 'realestateagent' then
		charJob = "Realtor"
	elseif job == 'miner' then
		charJob = "Miner"
	elseif job == 'mechanic' then
		charJob = "Mechanic"
	elseif job == 'lumberjack' then
		charJob = "Lumberjack"
	elseif job == 'fueler' then
		charJob = "Refiner"
	elseif job == 'fisherman' then
		charJob = "Fisherman"
	elseif job == 'cardealer' then
		charJob = "Car Dealer"
	elseif job == 'banker' then
		charJob = "Banker"
	elseif job == 'ambulance' then
		charJob = "EMS"
	elseif job == 'police' then
		charJob = "Police Officer"
	elseif job == 'port' then
		charJob = 'Port'
	elseif job == 'state' then
		charJob = 'State'
	elseif job == 'sheriff' then
		charJob = 'Sheriff'
	-- INSERT ANY OTHER JOBS HERE
	-- elseif data.characterJob == 'mechanic' then
	-- 	charJob = "Mechanic"
	end

	local height = charHeight
	local heightDivide = height / 12
	local heightFeet = math.floor(heightDivide)
	local heightMultiply = heightFeet * 12
	local heightIn = height - heightMultiply
	local heightInches = math.floor(heightIn)
	local convertedHeight = 0

	if heightFeet ~= 0 then
		convertedHeight = tostring(heightFeet) .. " Feet " .. tostring(heightInches) .. " Inches"
	else
		convertedHeight = tostring(heightInches) .. " Inches"
	end

	Wait(1000)
	SendNUIMessage({
		type = "toggleIDCard",
		characterName 		= 'Name: ' .. charName,
		characterDOB		= 'Date of Birth: ' .. charDOB,
		characterSex		= 'Sex: ' .. charSex,
		characterHeight 	= 'Height: ' .. convertedHeight,
		characterJob		= 'Current Job: ' .. charJob,
		licensesButton		= '---LICENSES BELOW---',
		characterLicenses	= licenseString .. '|'
	})
end)

RegisterNUICallback('NUIshowID', function(data)
	showID(data)
end)

function showID(data)
	local player, distance = ESX.Game.GetClosestPlayer()
	licenseString = ""
	getLicenses()
	Wait(2000)
	if distance ~= -1 and distance <= 3.0 then
		local job = tostring(exports['esx_policejob']:getJob())
		TriggerServerEvent('esx_privatemenu:showID', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), job, licenseString)
		ESX.ShowNotification('You showed your ID.')
	else
		ESX.ShowNotification('There is no one nearby.')
	end
end

RegisterNetEvent('esx_privatemenu:showID')
AddEventHandler('esx_privatemenu:showID', function(data)
	local charName 		= data.characterName
	local charDOB  		= data.characterDOB
	local charSex 		= data.characterSex
	local charHeight 	= data.characterHeight
	local charJob 		= "Unemployed"
	if data.characterJob == 'taxi' then
		charJob = "Taxi Driver"
	elseif data.characterJob == 'tailor' then
		charJob = "Tailor"
	elseif data.characterJob == 'slaughterer' then
		charJob = "Butcher"
	elseif data.characterJob == 'reporter' then
		charJob = "Reporter"
	elseif data.characterJob == 'realestateagent' then
		charJob = "Realtor"
	elseif data.characterJob == 'miner' then
		charJob = "Miner"
	elseif data.characterJob == 'mechanic' then
		charJob = "Mechanic"
	elseif data.characterJob == 'lumberjack' then
		charJob = "Lumberjack"
	elseif data.characterJob == 'fueler' then
		charJob = "Refiner"
	elseif data.characterJob == 'fisherman' then
		charJob = "Fisherman"
	elseif data.characterJob == 'cardealer' then
		charJob = "Car Dealer"
	elseif data.characterJob == 'banker' then
		charJob = "Banker"
	elseif data.characterJob == 'ambulance' then
		charJob = "EMS"
	elseif data.characterJob == 'police' then
		charJob = "Police Officer"
	elseif data.characterJob == 'port' then
		charJob = 'Port'
	elseif data.characterJob == 'state' then
		charJob = 'State'
	elseif data.characterJob == 'sheriff' then
		charJob = 'Sheriff'
	-- INSERT ANY OTHER JOBS HERE
	-- elseif data.characterJob == 'mechanic' then
	-- 	charJob = "Mechanic"
	end

	local height = charHeight
	local heightDivide = height / 12
	local heightFeet = math.floor(heightDivide)
	local heightMultiply = heightFeet * 12
	local heightIn = height - heightMultiply
	local heightInches = math.floor(heightIn)
	local convertedHeight = 0

	if heightFeet ~= 0 then
		convertedHeight = tostring(heightFeet) .. " Feet " .. tostring(heightInches) .. " Inches"
	else
		convertedHeight = tostring(heightInches) .. " Inches"
	end

	SendNUIMessage({type = 'closeAll'})
	Wait(500)
	SetNuiFocus(true, true)
	SendNUIMessage({
		type   = "toggleIDCard",
		characterName 		= 'Name: ' .. charName,
		characterDOB		= 'Date of Birth: ' .. charDOB,
		characterSex		= 'Sex: ' .. charSex,
		characterHeight 	= 'Height: ' .. convertedHeight,
		characterJob 		= 'Current Job: ' .. charJob,
		licensesButton		= '---LICENSES BELOW---',
		characterLicenses	= data.characterLicenses .. '|'
	})
end)

RegisterNUICallback('NUIdeleteCharacter', function(data)
	TriggerServerEvent('esx_privatemenu:setCharacter', myIdentifiers)
	Wait(1000)
	SetNuiFocus(true, true)
	local charName = myIdentity.characterName

	SendNUIMessage({
		type = "deleteCharacter",
		characterName = charName,
		backBtn  = "Back",
		exitBtn  = "Exit"
	})
end)

RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
AddEventHandler('InteractSound_CL:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
	local lCoords = GetEntityCoords(GetPlayerPed(-1))
	local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
	local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
	if(distIs <= maxDistance) then
		SendNUIMessage({
			transactionType     = 'playSound',
			transactionFile     = soundFile,
			transactionVolume   = soundVolume
		})
	end
end)
