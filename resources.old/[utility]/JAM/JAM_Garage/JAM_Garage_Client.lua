local JAG = JAM.Garage
-------------------------------------------
--#######################################--
--##                                   ##--
--##      Blip and Marker Updates      ##--
--##                                   ##--
--#######################################--
-------------------------------------------
local ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
end)

function JAG:UpdateMarkers()
  if not self or not self.Config or not self.Config.Markers then return; end

  for key,val in pairs(self.Config.Markers) do
    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), val.Pos.x, val.Pos.y, val.Pos.z) < self.Config.MarkerDrawDistance then
      DrawMarker(val.Type, val.Pos.x, val.Pos.y, val.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, val.Scale.x, val.Scale.y, val.Scale.z, val.Color.r, val.Color.g, val.Color.b, 100, false, true, 2, false, false, false, false)
    end
  end
end

function JAG:SetBlips()
  if not self or not self.Config or not self.Config.Blips then return; end

  for key,val in pairs(self.Config.Blips) do
    local blip = AddBlipForCoord(val.Pos.x, val.Pos.y, val.Pos.z)
    SetBlipSprite               (blip, val.Sprite)
    SetBlipDisplay              (blip, val.Display)
    SetBlipScale                (blip, val.Scale)
    SetBlipColour               (blip, val.Color)
    SetBlipAsShortRange         (blip, true)
    SetBlipHighDetail           (blip, true)
    BeginTextCommandSetBlipName ("STRING")
    AddTextComponentString      (val.Zone)
    EndTextCommandSetBlipName   (blip)
  end
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##       Check player position       ##--
--##        relevant to markers        ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function JAG:CheckPosition()
  if not self or not self.Config or not self.Config.Markers then return; end

  self.StandingInMarker = self.StandingInMarker or false
  self.CurrentGarage = self.CurrentGarage or {}

  local standingInMarker = false

  for key,val in pairs(self.Config.Markers) do
    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), val.Pos.x, val.Pos.y, val.Pos.z) < val.Scale.x then
      self.CurrentGarage = val
      standingInMarker = true
    end
  end

  if standingInMarker and not self.StandingInMarker then
    self.StandingInMarker = true
    self.ActionData = ActionData or {};
    self.ActionData.Action = self.CurrentGarage.Zone
    self.ActionData.Message = 'Press ~INPUT_PICKUP~ to open the ~b~' .. (self.CurrentGarage.Zone:sub(1,1):lower()..self.CurrentGarage.Zone:sub(2)) .. '~s~.'
  end

  if not standingInMarker and self.StandingInMarker then
    self.StandingInMarker = false
    self.ActionData.Action = false
    self.ESX.UI.Menu.CloseAll()
  end
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##        Check for input if         ##--
--##           inside marker           ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function JAG:CheckInput()
  if not self or not self.ActionData then return; end

  self.Timer = self.Timer or 0

  if self.ActionData.Action ~= false then
    SetTextComponentFormat('STRING')
    AddTextComponentString(self.ActionData.Message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)

    if IsControlPressed(0, JUtils.Keys['E']) and (GetGameTimer() - self.Timer) > 150 then
      self:OpenGarageMenu(self.ActionData.Action)
      self.ActionData.Action = false
      self.Timer = GetGameTimer()
    end
  end
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##            Garage Menu            ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function JAG:OpenGarageMenu(zone)
  if not self or not self.ESX or not self.Config then return; end

  self.ESX.UI.Menu.CloseAll()

  local elements = {}
  local price = 0

  if zone == 'Impound' and self.Config.ImpoundCost > 0 then
    str = zone .. ' fee: $' .. self.Config.ImpoundCost
  else
    str = zone
  end

  labelStr = "Store Vehicle"

  table.insert(elements,{label = "List Vehicles", value = zone .. "_List"})
  table.insert(elements,{label = labelStr, value = zone .. "_Vehicle"})

  self.ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), zone .. '_Menu',
    {
      title = str,
      align = 'top-left',
      elements = elements,
    },

    function(data, menu)
      menu.close()
      if string.find(data.current.value, "_List") then
        self:OpenVehicleList(zone)
      end

      if string.find(data.current.value, "_Vehicle") then
        self:StoreVehicle(zone, price)
      end
    end,
    function(data, menu)
      menu.close()
      self.ActionData.Action = self.CurrentGarage.Zone
    end
  )
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##         Vehicle List Menu         ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function JAG:OpenVehicleList(zone)
if not self or not self.ESX or not ESX then return; end

self.ESX.UI.Menu.CloseAll()
local elements = {}
ESX.TriggerServerCallback('JAG:GetVehicles', function(vehicles)
  ESX.TriggerServerCallback('getDetails', function(dets)
    for key,val in pairs(vehicles) do
      local done = false
      for x,y in pairs(dets) do
        if val.plate == y.plate then
          local labelvehicle
          if val.state == 1 then
            local hashVehicle = val.vehicle.model
            local vehiclePlate = val.plate
            local vehicleName = GetDisplayNameFromVehicleModel(hashVehicle)

            local charp = GetEntityCoords(GetPlayerPed(PlayerId()))
            local disty

            if y.loc.x == 0 and y.loc.y == 0 then
              disty = 0
            else
              disty = GetDistanceBetweenCoords(charp.x, charp.y, 0, y.loc.x, y.loc.y, 0, false)
            end
            if disty <= 10 then
              local _ehealth,_bhealth,_thealth,_fuel
              if y.damage.engine >= 850.0 then
                _ehealth = ' | <span style="font-weight:bold;color:green;">Engine</span>'
              elseif y.damage.engine <= 849.9  and y.damage.engine >= 650.0 then
                _ehealth = ' | <span style="font-weight:bold;color:orange;">Engine</span>'
              else
                _ehealth = ' | <span style="font-weight:bold;color:red;">Engine</span>'
              end

              if y.damage.body >= 850.0 then
                _bhealth = ' | <span style="font-weight:bold;color:green;">Body</span>'
              elseif y.damage.body <= 849.9  and y.damage.body >= 650.0 then
                _bhealth = ' | <span style="font-weight:bold;color:orange;">Body</span>'
              else
                _bhealth = ' | <span style="font-weight:bold;color:red;">Body</span>'
              end

              if y.damage.tank >= 850.0 then
                _thealth = ' | <span style="font-weight:bold;color:green;">Tank</span>'
              elseif y.damage.tank <= 849.9  and y.damage.tank >= 650.0 then
                _thealth = ' | <span style="font-weight:bold;color:orange;">Tank</span>'
              else
                _thealth = ' | <span style="font-weight:bold;color:red;">Tank</span>'
              end

              if y.fuel >= 75.0 then
                _fuel = ' | <span style="font-weight:bold;color:green;">Fuel</span>'
              elseif y.fuel <= 74.9  and y.fuel >= 30.0 then
                _fuel = ' | <span style="font-weight:bold;color:orange;">Fuel</span>'
              else
                _fuel = ' | <span style="font-weight:bold;color:red;">Fuel</span>'
              end

              labelvehicle = '<span style="font-weight:bold;font-size: 12pt;">' .. string.upper(string.sub(vehicleName,1,7)) .. ': ' .. ' </span><span style="font-weight:bold;color:green;">Garage</span>' .. _ehealth .. _bhealth .. _thealth .. _fuel
            else
              local _car = y
              TriggerServerEvent('setGarage', _car, ESX.GetPlayerData().job.name)
              labelvehicle = '<span style="font-weight:bold;font-size: 12pt;">' .. string.upper(string.sub(vehicleName,1,7)) .. ': ' .. ' </span><span style="font-weight:bold;color:red;">Not in this garage! (' .. Round(disty) .. ')</span>'
              local closestGarage = 999999
              local closestLoc
              local _loc = y.loc
              for key,val in pairs(self.Config.Markers) do
                local dist = GetDistanceBetweenCoords(_loc.x,_loc.y,_loc.z, val.Pos.x, val.Pos.y, val.Pos.z, false)
                if dist < closestGarage then
                  closestGarage = dist
                  closestLoc = val.Pos
                end
              end
              --MySQL.Sync.execute("UPDATE owned_vehicles SET jamstate=@state WHERE plate=@plate",{['@state'] = state , ['@plate'] = plate})

              table.insert(elements, {label =labelvehicle , value = {state = 4, x = closestLoc.x, y = closestLoc.y}})
              val.state = 4
              done = true
              break
            end
          elseif val.state == 2 then
            local hashVehicle = val.vehicle.model
            local vehiclePlate = val.plate
            local vehicleName = GetDisplayNameFromVehicleModel(hashVehicle)
            labelvehicle = '<span style="font-weight:bold;font-size: 12pt;">' .. string.upper(string.sub(vehicleName,1,7)) .. ': ' .. '  </span><span style="font-weight:bold;color:orange;">Impound</span>'
          else
            local hashVehicle = val.vehicle.model
            local vehicleName = GetDisplayNameFromVehicleModel(hashVehicle)
            labelvehicle = '<span style="font-weight:bold;font-size: 12pt;">' .. string.upper(string.sub(vehicleName,1,7)) .. ': ' .. ' </span><span style="font-weight:bold;color:red;">Out</span>'
          end

          table.insert(elements, {label =labelvehicle , value = val})
          done = true
          break
        end
      end
      if not done then
        local labelvehicle
        TriggerServerEvent('createDetails', val)
        labelvehicle = '<span style="font-weight:bold;font-size: 12pt;">' .. string.upper(string.sub(GetDisplayNameFromVehicleModel(val.vehicle.model),1,7)) .. ': ' .. ' </span><span style="font-weight:bold;color:green;">Garage|Engine|Body|Tank|Fuel</span>'
        table.insert(elements, {label =labelvehicle , value = val})
      end
    end
    labelvehicle = '<span style="font-weight:bold;">Exit</span>'
    table.insert(elements, {label =labelvehicle , value = {state = 5}})
    self:LoadVehicles(vehicles)
    self.ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'Spawn_Vehicle',
    {
      title    = zone,
      align    = 'top',
      elements = elements,
    },

    function(data, menu)
      if zone == 'Garage' then
          if data.current.value.state == 1 then
            menu.close()
            JAG:SpawnVehicle(data.current.value.vehicle, zone)
          elseif data.current.value.state == 4 then
            menu.close()
            SetWaypointOff()SetNewWaypoint(data.current.value.x, data.current.value.y)
            TriggerEvent('esx:showNotification', "~p~Waypoint ~w~set to car's garage!~s~")
          elseif data.current.value.state == 5 then
            menu.close()
            JAG:CheckPosition()
          else
            TriggerEvent('esx:showNotification', 'Your vehicle ~r~is not in the garage.~s~')
          end
      end

      if zone == 'Impound' then
        if data.current.value.state == 2 then
          local playerData = ESX.GetPlayerData()
          if playerData.money >= self.Config.ImpoundCost then
              JAG:SpawnVehicle(data.current.value.vehicle, zone)
          else
              TriggerEvent('esx:showNotification', "You ~r~don't have enough money.~s~")
          end
          menu.close()
        else
          TriggerEvent('esx:showNotification', 'Your vehicle ~r~is not impounded.~s~')
        end
      end
      self:UnloadVehicles(vehicles)
    end,

    function(data, menu)
      menu.close()
      self:UnloadVehicles(vehicles)
      self:OpenGarageMenu(zone)
    end
)
end)
end)
end

function JAG:LoadVehicles(vehicles)
  for k,v in pairs(vehicles) do
    while not HasModelLoaded(v.vehicle.model) do
      RequestModel(v.vehicle.model)
      Citizen.Wait(0)
    end
  end
end

function JAG:UnloadVehicles(vehicles)
  for k,v in pairs(vehicles) do
    if HasModelLoaded(v.vehicle.model) then
      SetModelAsNoLongerNeeded(v.vehicle.model)
    end
  end
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##      Spawn vehicle function       ##--
--##                                   ##--
--#######################################--
-------------------------------------------
function JAG:SpawnVehicle(vehicle, zone)
  if not self or not self.ESX or not ESX then return; end
  self.DrivenVehicles = self.DrivenVehicles or {}
  vehicle.health = nil
  ESX.Game.SpawnVehicle(vehicle.model,{
  x=self.CurrentGarage.Pos.x,
  y=self.CurrentGarage.Pos.y,
  z=self.CurrentGarage.Pos.z + 1,
  },self.CurrentGarage.Heading, function(callback_vehicle)
  self.ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
  SetVehRadioStation(callback_vehicle, "OFF")
  --TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
  --table.insert(self.DrivenVehicles, {vehicle = callback_vehicle})

  --while GetVehiclePedIsIn(PlayerPedId(), false) == 0 do Citizen.Wait(100) end
  --local vehicleId = GetVehiclePedIsIn(PlayerPedId(), false)
  --SetEntityAsMissionEntity(GetVehicleAttachedToEntity(vehicleId), true, true)

  local vehicleProps = self.ESX.Game.GetVehicleProperties(callback_vehicle)
  local _model = GetEntityModel(callback_vehicle)
  local _plate = vehicleProps.plate

  TriggerServerEvent('JAG:ChangeState', vehicleProps.plate, 0)
  if zone == 'Impound' then TriggerServerEvent('JAG:FinePlayer', self.Config.ImpoundCost); end
  self.ActionData.Action = self.CurrentGarage.Zone

  end)

  ESX.TriggerServerCallback('getDetails', function(data)
    local coords    = GetEntityCoords(GetPlayerPed(PlayerId()))
    local _data
    local vehicleId = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    local _plate = self.ESX.Game.GetVehicleProperties(vehicleId)
    for k,v in pairs(data) do
      if v.plate == _plate.plate then
        _data = v
      end
    end

    SetVehicleEngineHealth(vehicleId, _data.damage.engine*1.0)
    SetVehicleBodyHealth(vehicleId,_data.damage.body*1.0)

    if _data.damage.body < 950 then
      SmashVehicleWindow(vehicleId,7)
      SmashVehicleWindow(vehicleId,6)
    end

    if _data.damage.body < 800 then
      SetVehicleDoorBroken(vehicleId,4, true)
      SetVehicleDoorBroken(vehicleId,5, true)
      for i=0,3 do
        SmashVehicleWindow(vehicleId,i)
      end
    end

    if _data.damage.body < 600 then
      SetVehicleDoorBroken(vehicleId,2, true)
      SetVehicleDoorBroken(vehicleId,3, true)
    end
    if _data.damage.body < 400 then
      SetVehicleDoorBroken(vehicleId,0, true)
      SetVehicleDoorBroken(vehicleId,1, true)
    end

    SetVehiclePetrolTankHealth(vehicleId, _data.damage.tank*1.0)icleId))

    SetVehicleFuelLevel(vehicleId,_data.fuel*1.0)
    DecorSetFloat(vehicleId, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicleId))

    if _data.headlight ~= 255 then
      if not IsToggleModOn(vehicleId, 22) then
        ToggleVehicleMod(vehicleId,  22, 1)
      end
      SetVehicleHeadlightsColour(vehicleId, _data.headlight)
    end
    local carDim = GetModelDimensions(GetHashKey(vehicleId), 0.0, 10.0)
    local offLoc = GetOffsetFromEntityInWorldCoords(vehicleId, carDim.x, 0, 0)
    SetEntityCoords(GetPlayerPed(-1), offLoc.x, offLoc.y, offLoc.z)
    TaskEnterVehicle(GetPlayerPed(-1), vehicleId, 5000, -1, 1.0, 3, 0)
    --TaskLeaveVehicle(ped,vehicle,0)
    --TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicleId, -1)
    table.insert(self.DrivenVehicles, {vehicle = vehicleId})

    while GetVehiclePedIsIn(PlayerPedId(), false) == 0 do Citizen.Wait(100) end
    local vId = GetVehiclePedIsIn(PlayerPedId(), false)
    SetEntityAsMissionEntity(GetVehicleAttachedToEntity(vId), true, true)
  end)
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##      Store vehicle function       ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function JAG:StoreVehicle(zone, price)
  if not self or not self.CurrentGarage or not ESX or not self.ESX then return; end
  TriggerEvent('JAG:NeonOn')
  local playerPed = GetPlayerPed(PlayerId())
  local vehicle = GetLastDrivenVehicle(playerPed)
  local storage
  if not vehicle then return; end

  if price and price > 0 then
    local playerData = ESX.GetPlayerData()
    if playerData.money and playerData.money > price then
      TriggerServerEvent('JAG:FinePlayer', price)
    else return; end
  end

  local vehicleProps = self.ESX.Game.GetVehicleProperties(vehicle)
  local maxPassengers = GetVehicleMaxNumberOfPassengers(vehicle)
  local MyPed = GetPlayerPed(-1)
  local MyPedVeh = GetVehiclePedIsIn(GetPlayerPed(-1),false)

  if MyPedVeh == 0 or MyPedVeh == nil then
    return
  end
  local PlateVeh = GetVehicleNumberPlateText(MyPedVeh)

  for seat = -1,maxPassengers-1,1 do
    local ped = GetPedInVehicleSeat(vehicle,seat)
    if ped and ped ~= 0 then TaskLeaveVehicle(ped,vehicle,0); end
  end

  while true do
    if not IsPedInVehicle(GetPlayerPed(PlayerId()), vehicle, false) then
      if zone == 'Impound' then
        storage = 2
        veh.pos = self.Config.Markers['CityImpound'].Pos
        TriggerEvent('esx:showNotification', 'The vehicle has been sent to ~r~Impound!~s~')
      else
        storage = 1
        TriggerEvent('esx:showNotification', 'The vehicle has been stored.~s~')
      end
      ESX.TriggerServerCallback('JAG:StoreVehicle', function(valid)
        local pos
        for key,val in pairs(self.Config.Markers) do
          if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), val.Pos.x, val.Pos.y, val.Pos.z) < val.Scale.x then
            pos = {
              x = val.Pos.x,
              y = val.Pos.y
            }
          end
        end

        if pos.x == nil then
          pos = GetEntityCoords(MyPedVeh)
        end

        local model = GetEntityModel(MyPedVeh)
        local veh = {
    			model = model,
    			plate = PlateVeh,
    			fuel = GetVehicleFuelLevel(MyPedVeh),
    			damage = {
            body = GetVehicleBodyHealth(MyPedVeh) ,
            engine = GetVehicleEngineHealth(MyPedVeh),
            tank = GetVehiclePetrolTankHealth(MyPedVeh)
    			},
    			loc = {
    				x = pos.x,
    				y = pos.y
    			},
    			headlight = GetVehicleHeadlightsColour(MyPedVeh)
    		}
        TriggerEvent('setDetails', veh)
        TriggerServerEvent('storedCar',veh)
        DeleteVehicle(vehicle)
        TriggerEvent('JAG:NeonOnDone')
      end, vehicleProps, storage)

      self.ActionData.Action = self.CurrentGarage.Zone
      break
    end
    Citizen.Wait(0)
  end
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##      Vehicle Check Function       ##--
--##     This automatically sends      ##--
--##    vehicles back to the garage    ##--
--##      when they are likely to      ##--
--##       be trapped in "limbo"       ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function JAG:LoginCheck()
  if not ESX then return; end
  ESX.TriggerServerCallback('JAG:GetVehicles', function(vehicles)
    for key,val in pairs(vehicles) do
      if val.state == 0 or val.state == nil then
        TriggerServerEvent('JAG:ChangeState', val.plate, 1)
      end
    end
  end)
end

function JAG:VehicleCheck()
  if not self or not self.ESX or not ESX then return; end
  self.DrivenVehicles = self.DrivenVehicles or {}
  for key,val in pairs(self.DrivenVehicles) do
    local canDelete = true
    local vehicleProps = self.ESX.Game.GetVehicleProperties(val.vehicle)
    local maxPassengers = GetVehicleMaxNumberOfPassengers(val.vehicle)

    for k,v in pairs(val) do
      if v == GetLastDrivenVehicle(PlayerPedId(), 0) then
          canDelete = false
      end
    end

    for seat = -1,maxPassengers-1,1 do
      if not IsVehicleSeatFree(val.vehicle, seat) then canDelete = false; end
    end

    if canDelete then
      print('CLIENT: UPDATE ON DELETE')
      ESX.TriggerServerCallback('JAG:StoreVehicle', function(valid)
        if valid and GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(val.vehicle)) > self.Config.VehicleDespawnDistance then
          ESX.Game.DeleteVehicle(val.vehicle)
        end
      end, vehicleProps,1)
    end
  end
end

-------------------------------------------
--#######################################--
--##                                   ##--
--##        Garage Update Thread       ##--
--##                                   ##--
--#######################################--
-------------------------------------------

function JAG:Start()
  if not self then return; end
  if not ESX then
    while not ESX do Citizen.Wait(100); end
    self.ESX = ESX
  end

  while not ESX.IsPlayerLoaded() do Citizen.Wait(100); end
  TriggerServerEvent('JAG:Startup')

  self:LoginCheck()

  self:SetBlips()

  self:Update()
end

function JAG:Update()
  if not self then return; end
  while true do
    self.tick = (self.tick or 0) + 1
    self:UpdateMarkers()
    self:CheckInput()

    if self.tick % 100 == 1 then
      self:CheckPosition()
    end

    if self.tick % 1000 == 1 then
      self:VehicleCheck()
    end

    Citizen.Wait(0)
  end
end

local _debug = false
local _debugAll = false
function dbug(str)
	if _debug then
		TriggerServerEvent('dbug', str)
	end
end

function dbugAll(str)
	if _debugAll then
		TriggerServerEvent('dbug', str)
	end
end

Citizen.CreateThread(function(...) JAG:Start(...); end)
