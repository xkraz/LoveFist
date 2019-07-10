
local isCarry 				  = false
local revived 				  = false
local isDead                  = false
ESX                     	  = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function LoadAnimationDictionary(animationD)
	while(not HasAnimDictLoaded(animationD)) do
		RequestAnimDict(animationD)
		Citizen.Wait(1)
	end
end

RegisterNetEvent('carry:StartCarryC')
AddEventHandler('carry:StartCarryC', function()
	local camanimDict = "missfinale_c2mcs_1"
	local camanimName  = "fin_c2_mcs_1_camman"
	RequestAnimDict(camanimDict)
	while not HasAnimDictLoaded(camanimDict) do
		Citizen.Wait(100)
	end
	
	local player, distance = ESX.Game.GetClosestPlayer()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	
	if distance ~= -1 and distance <= 2.0 then
		local closestPlayer, distance = ESX.Game.GetClosestPlayer()
		
		TriggerServerEvent('carry:LiftTargetS', GetPlayerServerId(closestPlayer))		
		TaskPlayAnim(GetPlayerPed(-1), camanimDict, camanimName, 8.0, 8.0, -1, 50, 0, false, false, false)
		isCarry = true
	else
		ESX.ShowNotification("No player nearby")
	end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false	
end)

RegisterNetEvent('carry:LiftTargetC')
AddEventHandler('carry:LiftTargetC', function(target)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	local lPed = GetPlayerPed(-1)
	local dict = "amb@code_human_in_car_idles@low@ps@"
	if isCarry == false then
		if isdead == true then 
			AttachEntityToEntity(GetPlayerPed(-1), targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		else 
			LoadAnimationDictionary("amb@code_human_in_car_idles@generic@ps@base")
			TaskPlayAnim(lPed, "amb@code_human_in_car_idles@generic@ps@base", "base", 8.0, -8, -1, 33, 0, 0, 40, 0)
			AttachEntityToEntity(GetPlayerPed(-1), targetPed, 40269, 0.22, -0.09, 0.61, 230.0, 0.0, 0.0, false, false, false, true, 2, true)
		end
		isCarry = true
	else
		DetachEntity(GetPlayerPed(-1), true, false)
		ClearPedTasksImmediately(targetPed)
		ClearPedTasksImmediately(GetPlayerPed(-1))
		isCarry = false
	end
end)

-- trunk
local isInTrunk = false

RegisterCommand('trunkgetin', function(source, args, rawCommand)
 local pos = GetEntityCoords(GetPlayerPed(-1), false)
 local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 71)
 if DoesEntityExist(vehicle) and GetVehicleDoorLockStatus(vehicle) == 1 and not kidnapped then
  if not isInTrunk then
   AttachEntityToEntity(GetPlayerPed(-1), vehicle, -1, 0.0, -2.2, 0.5, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
   RaiseConvertibleRoof(vehicle, false)
   if IsEntityAttached(GetPlayerPed(-1)) then
    RequestAnimDict('timetable@floyd@cryingonbed@base')
    while not HasAnimDictLoaded('timetable@floyd@cryingonbed@base') do
     Citizen.Wait(1)
    end
    TaskPlayAnim(GetPlayerPed(-1), 'timetable@floyd@cryingonbed@base', 'base', 1.0, -1, -1, 1, 0, 0, 0, 0)
   end
  end
  isInTrunk = true
 end
end)

RegisterCommand('trunkgetout', function(source, args, rawCommand)
 local pos = GetEntityCoords(GetPlayerPed(-1), false)
 local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 71)
 if DoesEntityExist(vehicle) and GetVehicleDoorLockStatus(vehicle) == 1 and not kidnapped then
  if isInTrunk then
   DetachEntity(GetPlayerPed(-1), 0, true)
   SetEntityVisible(GetPlayerPed(-1), true)
   ClearPedTasksImmediately(GetPlayerPed(-1))
  end
  isInTrunk = false
 end
end)

RegisterNetEvent('toggleTrunk')
AddEventHandler('toggleTrunk', function(getIn)
 if getIn then
  ExecuteCommand('trunkgetin')
 else
  ExecuteCommand('trunkgetout')
 end
end)