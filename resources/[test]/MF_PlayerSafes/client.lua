-- ModFreakz
-- For support, previews and showcases, head to https://discord.gg/ukgQa5K

local MFS = MF_PlayerSafes
local spawning = false
local removing = false

function MFS:Awake(...)
    while not ESX do Citizen.Wait(0); end
    while not ESX.IsPlayerLoaded() do Citizen.Wait(0); end
    self.PlayerData = ESX.GetPlayerData()
    ESX.TriggerServerCallback('MF_PlayerSafes:GetStartData', function(retVal,retData) self.dS = true; self.cS = retVal; self:Start(retData); end)
end

function MFS:Start(data)
  while not ESX do Citizen.Wait(0); end
  while not ESX.IsPlayerLoaded() do Citizen.Wait(0); end
  self.Safes = data or {}
  self.SpawnedSafes = {}
  if self.dS and self.cS then self:Update(); end
end

function MFS:Update()
  local ownerText = "Press [~r~E~s~] to access your safe.\nPress [~r~G~s~] to pick up the safe."
  local notOwnerText = "Press [~r~E~s~] to try and crack the safe."
  while true do
    Citizen.Wait(0)
    if self.UsingSafe and self.NUIClosed then
      TriggerServerEvent('MF_PlayerSafes:StopUsing',self.UsingSafe.safeid)
      self.UsingSafe = false
    end
    local closestSafe,closestDist = self:GetClosestSafe()
    if closestDist and closestDist < self.DrawTextDist and not self.UsingSafe and ((not self.Instance and closestSafe.instance == 'false') or (self.Instance and self.Instance == closestSafe.instance)) and not spawning and not removing then
      local text = ''
      local isOwner = false

      if (closestSafe.owner and closestSafe.owner == self.PlayerData.identifier) then
        text = ownerText
        isOwner = true
      else
        text = notOwnerText
      end
      local match = false
      for k,v in pairs(self.SpawnedSafes) do
        if type(v) ~= 'boolean' then
          if v.id == closestSafe.safeid then match = k; end
        end
      end
      local offset = false
      if match then
        if self.SpawnedSafes[match] and self.SpawnedSafes[match].obj then
          local fwd,right,up,pos = GetEntityMatrix(self.SpawnedSafes[match].obj['bkr_prop_biker_safebody_01a'])
          offset = -right/2.8
        end
      end
      local newPos = closestSafe.location
      if offset then newPos = vector3(newPos.x + offset.x,newPos.y + offset.y,newPos.z + offset.z); end
      Utils.DrawText3D(newPos.x,newPos.y,newPos.z, text)
      if IsControlJustPressed(0, 38) and closestDist <= self.InteractDist then
        ESX.TriggerServerCallback('MF_PlayerSafes:TryAccessSafe',function(inUse)
          if inUse then
            ESX.ShowNotification("Somebody else is using this safe.")
          else
            if not isOwner then
              self.NUIClosed = false
              self.UsingSafe = closestSafe
              self.CrackingSafe = closestSafe
              TriggerEvent('MF_SafeCracker:StartMinigame',{},true)
              FreezeEntityPosition(GetPlayerPed(-1),true)
              while self.CrackingSafe do Citizen.Wait(0); end
            else
              self.NUIClosed = false
              self.UsingSafe = closestSafe
              ESX.TriggerServerCallback('MF_PlayerSafes:GetSafeInventory', function(inventory)
                TriggerEvent("esx_inventoryhud:openPropertyInventory", inventory, closestSafe)
              end, closestSafe.safeid)
            end
          end
        end,closestSafe.safeid)
      elseif IsControlJustPressed(0, 58) and closestDist <= self.InteractDist and isOwner then
        self.UsingSafe = closestSafe
        if safeEmpty(closestSafe.safeid) then
          exports['progressBars']:startUI(1000*30, "Removing Safe")
          removing = true
          Citizen.CreateThread(function()
            local tmp = GetGameTimer()
            TriggerEvent('esx:showNotification','Press ~b~X ~w~to cancel!')
            local _ped = GetPlayerPed(PlayerId())
            while GetGameTimer() - tmp < 1000*30 do
              ESX.UI.Menu.CloseAll()
              if IsControlJustPressed(0, 73) then
                TriggerEvent('esx:showNotification','~r~Canceled!')
                self.UsingSafe = false
                removing = false
                return
              end
              if not IsEntityPlayingAnim(_ped, "mini@repair", "fixing_a_ped", 3) then
                TaskTurnPedToFaceCoord(ped, closestSafe.x, closestSafe.y, closestSafe.z, 500)
								TaskPlayAnim(_ped, "mini@repair", "fixing_a_ped", 8.0, -8.0, -1, 0, 0, false, false, false)
							end
              Wait(0)
            end
            removing = false
            TriggerServerEvent('MF_PlayerSafes:PickupSafe',closestSafe)
          end)
        else
          TriggerEvent('esx:showNotification','~r~Safe must be empty to remove!')
        end
        Citizen.Wait(2000)
        self.UsingSafe = false
      end
    end
  end
end

function safeEmpty(id)
  local empty = true
  local checked = false
  ESX.TriggerServerCallback('MF_PlayerSafes:GetSafeInventory', function(inventory)
    for k,v in pairs(inventory) do
      if k == "items" then
        for x,y in pairs(v) do
          if y.count > 0 then
            empty = false
          end
        end
      end
      if k == "weapons" then
        for x,y in pairs(v) do
          if y then
            empty = false
          end
        end
      end
      if k == "blackMoney" then
        if v > 0 then
          empty = false
        end
      end
    end
    checked = true
  end, id)
  while not checked do Citizen.Wait(0) end
  return(empty)
end

function MFS:DestroySafe(safe)
  local rList = {}
  for k,v in pairs(self.SpawnedSafes) do
    if v and v.id and v.id == safe.safeid then
      for k,v in pairs(v.obj) do DeleteObject(v); end
      table.insert(rList,k)
    end
  end
  for k,v in pairs(rList) do self.SpawnedSafes[v] = nil; self.Safes[v] = nil; end
end

function MFS:DestroySafeItem(safe)
  local rList = {}
  TriggerServerEvent('giveSafeBack', 'small')
  for k,v in pairs(self.SpawnedSafes) do
    if v and v.id and v.id == safe.safeid then
      for k,v in pairs(v.obj) do DeleteObject(v); end
      table.insert(rList,k)
    end
  end
  for k,v in pairs(rList) do self.SpawnedSafes[v] = nil; self.Safes[v] = nil; end

end

function MFS:EndMinigame(didWin)
  if not self.CrackingSafe then return; end
  FreezeEntityPosition(GetPlayerPed(-1),false)
  local safe = self.CrackingSafe
  if didWin then
    ESX.TriggerServerCallback('MF_PlayerSafes:GetSafeInventory', function(inventory)
      TriggerEvent("esx_inventoryhud:openPropertyInventory", inventory, safe)
    end, safe.safeid)
    self.NUIClosed = false
    self.UsingSafe = safe
    self.CrackingSafe = false
  else
    self.NUIClosed = true
    self.UsingSafe = safe
    self.CrackingSafe = false
  end
end

function MFS:GetClosestSafe()
  local plyPed = GetPlayerPed(-1)
  local plyPos = GetEntityCoords(plyPed)
  local closest,closestDist
  for k,v in pairs(self.Safes) do
    local dist = Utils.GetVecDist(plyPos,v.location)
    if not closestDist or dist < closestDist then
      closest = v
      closestDist = dist
    end
    if dist < self.LoadSafeDist and not self.SpawnedSafes[k] and ((not self.Instance and v.instance == "false") or (self.Instance and v.instance and self.Instance == v.instance)) then
      self:SpawnThisSafe(k,v.location)
    elseif dist > self.DespawnDist and self.SpawnedSafes[k] then
      for key,val in pairs(self.SpawnedSafes[k].obj) do DeleteObject(val); end
      self.SpawnedSafes[k] = false
    end
  end
  if closestDist then return closest,closestDist
  else return false,999999
  end
end

function MFS:SpawnThisSafe(key,pos)
  local safeData = self.Safes[key]
  local plyPed = GetPlayerPed(-1)
  local forward,right,up,pPos = GetEntityMatrix(plyPed)
  local nPos = vector3(pos.x,pos.y,pos.z - 0.9)
  TriggerEvent('MF_SafeCracker:SpawnSafe', false, nPos, safeData.location.heading, function(safe)
    self.SpawnedSafes[key] = { obj = safe, id = safeData.safeid }
  end)
  while not self.SpawnedSafes[key] do Citizen.Wait(0); end
end

function MFS:DoNotifyPolice(pos)
  Citizen.CreateThread(function()
    local timer = GetGameTimer()
    local nearStreet = GetStreetNameFromHashKey(GetStreetNameAtCoord(pos.x,pos.y,pos.z))
    ESX.ShowNotification("Somebody reported suspicious activity at "..nearStreet..". [~g~LEFTALT~s~]")
    local blip = AddBlipForRadius(pos.x,pos.y,pos.z, 100.0)
    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, 1)
    SetBlipAlpha (blip, 128)
    while GetGameTimer() - timer < self.NotifyPoliceTimer * 1000 do
      if IsControlJustPressed(0, 19) then
        SetNewWaypoint(pos.x,pos.y)
      end
    end
    RemoveBlip(blip)
  end)
end

function MFS:EnterInstance(instance)
  ESX.TriggerServerCallback('MF_PlayerSafes:GetInstanceOwner', function(identifier)
    if identifier then self.Instance = identifier; end
  end, instance.host)
  while not self.Instance do Citizen.Wait(0); end
end

function MFS:LeaveInstance(instance)
  self.Instance = false;
  for k,v in pairs(self.Safes) do
    if v.instance and v.instance ~= "false" then
      local safeId = v.safeid
      local match = false
      for k,v in pairs(self.SpawnedSafes) do
        if v and safeId and v.id == safeId then match = k; end
      end
      if match then
        for k,v in pairs(self.SpawnedSafes[match].obj) do DeleteObject(v); end;
        self.SpawnedSafes[match] = nil
      end
    end
  end
end

function MFS:TempSafe(safe)
  local plyPed = GetPlayerPed(-1)
  local forward,right,up,pPos = GetEntityMatrix(plyPed)
  local pos = (pPos + forward * 0.4)
  local offset = pos + (right*0.35)
  local heading = GetEntityHeading(plyPed)
  if self.Instance then safe.instance = self.Instance; end

  safe.location = {x = offset.x, y = offset.y, z = offset.z, heading = heading}
  spawning = true
  TriggerServerEvent('MF_PlayerSafes:SafeTempSpawned',safe)

  local _text = "Press [~b~E~s~] to place your safe.~r~ (PERMANENT)\n~s~Press [~b~G~s~] to pick up and try again."
  local _safeFinal = false
  while not _safeFinal do
    Utils.DrawText3D(pos.x, pos.y, pos.z, _text)
    if IsControlJustPressed(0, 38) then
      TriggerServerEvent('MF_PlayerSafes:SafeSpawned',safe,true)
      TriggerServerEvent('disc_PlayerSafes:SafeSpawned', safe, true)
      _safeFinal = true
    elseif IsControlJustPressed(0, 58) then
      MFS:DestroySafe(safe)
      _safeFinal = true
    end
    local _loc = GetEntityCoords(PlayerPedId())
    if GetDistanceBetweenCoords(_loc.x, _loc.y, _loc.z, pos.x, pos.y, pos.z, true) > 2 then
      MFS:DestroySafe(safe)
      _safeFinal = true
    end
    Wait(10)
  end

  spawning = false
end

function MFS:TempSafeItem(safe)
  local plyPed = GetPlayerPed(-1)
  local forward,right,up,pPos = GetEntityMatrix(plyPed)
  local pos = (pPos + forward * 0.4)
  local offset = pos + (right*0.35)
  local heading = GetEntityHeading(plyPed)
  if self.Instance then safe.instance = self.Instance; end

  safe.location = {x = offset.x, y = offset.y, z = offset.z, heading = heading}
  spawning = true
  TriggerServerEvent('MF_PlayerSafes:SafeTempSpawned',safe)

  local _text = "Press [~b~E~s~] to place your safe.~r~ (PERMANENT)\n~s~Press [~b~G~s~] to pick up and try again."
  local _safeFinal = false
  while not _safeFinal do
    Utils.DrawText3D(pos.x, pos.y, pos.z, _text)
    if IsControlJustPressed(0, 38) then
      TriggerServerEvent('MF_PlayerSafes:SafeSpawned',safe,true)
      TriggerServerEvent('disc_PlayerSafes:SafeSpawned', safe, true)
      _safeFinal = true
    elseif IsControlJustPressed(0, 58) then
      MFS:DestroySafeItem(safe)
      _safeFinal = true
    end
    local _loc = GetEntityCoords(PlayerPedId())
    if GetDistanceBetweenCoords(_loc.x, _loc.y, _loc.z, pos.x, pos.y, pos.z, true) > 2 then
      TriggerServerEvent('MF_PlayerSafes:SafeSpawned',safe,true)
      TriggerServerEvent('disc_PlayerSafes:SafeSpawned', safe, true)
      _safeFinal = true
    end
    Wait(10)
  end

  spawning = false
end

function MFS:SpawnSafe(safe)
  local plyPed = GetPlayerPed(-1)
  local forward,right,up,pPos = GetEntityMatrix(plyPed)
  local pos = (pPos + forward * 0.4)
  local offset = pos + (right*0.4)
  local heading = GetEntityHeading(plyPed)
  if self.Instance then safe.instance = self.Instance; end
  safe.location = {x = offset.x, y = offset.y, z = offset.z, heading = heading}
  TriggerServerEvent('disc_PlayerSafes:SafeSpawned', safe, false)
  TriggerServerEvent('MF_PlayerSafes:SafeSpawned',safe,false)
end

RegisterNetEvent('MF_PlayerSafes:DoNotify')
AddEventHandler('MF_PlayerSafes:DoNotify', function(pos) MFS:DoNotifyPolice(pos); end)

RegisterNetEvent('MF_PlayerSafes:SpawnTempSafe')
AddEventHandler('MF_PlayerSafes:SpawnTempSafe', function(safe) MFS:TempSafe(safe); end)

RegisterNetEvent('MF_PlayerSafes:SpawnSafe')
AddEventHandler('MF_PlayerSafes:SpawnSafe', function(safe) MFS:TempSafeItem(safe); end)

RegisterNetEvent('MF_PlayerSafes:TempSafeAdded')
AddEventHandler('MF_PlayerSafes:TempSafeAdded', function(safe,key) MFS.Safes[key] = safe; end)

RegisterNetEvent('MF_PlayerSafes:SafeAdded')
AddEventHandler('MF_PlayerSafes:SafeAdded', function(safe,key) MFS.Safes[key] = safe; end)

RegisterNetEvent('MF_PlayerSafes:DelSafe')
AddEventHandler('MF_PlayerSafes:DelSafe', function(safe) MFS:DestroySafe(safe); end)

RegisterNetEvent('MF_PlayerSafes:CharSet')
AddEventHandler('MF_PlayerSafes:CharSet', function(id,char) MFS.KashId = id; MFS.CharId = char; end)

RegisterNetEvent('MF_PlayerSafes:SetSafes')
AddEventHandler('MF_PlayerSafes:SetSafes', function(safes) MFS.Safes = safes end)

AddEventHandler('esx_inventoryhud:closeInventory', function() MFS.NUIClosed = true; end)

RegisterNetEvent('instance:onEnter')
AddEventHandler('instance:onEnter', function(instance) while not MFS.Safes do Citizen.Wait(0); end; MFS:EnterInstance(instance); end)

RegisterNetEvent('instance:onLeave')
AddEventHandler('instance:onLeave', function(instance) while not MFS.Safes do Citizen.Wait(0); end; MFS:LeaveInstance(); end)

AddEventHandler('MF_SafeCracker:EndMinigame', function(didWin) MFS:EndMinigame(didWin); end)

Citizen.CreateThread(function() MFS:Awake(); end)
