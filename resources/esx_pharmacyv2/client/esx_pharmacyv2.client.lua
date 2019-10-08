ESX = nil
local GUI                     = {}
GUI.Time                      = 0
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local ill = false
local chance = 2 -- La chance d'être malade, vérifie chaque minute. Il ne peut pas dire 1 car il doit être inférieur à 1, ce qui correspond à 0. Par défaut, il est défini sur 5% (numéro 6).


-- ====================================================================================================================
-- Local function
-- ====================================================================================================================
function setCurrentAction(action, msg, data)
  CurrentAction     = action
  CurrentActionMsg  = msg
  CurrentActionData = data
end


-- ====================================================================================================================
-- Citizen thread
-- ====================================================================================================================
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- Render markers
Citizen.CreateThread(function()
  while true do
    Wait(0)
    local coords = GetEntityCoords(GetPlayerPed(-1))

    for k,v in pairs(Config.Shops) do
      if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance then
        DrawMarker(
          Config.MarkerType,
          v.x,
          v.y,
          v.z,
          0.0,
          0.0,
          0.0,
          0,
          0.0,
          0.0,
          Config.MarkerSize.x,
          Config.MarkerSize.y,
          Config.MarkerSize.z,
          Config.MarkerColor.r,
          Config.MarkerColor.g,
          Config.MarkerColor.b,
          100,
          false,
          true,
          2,
          false,
          false,
          false,
          false
        )
      end
    end
  end
end)

-- Create blips
Citizen.CreateThread(function()
  for i = 1, #Config.Shops, 1 do
    local shop = Config.Shops[i]

    local blip = AddBlipForCoord(shop.x, shop.y, shop.z - Config.ZDiff)
    SetBlipSprite (blip, Config.BlipSprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.8)
    SetBlipColour (blip, Config.BlipColour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(_U('shop'))
    EndTextCommandSetBlipName(blip)
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
  while true do
    Wait(0)
    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker  = false
    local currentZone = nil

    for k,v in pairs(Config.Shops) do
      if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.MarkerSize.x then
        isInMarker  = true
        currentZone = k
      end
    end

    if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
      HasAlreadyEnteredMarker = true
      LastZone                = currentZone
      TriggerEvent('esx_pharmacyv2:hasEnteredMarker', currentZone)
    end

    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      TriggerEvent('esx_pharmacyv2:hasExitedMarker', LastZone)
    end

  end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if CurrentAction ~= nil then
      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)
      if IsControlPressed(0, 38) and (GetGameTimer() - GUI.Time) > 300 then
        if CurrentAction == 'pharmacy_shop' then
          OpenShopMenu()
        end
        CurrentAction = nil
        GUI.Time      = GetGameTimer()
      end
    end
  end
end)


-- ====================================================================================================================
-- Event handler
-- ====================================================================================================================
AddEventHandler('esx_pharmacyv2:hasEnteredMarker', function(zone)
  CurrentAction     = 'pharmacy_shop'
  CurrentActionMsg  = _U('press_menu')
  CurrentActionData = {}
end)

AddEventHandler('esx_pharmacyv2:hasExitedMarker', function(zone)
  ESX.UI.Menu.CloseAll()
  CurrentAction = nil
end)

RegisterNetEvent('esx_pharmacyv2:useKit')
AddEventHandler('esx_pharmacyv2:useKit', function(itemName, hp_regen)
  local ped    = GetPlayerPed(-1)
  local health = GetEntityHealth(ped)
  local max    = GetEntityMaxHealth(ped)

  if health > 0 and health < max then

    TriggerServerEvent('esx_pharmacyv2:removeItem', itemName)
    ESX.UI.Menu.CloseAll()
    ESX.ShowNotification(_U('use_firstaidkit'))

    health = health + (max / hp_regen)
    if health > max then
      health = max
    end
    SetEntityHealth(ped, health)
	TriggerEvent('bonefive:client:RemoveBleed')
  end
end)

RegisterNetEvent('esx_pharmacyv2:useDefibrillateur')
AddEventHandler('esx_pharmacyv2:useDefibrillateur', function(itemName)
  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

  if closestPlayer == -1 or closestDistance > 3.0 then
    ESX.ShowNotification(_U('no_players'))
  else
    local ped    = GetPlayerPed(closestPlayer)
    local health = GetEntityHealth(ped)

    if health == 0 then
      local playerPed = GetPlayerPed(-1)
      Citizen.CreateThread(function()
        ESX.ShowNotification(_U('revive_inprogress'))
        TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
        Citizen.Wait(15000)
        ClearPedTasks(playerPed)
        if GetEntityHealth(closestPlayer) == 0 then
          TriggerServerEvent('esx_ambulancejob:reviveP', GetPlayerServerId(closestPlayer))
          ESX.ShowNotification(_U('revive_complete') .. GetPlayerName(closestPlayer))
		  TriggerEvent('bonefive:client:RemoveBleed')
			TriggerEvent('bonefive:client:ResetLimbs')
        else
          ESX.ShowNotification(GetPlayerName(closestPlayer) .. _U('isdead'))
        end
      end)
    else
		  ESX.ShowNotification(GetPlayerName(closestPlayer) .. _U('unconscious'))
    end
  end
end)

function helpDisplay(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

--Citizen.CreateThread(function()

--while true do
  --  Citizen.Wait(60000)

  --local chanceill = math.random(1, 100)

   --if chanceill < chance then -- Vérifie si le nombre aléatoire est inférieur à 6, 5% de 100 (par défaut).
     --  ill = true -- Tomber malade si vous avez eu la "chance" avec succès.

    --end
  --end
--end)


-- Citizen.CreateThread(function()

-- while true do
     -- local chansatthosta = math.random(30000, 100000)

    -- Citizen.Wait(chansatthosta)

    -- if ill then --Vérifie si malade

--Animation toux
     -- RequestAnimDict("timetable@gardener@smoking_joint")
         -- while not HasAnimDictLoaded("timetable@gardener@smoking_joint") do
          -- Citizen.Wait(100)
         -- end

      -- SetNotificationTextEntry('STRING')
      -- AddTextComponentString(_U('care_needs'))
      -- DrawNotification(false, false)
    -- TaskPlayAnim(GetPlayerPed(-1), "timetable@gardener@smoking_joint", "idle_cough", 8.0, 8.0, -1, 50, 0, false, false, false)
        -- Citizen.Wait(3000)
      -- ClearPedSecondaryTask(GetPlayerPed(-1))

   -- end
  -- end
-- end)

-- Citizen.CreateThread(function()
-- while true do

     -- local chanstillfrisk = math.random(900000, 1800000) -- Chance d'être la santé par vous-même

    -- Citizen.Wait(chanstillfrisk)

    -- if ill then
    -- ill = false

    -- end
  -- end
-- end)

--trucs antibiotiques
-- RegisterNetEvent('esx_pharmacyv2:frisk')
-- AddEventHandler('esx_pharmacyv2:frisk', function()
  -- ill = false
  -- end)
