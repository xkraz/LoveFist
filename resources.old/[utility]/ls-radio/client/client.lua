
--===============================================================================
--=== Stworzone przez Alcapone aka suprisex. Zakaz rozpowszechniania skryptu! ===
--===================== na potrzeby LS-Story.pl =================================
--===============================================================================


-- ESX

ESX = nil
local PlayerData                = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
end)

Citizen.CreateThread(function()

  while ESX == nil do
    Citizen.Wait(100)
  end

  while true do
      local playerName = GetPlayerName(PlayerId())
      if ESX ~= nil and ESX.GetPlayerData().inventory ~= nil then
        for k, v in pairs(ESX.GetPlayerData().inventory) do
          if v.name == 'radio' then
            if v.count == 0 then
              local data = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")
              if tonumber(data) ~= nil then
                print('Leave Channel')
                TriggerEvent('removePlayerFromRadio', data)
                exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
                exports['mythic_notify']:DoHudText('inform', Config.messages['you_leave'] .. data .. 'MHz </b>')
                TriggerEvent('tokoupdate')
              end
            end
          end
        end
      end
    Citizen.Wait(1000)
	end
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


local radioMenu = false

function PrintChatMessage(text)
    TriggerEvent('chatMessage', "system", { 255, 0, 0 }, text)
end

function enableRadio(enable)

  for k, v in pairs(ESX.GetPlayerData().inventory) do
    if v.name == 'radio' then
      if v.count >= 1 then
        SetNuiFocus(true, true)
        radioMenu = enable

        SendNUIMessage({

          type = "enableui",
          enable = enable

        })
      else
        ESX.ShowNotification('~r~You dont own a radio!')
      end
    end
  end
end

--- sprawdza czy komenda /radio jest włączony
TriggerEvent('chat:addSuggestion', '/radio', 'Join radio <channel> (Leave blank to open radio)', {
{ name="Channel", help="Leave blank to open radio!" }
})

RegisterCommand('radio', function(source, args)
if Config.enableCmd then
  if args[1] == nil then
    enableRadio(true)
  else
    local playerName = GetPlayerName(PlayerId())

    for k, v in pairs(ESX.GetPlayerData().inventory) do
      if v.name == 'radio' then
        if v.count > 0 then
          local PlayerData = ESX.GetPlayerData(PlayerId())
          local playerName = GetPlayerName(PlayerId())
          local chan = tonumber(args[1])
          local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

          if chan == nil then
            TriggerEvent('esx:showNotification', '~r~Radio requires a "number" to join channel!')
            return -1
          end
          if chan <= Config.RestrictedChannels then
            if(PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'fib'or PlayerData.job.name == 'warrant') then

              if getPlayerRadioChannel ~= nil and tonumber(getPlayerRadioChannel) ~= nil then
                if  getPlayerRadioChannel ~= "nil" then
                  exports['mythic_notify']:DoHudText('inform', Config.messages['you_leave'] .. getPlayerRadioChannel .. 'MHz </b>')
                end
                TriggerEvent('removePlayerFromRadio', getPlayerRadioChannel)
              end

              exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(chan), true);
              exports.tokovoip_script:addPlayerToRadio(tonumber(chan))
              exports['mythic_notify']:DoHudText('inform', Config.messages['joined_to_radio'] .. chan .. 'MHz </b>')

            elseif not (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'fire') then
              --- info że nie możesz dołączyć bo nie jesteś policjantem
              exports['mythic_notify']:DoHudText('error', Config.messages['restricted_channel_error'])
            end
          end

          if chan > Config.RestrictedChannels then
              if getPlayerRadioChannel ~= nil and tonumber(getPlayerRadioChannel) ~= nil then
                if  getPlayerRadioChannel ~= "nil" then
                  exports['mythic_notify']:DoHudText('inform', Config.messages['you_leave'] .. getPlayerRadioChannel .. 'MHz </b>')
                end
                TriggerEvent('removePlayerFromRadio', getPlayerRadioChannel)
              end
              exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(chan), true);
              exports.tokovoip_script:addPlayerToRadio(tonumber(chan))
              exports['mythic_notify']:DoHudText('inform', Config.messages['joined_to_radio'] .. chan .. 'MHz </b>')
          end
        else
          ESX.ShowNotification('~r~You dont own a radio!')
        end
      end
    end
  end
end
end, false)


-- radio test

RegisterCommand('radiotest', function(source, args)
  local playerName = GetPlayerName(PlayerId())
  local data = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

  print(tonumber(data))

  if tonumber(data) == nil then
    exports['mythic_notify']:DoHudText('inform', Config.messages['not_on_radio'])
  else
   exports['mythic_notify']:DoHudText('inform', Config.messages['on_radio'] .. data .. 'MHz </b>')
 end

end, false)

RegisterCommand('radioleave', function(source, args)
  while ESX == nil do
    Citizen.Wait(100)
  end

  local playerName = GetPlayerName(PlayerId())
  local data = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

  if tonumber(data) ~= nil then
    print('Leave Channel')
    TriggerEvent('removePlayerFromRadio', data)
    exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
    exports['mythic_notify']:DoHudText('inform', Config.messages['you_leave'] .. data .. 'MHz </b>')
    TriggerEvent('tokoupdate')
  end
end, false)

-- dołączanie do radia

RegisterNUICallback('joinRadio', function(data, cb)
    local _source = source
    local PlayerData = ESX.GetPlayerData(_source)
    local playerName = GetPlayerName(PlayerId())
    local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

    if tonumber(data.channel) ~= tonumber(getPlayerRadioChannel) and data.channel ~= nil then
        if tonumber(data.channel) <= Config.RestrictedChannels then
          if(PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'fib'or PlayerData.job.name == 'warrant') then

            if getPlayerRadioChannel ~= nil then
              if  getPlayerRadioChannel ~= "nil" then
                exports['mythic_notify']:DoHudText('inform', Config.messages['you_leave'] .. getPlayerRadioChannel .. 'MHz </b>')
              end
              TriggerEvent('removePlayerFromRadio', getPlayerRadioChannel)
            end

            exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
            exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel))
            exports['mythic_notify']:DoHudText('inform', Config.messages['joined_to_radio'] .. data.channel .. 'MHz </b>')

          elseif not (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'fire') then
            --- info że nie możesz dołączyć bo nie jesteś policjantem
            exports['mythic_notify']:DoHudText('error', Config.messages['restricted_channel_error'])
          end

        end
        if tonumber(data.channel) > Config.RestrictedChannels then

          if getPlayerRadioChannel ~= nil then
            if  getPlayerRadioChannel ~= "nil" then
              exports['mythic_notify']:DoHudText('inform', Config.messages['you_leave'] .. getPlayerRadioChannel .. 'MHz </b>')
            end
            TriggerEvent('removePlayerFromRadio', getPlayerRadioChannel)
          end

          exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
          exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel))
          exports['mythic_notify']:DoHudText('inform', Config.messages['joined_to_radio'] .. data.channel .. 'MHz </b>')
        end
      elseif data.channel ~= nil then
        --exports['mythic_notify']:DoHudText('error', Config.messages['you_on_radio'] .. data.channel .. 'MHz </b>')
      end
      enableRadio(false)
      SetNuiFocus(false, false)
      --[[
    exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
    exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
    exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel))
    --PrintChatMessage("radio: " .. data.channel)
   -- print('radiook')

    cb('ok')
	]]
end)

-- opuszczanie radia

RegisterNUICallback('leaveRadio', function(data, cb)
   local playerName = GetPlayerName(PlayerId())
   local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

    if getPlayerRadioChannel ~= "nil" then
      if getPlayerRadioChannel >= 0 then
        TriggerEvent('removePlayerFromRadio', getPlayerRadioChannel)
        exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
        exports['mythic_notify']:DoHudText('inform', Config.messages['you_leave'] .. getPlayerRadioChannel .. 'MHz </b>')
      end
    end

   cb('ok')

end)

RegisterNUICallback('escape', function(data, cb)

    enableRadio(false)
    SetNuiFocus(false, false)


    cb('ok')
end)

-- net eventy

RegisterNetEvent('ls-radio:use')
AddEventHandler('ls-radio:use', function()
  enableRadio(true)
end)

Citizen.CreateThread(function()
    while true do
        if radioMenu then
            DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
            DisableControlAction(0, 2, guiEnabled) -- LookUpDown
            DisableControlAction(0, 24, guiEnabled) -- Attack
      			DisableControlAction(0, 257, guiEnabled) -- Attack 2
      			DisableControlAction(0, 25, guiEnabled) -- Aim
      			DisableControlAction(0, 263, guiEnabled) -- Melee Attack 1
            DisableControlAction(0, 47, guiEnabled)  -- Disable weapon
      			DisableControlAction(0, 264, guiEnabled) -- Disable melee
      			DisableControlAction(0, 257, guiEnabled) -- Disable melee
      			DisableControlAction(0, 140, guiEnabled) -- Disable melee
      			DisableControlAction(0, 141, guiEnabled) -- Disable melee
      			DisableControlAction(0, 142, guiEnabled) -- Disable melee
      			DisableControlAction(0, 143, guiEnabled) -- Disable melee
            DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride

            if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
                SendNUIMessage({
                    type = "click"
                })
            end
        end
        Citizen.Wait(0)
    end
end)
