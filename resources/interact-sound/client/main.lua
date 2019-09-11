-- ##############################################################
-- #                                                            #
-- # IF YOU ADD A SOUND IT MUST BE IN OGG FORMAT                #
-- # ADD TO THE THREE ARRAYS BELOW THE NAME OF THE AUDIO FILE   #
-- # _sounds    ~ THE LENGTH THE AUDIO FILE                     #
-- #  length : THE millisecond LENGTH OF THE SOUND FILE         #
-- #  volume : TO TURN DOWN LOUD SOUNDS AND TUNE THEM           #
-- #  fallOff.min/max : IS THE SOUND FALLOFF RANGE;             #
-- #  - IF PLAYERS DISTANCE IS LESS THEN MIN, THE VOLUME IS MAX #
-- #  - IF THE PLAYER IS IN A RANGE OF MAX,                     #
-- #  - vOLUME IS SET BY DISTANCE SCALED BY MIN TO MAX          #
-- #                                                            #
-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- $$$$$$$$$$$$$$$ SERVER EVENTS YOU CAN CALL $$$$$$$$$$$$$$$$$$$
-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- #                                                            #
-- # PlaySoundAt   loc, _min, _max, soundFile                   #
-- # PlaySoundOn   _ent, _min, _max, soundFile                  #
-- # PlayLoopAt    loc, _min, _max, soundFile                   #
-- # StopLoopAt    loc                                          #
-- # PlayLoopFor   loc, _min, _max, soundFile, loopLength       #
-- # PlayLoopOn    _ent, _min, _max, soundFile                  #
-- # StopLoopOn    _ent                                         #
-- # PlayLoopOnFor _ent, _min, _max, soundFile, loopLength      #
-- # StopLoopAll                                                #
-- #                                                            #
-- ##############################################################

_sounds = {
  bankAlarm = {
    length = 11980,
    volume = 0.05,
    fallOff = {
      min = 10,
      max = 50
    }
  },
  jewelryAlarm = {
    length = 2500,
    volume = 0.5,
    fallOff = {
      min = 10,
      max = 50
    }
  },
  item_chips = {
    length = 1320,
    volume = 1.0,
    fallOff = {
      min = 1,
      max = 5
    }
  },
  item_cuffs = {
    length = 1700,
    volume = 0.7,
    fallOff = {
      min = 1,
      max = 5
    }
  },
  ambient_farm = {
    length = 16620,
    volume = 0.5,
    fallOff = {
      min = 5,
      max = 50
    }
  },
  ambient_hawk = {
    length = 3700,
    volume = 1.0,
    fallOff = {
      min = 5,
      max = 100
    }
  },
  ambient_siren = {
    length = 7500,
    volume = 0.7,
    fallOff = {
      min = 10,
      max = 50
    }
  }
}

local sounds = {}

function _addSound(loc,_minn,_maxx,_sound,_length,_loop)
  local location = loc
  local sound = _sound
  local _min = _minn
  local _max = _maxx
  local length = _length
  local loop = _loop
  table.insert(sounds,{
    ID = math.floor(location.x*100)..math.floor(location.y*100),
    firtStart = GetGameTimer(),
    playing = false,
    location = location,
    _min = _min,
    _max = _max,
    sound = sound,
    length = length,
    loop = _loop,
    loopLength = -1,
    startTime = GetGameTimer(),
    played = false
  })
end

function _addLoop(loc,_minn,_maxx,_sound,_length,_loop,_loopLength)
  local location = loc
  local sound = _sound
  local _min = _minn
  local _max = _maxx
  local length = _length
  local loop = _loop
  local loopLength = _loopLength
  table.insert(sounds,{
    ID = math.floor(location.x*100)..math.floor(location.y*100),
    firtStart = GetGameTimer(),
    playing = false,
    location = location,
    _min = _min,
    _max = _max,
    sound = sound,
    length = length,
    loop = loop,
    loopLength = loopLength,
    startTime = GetGameTimer(),
    played = false
  })
end

function _addSoundOn(_entt,_minn,_maxx,_sound,_length,_loop)
  local _enttc = GetEntityCoords(_entt)
  local sound = _sound
  local _min = _minn
  local _max = _maxx
  local length = _length
  local loop = _loop
  table.insert(sounds,{
    ID = _entt,
    firtStart = GetGameTimer(),
    playing = false,
    location = _enttc,
    _min = _min,
    _max = _max,
    sound = sound,
    length = length,
    loop = loop,
    loopLength = -1,
    startTime = GetGameTimer(),
    played = false,
    entity = _entt
  })
end

function _addLoopOn(_entt,_minn,_maxx,_sound,_length,_loopLength)
  local _enttc = GetEntityCoords(_entt)
  local sound = _sound
  local _min = _minn
  local _max = _maxx
  local length = _length
  local loopLength = _loopLength
  table.insert(sounds,{
    ID = _entt,
    firtStart = GetGameTimer(),
    playing = false,
    location = _enttc,
    _min = _min,
    _max = _max,
    sound = sound,
    length = length,
    loop = true,
    loopLength = loopLength,
    startTime = GetGameTimer(),
    played = false,
    entity = _entt
  })
end

Citizen.CreateThread(function()
  local volume = 0
  local wasPlaying = false
  local lastVol = {}
  local _lastUpdate = GetGameTimer()
  while true do
    local lc = GetEntityCoords(GetPlayerPed(PlayerId()))
    for k,v in pairs(sounds) do

      local dist  = Vdist(lc.x, lc.y, lc.z, v.location.x, v.location.y, v.location.z)

      if not v.playing and not v.played and not (dist > v._max) then
        if v.entity ~= nil then
          v.location = GetEntityCoords(v.entity)
          dist  = Vdist(lc.x, lc.y, lc.z, v.location.x, v.location.y, v.location.z)
        end

        if dist < v._min then
          volume = 1.0
        elseif dist > v._max then
          volume = 0.0
        else
          volume = math.floor(100 - ((dist - v._min)*100)/(v._max - v._min))/100
        end

        if (GetGameTimer() - v.startTime <= 50) and (GetGameTimer() - v.startTime < v.length) then
          SendNUIMessage({
              playerID = '' .. v.ID,
              transactionType     = 'playSound',
              transactionFile     = v.sound,
              volume   = volume * _sounds[v.sound].volume
          })
        else
          TriggerServerEvent('dbug', 'PlaySound|SoundSeek|' .. v.ID ..'| ' .. math.floor(dist) .. ' away, ran: ' .. (GetGameTimer() - v.startTime))

          SendNUIMessage({
              playerID = '' .. v.ID,
              transactionType     = 'seek',
              transactionFile     = v.sound,
              seek     = GetGameTimer() - v.startTime,
              volume   = volume * _sounds[v.sound].volume
          })
        end

        lastVol[v.ID] = volume
        v.playing = true
        v.played = true
      end


      if v.playing then

        if GetGameTimer() - v.startTime <= v.length and (GetGameTimer() - _lastUpdate) > 50 then
          if v.entity ~= nil then
            v.location = GetEntityCoords(v.entity)
            dist  = Vdist(lc.x, lc.y, lc.z, v.location.x, v.location.y, v.location.z)
          end
          if dist < v._min then
            volume = 1.0 * _sounds[v.sound].volume
          elseif dist > v._max then
            volume = 0.0 * _sounds[v.sound].volume
          else
            volume =  math.floor(100 - ((dist - v._min)*100)/(v._max - v._min))/100 * _sounds[v.sound].volume
          end

          if volume ~= lastVol[v.ID] then
            if (dist > v._max) then
              SendNUIMessage({
                  playerID = '' .. v.ID,
                  transactionType     = 'setVolume',
                  volume   = 0
              })
              lastVol[v.ID] = 0
            else
              SendNUIMessage({
                  playerID = '' .. v.ID,
                  transactionType     = 'setVolume',
                  volume   = volume
              })
              lastVol[v.ID] = volume
            end
          end

          _lastUpdate = GetGameTimer()

        elseif (GetGameTimer() - v.startTime > v.length) then
          v.playing = false
        end
      elseif v.loop then
          if (GetGameTimer() - v.startTime) > v.length or v.loopLength == -1 then
            if v.loopLength ~= -1 and (GetGameTimer() - v.firtStart) > v.loopLength then
              TriggerServerEvent('dbug', 'PlaySound|SoundsLoop|KillSound|IN| ' .. v.loopLength .. ', ' .. v.length)
              v.playing = false
              SendNUIMessage({
                  playerID = '' .. v.ID,
                  transactionType     = 'stop'
              })
              table.remove(sounds,k)
              TriggerServerEvent('dbug', 'PlaySound|SoundsLoop|KillSound|OUT| ' .. #sounds)
            elseif (GetGameTimer() - v.startTime) > v.length then
              v.playing = false
              v.played = false
              v.startTime = GetGameTimer()
              TriggerServerEvent('dbug', 'PlaySound|SoundsLoop|RESTART| ' .. v.startTime)
            end
          end
      else
        if (GetGameTimer() - v.startTime) > v.length then
          TriggerServerEvent('dbug', 'PlaySound|NoLoop|KillSound|IN| ' ..GetGameTimer() - v.startTime .. ', ' .. v.length)
          v.playing = false
          SendNUIMessage({
              playerID = '' .. v.ID,
              transactionType     = 'stop'
          })
          table.remove(sounds,k)
          TriggerServerEvent('dbug', 'PlaySound|NoLoop|KillSound|OUT| ' .. #sounds)
        end
      end
      --DrawText3D(v.location, math.floor(dist) .. ' away; Volume: ' .. tonumber(volume) .. '; Time ran: ' .. GetGameTimer() - v.startTime .. '; Loop: ' .. tostring(v.loop))
    end
    Citizen.Wait(10)
  end
end)

RegisterCommand('bank',  function(source, args)
  TriggerEvent("bankstartalarm", "blainecounty")
end)

RegisterCommand('play',  function(source, args)
  if args[1] ~= nil then
    if args[1] == 'list' then
      local txt = ''
      for k,v in pairs(_sounds) do
        if k ~= _sounds[#sounds] then
          txt = txt .. k ..', '
        else
          txt = txt .. k ..'.'
        end
      end
      TriggerEvent("chatMessage", "", {190,190,190},txt)
      TriggerEvent("chatMessage", "", {190,235,235}, "Plays a sounds on your end at your location to see the diffrent sounds.")
    else
      for k,v in pairs(_sounds) do
        if args[1] == k then
          TriggerServerEvent('dbug', 'PlaySound|COMMAND|play : ' .. args[1])
          _addSound(GetEntityCoords(PlayerPedId()), v.fallOff.min, v.fallOff.max, args[1], v.length, false)
          return
        end
      end
      TriggerEvent("chatMessage", "", {255,0,0}, "Sound not found! {CASE SENSITIVE}")
    end
  end
end)

RegisterNetEvent('PlaySoundAt')
AddEventHandler('PlaySoundAt', function(loc, _min, _max, soundFile)
  for k,v in pairs(_sounds) do
    if soundFile == k then
      _addSound(loc, _min, _max, soundFile, v.length, false)
      return
    end
  end
end)

RegisterNetEvent('PlaySoundOn')
AddEventHandler('PlaySoundOn', function(_ent, _min, _max, soundFile)
  for k,v in pairs(_sounds) do
    if soundFile == k then
      _addSoundOn(_ent, _min, _max, soundFile, v.length, false)
      return
    end
  end
end)

RegisterNetEvent('PlayLoopAt')
AddEventHandler('PlayLoopAt', function(loc, _min, _max, soundFile)
  for k,v in pairs(_sounds) do
    if soundFile == k then
      _addSound(loc, _min, _max, soundFile, v.length, true)
      return
    end
  end
end)

RegisterNetEvent('StopLoopAt')
AddEventHandler('StopLoopAt', function(loc)
  for k,v in pairs(sounds) do
    if v.location == loc then
      v.loop = false
      return
    end
  end
end)

-- PLAYLOOPFOR loopLength == how long to loop for

RegisterNetEvent('PlayLoopFor')
AddEventHandler('PlayLoopFor', function(loc, _min, _max, soundFile, loopLength)
  for k,v in pairs(_sounds) do
    if soundFile == k then
      _addLoop(loc, _min, _max, soundFile, v.length, true, loopLength)
      return
    end
  end
end)

-- PLAYLOOPON loopLength == how long to loop for

RegisterNetEvent('PlayLoopOn')
AddEventHandler('PlayLoopOn', function(_ent, _min, _max, soundFile)
  for k,v in pairs(_sounds) do
    if soundFile == k then
      _addSoundOn(_ent, _min, _max, soundFile, v.length, true)
      return
    end
  end
end)

RegisterNetEvent('StopLoopOn')
AddEventHandler('StopLoopOn', function(_ent)
  for k,v in pairs(sounds) do
    if v.entity == _ent then
      v.loop = false
      return
    end
  end
end)

RegisterNetEvent('PlayLoopOnFor')
AddEventHandler('PlayLoopOnFor', function(_ent, _min, _max, soundFile, loopLength)
  for k,v in pairs(_sounds) do
    if soundFile == k then
      _addLoopOn(_ent, _min, _max, soundFile, v.length, loopLength)
      return
    end
  end
end)

RegisterNetEvent('StopLoopAll')
AddEventHandler('StopLoopAll', function()
  for k,v in pairs(sounds) do
      v.startTime = GetGameTimer()
      v.loop = false
  end
end)

function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)

    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 10, 10, 255)
    SetTextOutline()

    AddTextComponentString(text)
    DrawText(_x, _y)
end
