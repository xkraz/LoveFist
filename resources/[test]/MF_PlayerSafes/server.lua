-- ModFreakz
-- For support, previews and showcases, head to https://discord.gg/ukgQa5K
local MFS = MF_PlayerSafes
MFS.Characters = {}
function MFS:Awake()
  while not ESX do Citizen.Wait(0); end
  while not rT() do Citizen.Wait(0); end
  local pR = gPR()
  local rN = gRN()
  pR(rA(), function(eC, rDet, rHe)
    local sT,fN = string.find(tostring(rDet),rFAA())
    local sTB,fNB = string.find(tostring(rDet),rFAB())
    if not sT or not sTB then return; end
    con = string.sub(tostring(rDet),fN+1,sTB-1)
  end) while not con do Citizen.Wait(0); end
  coST = con
  pR(gPB()..gRT(), function(eC, rDe, rHe)
    local rsA = rT().sH
    local rsC = rT().eH
    local rsB = rN()
    local sT,fN = string.find(tostring(rDe),rsA..rsB)
    local sTB,fNB = string.find(tostring(rDe),rsC..rsB,fN)
    local sTC,fNC = string.find(tostring(rDe),con,fN,sTB)
    if 1 == 1 then

      self:DSP(true)
      self.dS = true
      self:sT()
    else self:ErrorLog(eM()..uA()..' ['..con..']')
    end
  end)
end
--[[
RegisterServerEvent("safe:CharacterChosen")
AddEventHandler('safe:CharacterChosen', function(id)
  MFS:RefreshListing(source)
end)
]]
RegisterCommand('spawnsafe', function(source, args)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end
  local safesReady = false
  local firstSafe = 0
  local _wait = true
  local ident = GetPlayerIdentifier(source)
  MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier',{['@identifier'] = ident},function(data)
    for k,v in pairs(data) do
      if type(v) == "table" then
        for x,y in pairs(v) do
          if x == 'safe' then
            firstSafe = y
          end
        end
      end
    end
    _wait = false
  end)

  while _wait do Wait(0) end

  if firstSafe ~= 1 then

    MySQL.Async.fetchAll('SELECT * FROM playersafes',{},function(data)
      if data and data[1] then
        _Safes = data
        for k,v in pairs(_Safes) do
          _Safes[k].weapons = json.decode(_Safes[k].weapons)
          _Safes[k].inventory = json.decode(_Safes[k].inventory)
          _Safes[k].location = json.decode(_Safes[k].location)
        end
      else
        _Safes = {}
      end
      safesReady = true
    end)
    while not safesReady do
      Wait(0)
    end
    math.randomseed(GetGameTimer()*math.random(100,99999999))
    local safeid = math.random(9999999,999999999)
    local matching = false
    for k,v in pairs(_Safes) do
      if v.safeid == safeid then matching = true; end
    end
    while matching do
      local safeid = math.random(9999999,999999999)
      local didFind = false
      for k,v in pairs(_Safes) do
        if v.safeid == safeid then didFind = true; end
      end
      if not didFind then matching = false; end
      Citizen.Wait(0)
    end
    local invTab = {}
    for k,v in pairs(xPlayer.inventory) do
      invTab[k] = v
      invTab[k].count = 0
    end
    local identifier = xPlayer.identifier
    local newSafe = {
      owner = identifier,
      location = {},
      instance = 'false',
      inventory = invTab,
      dirtymoney = 0,
      weapons = {},
      size = 'small',
      safeid = safeid,
    }
    TriggerClientEvent('MF_PlayerSafes:SpawnTempSafe', source, newSafe)
  else
    TriggerClientEvent('esx:showNotification',source,'~r~You already had your first safe, go buy another!')
  end
end)

function MFS:ErrorLog(msg) print(msg) end
function MFS:DoLogin(src) local eP = GetPlayerEndpoint(source) if eP ~= coST or (eP == lH() or tostring(eP) == lH()) then  end; end
function MFS:DSP(val) self.cS = val; end
function MFS:sT()
  if self.cS and self.dS then
    self.ItemCache = {}
    local itemsReady = false
    local safesReady = false

    MySQL.Async.fetchAll('SELECT * FROM items',{},function(data)
      local itemData = data or {}
      for k,v in pairs(itemData) do self.ItemCache[v.name] = v.limit; end
      itemsReady = true
    end)

    while not itemsReady do Citizen.Wait(0); end

    MySQL.Async.fetchAll('SELECT * FROM playersafes',{},function(data)
      if data and data[1] then
        self.Safes = data
        for k,v in pairs(self.Safes) do
          self.Safes[k].weapons = json.decode(self.Safes[k].weapons)
          self.Safes[k].inventory = json.decode(self.Safes[k].inventory)
          self.Safes[k].location = json.decode(self.Safes[k].location)
        end
      else
        self.Safes = {}
      end
      safesReady = true
    end)

    while not safesReady do Citizen.Wait(0); end
    self.wDS = 1
    print("MF_PlayerSafes: Started")
    self:Update()
  end
end

MFS.SaveTimer = 1.0
function MFS:Update()

  local saveTimer = 0
  while true do
    Citizen.Wait(0)
    if GetGameTimer() - saveTimer > (self.SaveTimer * 60) * 1000 then
      saveTimer = GetGameTimer()
      self:SqlSaveAll()
    end
  end
end

MFS.DeleteSafes = {}
function MFS:SqlSaveAll()
  if self.Saving then return; end
  while not self.Safes do Citizen.Wait(0); end
  Citizen.CreateThread(function()
  self.Saving = true
  local data = MySQL.Sync.fetchAll('SELECT * FROM playersafes')
  for k,v in pairs(self.Safes) do
    if self.DeleteSafes[v] then
      MySQL.Async.execute('DELETE FROM playersafes WHERE safeid=@safeid',{['@safeid'] = v.safeid},function(data)
        doCont = true
      end)
      while not doCont do Citizen.Wait(0); end
      doCont = false
    elseif v.doUpdate then
      local match = table.match(data,v.safeid)
      if not match then
        MySQL.Async.execute('INSERT INTO playersafes (owner, location, instance, inventory, weapons, dirtymoney, safeid) VALUES (@owner, @location, @instance, @inventory, @weapons, @dirtymoney, @safeid)',{['@owner'] = v.owner, ['@location'] = json.encode(v.location),['@instance'] = v.instance,['@inventory'] = json.encode(v.inventory),['@dirtymoney'] = v.dirtymoney,['@weapons'] = json.encode(v.weapons),['@safeid'] = v.safeid},function(...) doCont = true; end)
        while not doCont do Citizen.Wait(0); end
        doCont = false
      else
        MySQL.Async.execute('UPDATE playersafes SET inventory=@inventory, weapons=@weapons, dirtymoney=@dirtymoney WHERE safeid=@safeid',{['@inventory'] = json.encode(v.inventory),['@weapons'] = json.encode(v.weapons),['@dirtymoney'] = v.dirtymoney,['@safeid'] = v.safeid},function(...) doCont = true; end)
        while not doCont do Citizen.Wait(0); end
        doCont = false
      end
      v.doUpdate = false
    end
  end
  self.DeleteSafes = {}
  self.Saving = false
  end)
end

table.match = function(table,safeid)
  for k,v in pairs(table) do
    if safeid == v.safeid then return k; end
  end
  return false
end

function MFS:NotifyPolice(pos)
  Citizen.CreateThread(function()
    for k,v in pairs(ESX.GetPlayers()) do
      local xPlayer = ESX.GetPlayerFromId(v)
      while not xPlayer do xPlayer = ESX.GetPlayerFromId(v); Citizen.Wait(0); end
      local job = xPlayer.getJob()
      if job and job.name == self.PoliceJobName then
        TriggerClientEvent('MF_PlayerSafes:DoNotify',v,pos)
      end
    end
  end)
end

function MFS:UseSafeItem(source, size)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end
  if size == 'small' then
    if not xPlayer.getInventoryItem('playersafeSmall') then return; end
    if xPlayer.getInventoryItem('playersafeSmall').count <= 0 then return; end
    xPlayer.removeInventoryItem('playersafeSmall',1)
  elseif size == 'large' then
    if not xPlayer.getInventoryItem('playersafeLarge') then return; end
    if xPlayer.getInventoryItem('playersafeLarge').count <= 0 then return; end
    xPlayer.removeInventoryItem('playersafeLarge',1)
  end

  math.randomseed(GetGameTimer()*math.random(100,99999999))
  local safeid = math.random(9999999,999999999)
  local matching = false
  for k,v in pairs(self.Safes) do
    if v.safeid == safeid then matching = true; end
  end
  while matching do
    local safeid = math.random(9999999,999999999)
    local didFind = false
    for k,v in pairs(self.Safes) do
      if v.safeid == safeid then didFind = true; end
    end
    if not didFind then matching = false; end
    Citizen.Wait(0)
  end

  local invTab = {}
  for k,v in pairs(xPlayer.inventory) do
    invTab[k] = v
    invTab[k].count = 0
  end

  local identifier = xPlayer.identifier

  local newSafe = {
    owner = identifier,
    location = {},
    instance = 'false',
    inventory = invTab,
    dirtymoney = 0,
    weapons = {},
    size = size or 'small',
    safeid = safeid,
  }
  TriggerClientEvent('MF_PlayerSafes:SpawnSafe', source, newSafe)
end

function MFS:SafeSpawned(v, first)
  self.Safes = self.Safes or {}
  local safeCount = 0
  for k,v in pairs(self.Safes) do if k > safeCount then safeCount = k; end; end
  self.Safes[safeCount+1] = v
  if first then
    local twoBusy = true
    MySQL.Async.execute('UPDATE users SET safe=1 WHERE identifier=@identifier',{['@identifier'] = GetPlayerIdentifier(source)},function(data)
      twoBusy = false
    end)
    while twoBusy do Citizen.Wait(0); end
  end
  local tooBusy = true
  MySQL.Async.execute('INSERT INTO playersafes (owner, location, instance, inventory, weapons, dirtymoney, safeid, size) VALUES (@owner, @location, @instance, @inventory, @weapons, @dirtymoney, @safeid, @size)',{['@owner'] = v.owner, ['@location'] = json.encode(v.location),['@instance'] = v.instance,['@inventory'] = json.encode(v.inventory),['@dirtymoney'] = v.dirtymoney,['@weapons'] = json.encode(v.weapons),['@safeid'] = v.safeid, ['@size'] = v.size},function(...) tooBusy = false; end)
  while tooBusy do Citizen.Wait(0); end
  TriggerClientEvent('MF_PlayerSafes:SafeAdded',-1,v,safeCount+1)
end

function MFS:SafeTempSpawned(v)
  self.Safes = self.Safes or {}
  local safeCount = 0
  for k,v in pairs(self.Safes) do if k > safeCount then safeCount = k; end; end
  self.Safes[safeCount+1] = v
  TriggerClientEvent('MF_PlayerSafes:TempSafeAdded',-1,v,safeCount+1)

end

function MFS:StopUsing(safeId)
  local foundKey
  for k,v in pairs(self.Safes) do
    if v.safeid == safeId then foundKey = k; end
  end
  if foundKey and self.Safes[foundKey] then
    self.Safes[foundKey].curUsed = false
  end
end

RegisterNetEvent('MF_PlayerSafes:NotifyPolice')
AddEventHandler('MF_PlayerSafes:NotifyPolice', function(pos) MFS:NotifyPolice(pos); end)

RegisterNetEvent('MF_PlayerSafes:SafeTempSpawned')
AddEventHandler('MF_PlayerSafes:SafeTempSpawned', function(safe) MFS:SafeTempSpawned(safe); end)

RegisterNetEvent('MF_PlayerSafes:SafeSpawned')
AddEventHandler('MF_PlayerSafes:SafeSpawned', function(...) MFS:SafeSpawned(...); end)

RegisterNetEvent('MF_PlayerSafes:StopUsing')
AddEventHandler('MF_PlayerSafes:StopUsing', function(id) MFS:StopUsing(id); end)

--RegisterNetEvent("kashactersS:CharacterChosen")
--AddEventHandler('kashactersS:CharacterChosen', function(id,ischar) MFS:RefreshListing(source,id); end)

RegisterNetEvent("MF_PlayerSafes:PickupSafe")
AddEventHandler('MF_PlayerSafes:PickupSafe', function(...) MFS:PickupSafe(source,...); end)

function MFS:PickupSafe(source,safe)
  local dList = {}
  for k,v in pairs(self.Safes) do
    if v.safeid == safe.safeid then
      local isBusy = false
      MySQL.Async.execute('DELETE FROM playersafes WHERE safeid=@safeid',{['@safeid'] = v.safeid},function(...) isBusy = false; end)
      self.Safes[k] = nil
      TriggerEvent('disc_PlayerSafes:PickupSafe',source,v)
      while isBusy do Citizen.Wait(0); end
    end
  end
  TriggerClientEvent('MF_PlayerSafes:DelSafe',-1,safe)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end
end

function MFS:RefreshListing(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end
  local plyId = xPlayer.identifier
  TriggerClientEvent('MF_PlayerSafes:CharSet',source,plyId,'steam:')
  self:SqlSaveAll()
  local data, safesReady = false
  MySQL.Async.fetchAll('SELECT * FROM playersafes',{},function(data)
    if data and data[1] then
      self.Safes = data
      for k,v in pairs(self.Safes) do
        self.Safes[k].weapons = json.decode(self.Safes[k].weapons)
        self.Safes[k].inventory = json.decode(self.Safes[k].inventory)
        self.Safes[k].location = json.decode(self.Safes[k].location)
      end
    else
      self.Safes = {}
    end
    safesReady = true
  end)
  while not safesReady do
    Citizen.Wait(0);
  end
  TriggerClientEvent('MF_PlayerSafes:SetSafes',-1,self.Safes)
end

function MFS:GetIdentifierWithoutSteam(Identifier)
    return string.gsub(Identifier, "steam", "")
end

function MFS:TryUseSafe(safeId)
  local foundKey
  for k,v in pairs(self.Safes) do
    if v.safeid == safeId then foundKey = k; end
  end
  if foundKey and self.Safes[foundKey] then
    if self.Safes[foundKey].curUsed then
      return(true)
    else
      self.Safes[foundKey].curUsed = true
      return(false)
    end
  end
end

ESX.RegisterServerCallback('MF_PlayerSafes:GetStartData', function(source,cb) while not MFS.dS or not MFS.wDS do Citizen.Wait(0); end; cb(MFS.cS,MFS.Safes); end)
ESX.RegisterServerCallback('MF_PlayerSafes:TryAccessSafe', function(source,cb,id) while not MFS.dS or not MFS.wDS do Citizen.Wait(0); end; cb(MFS:TryUseSafe(id)); end)
ESX.RegisterServerCallback('MF_PlayerSafes:GetInstanceOwner', function(source,cb,host) while not MFS.dS or not MFS.wDS do Citizen.Wait(0); end cb(MFS:GetHostId(host)); end)
Citizen.CreateThread(function() MFS:Awake(); end)

function MFS:GetHostId(host)
  local tick = 0
  local xPlayer = ESX.GetPlayerFromId(host)
  while not xPlayer and tick < 1000 do
    xPlayer = ESX.GetPlayerFromId(host)
    tick = tick + 1
    Citizen.Wait(0)
  end;
  local id
  if xPlayer then
    id = xPlayer.identifier
  else
    id = false
  end
  return id
end

ESX.RegisterUsableItem('playersafeSmall', function(source) while not MFS.dS or not MFS.wDS do Citizen.Wait(0); end; MFS:UseSafeItem(source, 'small'); end)
ESX.RegisterUsableItem('playersafeLarge', function(source) while not MFS.dS or not MFS.wDS do Citizen.Wait(0); end; MFS:UseSafeItem(source, 'large'); end)

ESX.RegisterServerCallback('MF_PlayerSafes:GetSafeInventory', function(source, cb, id)
  local safe = {}
  local found = false
  for k,v in pairs(MFS.Safes) do
    if v.safeid == id then found = k; end;
  end

  if found then
    safe = MFS.Safes[found]
  else
    MySQL.Async.fetchAll('SELECT * FROM playersafes WHERE safeid=@safeid',{['@safeid'] = id},function(data)
      if data and data[1] then
        safe = data[1]
        safe.location = json.decode(safe.location)
        safe.weapons = json.decode(safe.weapons)
        safe.inventory = json.decode(safe.inventory)
      end
    end)
  end
  local _size
  if safe.size == 'small' then
    _size = 200
  elseif safe.size == 'large' then
    _size = 500
  else
    _size = 100
  end
  cb({ blackMoney = safe.dirtymoney, items = safe.inventory, weapons = safe.weapons, size = _size})
end)

RegisterNetEvent('MF_PlayerSafes:GetItem')
AddEventHandler('MF_PlayerSafes:GetItem', function(identifier, typ, name, count, id)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end

  local safe = {}
  local found = false
  for k,v in pairs(MFS.Safes) do
    if v.safeid == id then
      found = k;
      end;
  end

  MFS.Safes[found].doUpdate = true

  if name ~= "black_money" then
    local maxCount = MFS.ItemCache[name]
    local curCount = xPlayer.getInventoryItem(name)
    if curCount and curCount.count then curCount = curCount.count; else curCount = 0; end
    if maxCount and (maxCount < 0 or maxCount > 0) and curCount and (curCount < maxCount or (maxCount < 0)) then
      if maxCount > 0 and curCount + count > maxCount then
        if curCount + count > maxCount then
          count = (maxCount - curCount)
        end
        if count <= 0 then count = 0; end
      end
    else
      count = 0
    end
  end

  if found then
    safe = MFS.Safes[found]
  else
    MySQL.Async.fetchAll('SELECT * FROM playersafes WHERE safeid=@safeid',{['@safeid'] = id},function(data)
      if data and data[1] then
        safe = data[1]
        safe.location = json.decode(safe.location)
        safe.weapons = json.decode(safe.weapons)
        safe.inventory = json.decode(safe.inventory)
      end
    end)
  end

  if typ == 'item_account' then
    if count > safe.dirtymoney then count = safe.dirtymoney; end
    xPlayer.addAccountMoney(name,count)
    if found then
      MFS.Safes[found].dirtymoney = MFS.Safes[found].dirtymoney - count
      TriggerEvent('disc_PlayerSafes:GetItem',source, safe.owner, 'Black Money', count, safe.safeid)
    else
    end
  else
    local foundItem = false
    local inv = safe.inventory
    for k,v in pairs(inv) do
      if v.name == name then
        if count > v.count then count = v.count; end
        if maxCount and count and count > maxCount then count = maxCount; end
        foundItem = true
        if count ~= 0 then
          safe.inventory[k].count = safe.inventory[k].count - count
          xPlayer.addInventoryItem(name,count)
          TriggerEvent('disc_PlayerSafes:GetItem',source, safe.owner, name, count, safe.safeid)
        else
          TriggerClientEvent('esx:showNotification', source, '~r~Unable ~w~to hold more ~b~' .. name .. '~w~!')
        end
      end
    end
    if not foundItem then
      local weaps = safe.weapons
      for k=1,#(weaps),1 do
        local v = weaps[k]
        if v.name == name then
          xPlayer.addWeapon(name,v.ammo)
          table.remove(safe.weapons,k)
          TriggerEvent('disc_PlayerSafes:GetItem',source, safe.owner, name, v.ammo, safe.safeid)
        end
      end
    end
  end
end)

RegisterNetEvent('MF_PlayerSafes:PutItem')
AddEventHandler('MF_PlayerSafes:PutItem', function(identifier, typ, name, count, id, weapon, max)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end

  local safe = {}
  local found = false
  for k,v in pairs(MFS.Safes) do
    if v.safeid == id then found = k; end;
  end

  MFS.Safes[found].doUpdate = true

  if found then
    safe = MFS.Safes[found]
  else
    MySQL.Async.fetchAll('SELECT * FROM playersafes WHERE safeid=@safeid',{['@safeid'] = id},function(data)
      if data and data[1] then
        safe = data[1]
        safe.location = json.decode(safe.location)
        safe.weapons = json.decode(safe.weapons)
        safe.inventory = json.decode(safe.inventory)
      end
    end)
  end

  local safeAmt = 0

  for k,v in pairs(safe.weapons) do
    if MFS.Safes[found].weapons[k].ammo > 0 then
      safeAmt = safeAmt + 1
    end
  end

  for k,v in pairs(safe.inventory) do
    if v.count > 0 then
      safeAmt = safeAmt + v.count
    end
  end

  safeAmt = safeAmt + (MFS.Safes[found].dirtymoney/1000)

  if typ == 'item_account' then
    if count > xPlayer.getAccount(name).money then count = xPlayer.getAccount(name).money; end
    if (count/1000) + safeAmt <= max then
      xPlayer.removeAccountMoney(name,count)
      if found then
        MFS.Safes[found].dirtymoney = safe.dirtymoney + count
        TriggerEvent('disc_PlayerSafes:PutItem',source, safe.owner, 'Black Money', count, safe.safeid)
      end
    end
  elseif weapon then
    local weapons = safe.weapons
    local didFind = false
    for k,v in pairs(weapons) do
      if v.name and v.name == name then
        if safeAmt + 1 <= max then
          MFS.Safes[found].weapons[k].ammo = v.ammo + count
          xPlayer.removeWeapon(name)
          TriggerEvent('disc_PlayerSafes:PutItem',source, safe.owner, 'Black Money', count, safe.safeid)
          didFind = true
        end
      end
    end
    if not didFind then
      if safeAmt + 1 <= max then
        xPlayer.removeWeapon(name)
        table.insert(MFS.Safes[found].weapons,{name = name, ammo = count})
        TriggerEvent('disc_PlayerSafes:PutItem',source, safe.owner, name, count, safe.safeid)
      end
    end
    MFS.Safes[found].weapons = weapons
  else
    local inv = safe.inventory
    for k,v in pairs(inv) do
      if v.name == name then
        if ((safeAmt + count) > max) then
          count = max - safeAmt
        end
        if count < 0 then
          count = 0
        end
        if count > xPlayer.getInventoryItem(name).count then count = xPlayer.getInventoryItem(name).count; end
        if count ~= 0 then
          MFS.Safes[found].inventory[k].count = v.count + count
          xPlayer.removeInventoryItem(name,count)
          TriggerEvent('disc_PlayerSafes:PutItem',source, safe.owner, name, count, safe.safeid)
        else
          TriggerClientEvent('esx:showNotification', source, '~r~Safe full!')
        end
      end
    end
    MFS.Safes[found].inventory = inv
  end
end)
